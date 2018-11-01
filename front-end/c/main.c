/**********************************************************************
 *                               main.c                               *
 **********************************************************************/
/* TODO: 查询后再查询会出错: `Commands out of sync; you can't run this command now`  <2018-11-01, wsxq2> */
/* TODO: 从文件导入数据无法确保用户自定义完整性（因为触发器不能用于`LOAD DATA LOCAL INFILE`） <2018-11-01, wsxq2> */

#include <my_global.h>
#include <mysql.h>
#include <locale.h>
#include <string.h>
#include <signal.h>

#define MAX_NAME_LENTH 30
void finish_with_error(MYSQL *con)
{
	fprintf(stderr, "%s\n", mysql_error(con));
	//char temp[6];
	//sprintf(temp, "%d", mysql_errno(con));
	//perror(temp);
	//mysql_close(con);
	exit(1);        
}

void stop(int signal)
{
	exit(0);
}

void print_result(MYSQL_RES *result)
{
	int num_fields = mysql_num_fields(result);

	MYSQL_ROW row;
	MYSQL_FIELD *field;

	while ((row = mysql_fetch_row(result))) 
	{ 
		for(int i = 0; i < num_fields; i++) 
		{ 
			if (i == 0) 
			{              
				while((field = mysql_fetch_field(result)))
				{
					printf("%-30.30s",  field->name);
				}

				printf("\n");           
			}
			printf("%-30.30s", row[i] ? row[i] : "NULL"); 
		} 
	}

	printf("\n");
}

char *s[8]={"RenYuan", "DuiZhang", "LuDuiZhang", "CheDui", "XianLu", "CheLiang", "SiJi", "WeiZhang"};

void execute_sql(MYSQL *con, const char *sql_statements)
{
	printf("sql_statements = `%s`\n", sql_statements);
	if (mysql_query(con, sql_statements)) {  
		finish_with_error(con);
	}

	if (mysql_info(con) != NULL) {
		printf("mysql_info: %s\n", mysql_info(con));
	}
	MYSQL_RES *result = mysql_store_result(con);

	if (result != NULL) {
		print_result(result);
	}  
	else{
		printf("result is NULL\n");
	}

	mysql_free_result(result);
}

void get_statements(char * temp_str, int insert_data)
{
	temp_str[0]=0;
	strcat(temp_str, "LOAD DATA LOCAL INFILE 'csv/");
	strcat(temp_str,s[insert_data-1]);
	strcat(temp_str,".csv' INTO TABLE ");
	strcat(temp_str, s[insert_data-1]);
	strcat(temp_str, " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;");
}

int main()
{
	MYSQL *con = mysql_init(NULL);

	if (con == NULL) {
		fprintf(stderr, "mysql_init() failed\n");
		exit(1);
	}  
	if (mysql_real_connect(con, "localhost", "wsxq", "658231", "bus", 0, NULL, 0) == NULL) {
		finish_with_error(con);
	} 
	if (mysql_query(con, "set names utf8")) {  
		finish_with_error(con);
	}

	char ch;
	int useful_query, memu, insert_data;
	char temp_str[200]={0};


	printf("说明：本程序是公交安全管理系统的前端，主要有 导入数据 和 常用查询 两个功能，其中导入数据是从 csv 文件中导入。故导入数据时，建议先用 Excel 录入原始数据，再导出为 csv 文件，然后把它们放在 csv 目录下再运行本程序（ csv 目录中放有默认文件用于测试）\n\n");
	signal(SIGINT, stop);
	do {
		printf("请输入数字以实现相应的功能：\n    1. 导入数据    2. 常用查询\n");
		while (scanf("%d", &memu)!=1 || (memu<1 || memu>2)) {
			printf("输入错误，请重新输入（ 1 或 2 ）：\n");
			while ((ch=getchar()!='\n') && ch!=EOF) { }
		}

		if(memu==1){
			printf("请输入数字以导入相应的表，本程序从当前目录下的 csv/ 目录中导入 csv 文件：\n     0.All 1.RenYuan 2.DuiZhang 3.LuDuiZhang 4.CheDui 5.XianLu 6.CheLiang 7.SiJi 8.WeiZhang\n");
			while (scanf("%d", &insert_data)!=1 || (insert_data<0 || insert_data>8)) {
				printf("输入错误，请重新输入（ 0 ~ 8 的整数）：\n");
				while ((ch=getchar()!='\n') && ch!=EOF) { }
			}
			if(insert_data==0){
				for (int i = 1; i <= 8; ++i) {
					get_statements(temp_str, i);
					execute_sql(con, temp_str);
				}
			}
			else{
				get_statements(temp_str, insert_data);
				execute_sql(con, temp_str);
			}
		}
		else if(memu==2){
			printf("请输入数字以执行相应的查询：\n    1. 查询某个车队下的基本信息\n    2. 查询某名司机在某个时间段的违章详细信息\n    3. 查询某个车队在某个时间段的违章统计信息\n");
			while (scanf("%d", &useful_query)!=1 || (useful_query<1 || useful_query>3)) {
				printf("输入错误，请重新输入（ 1 ~ 3 的整数）：\n");
				while ((ch=getchar()!='\n') && ch!=EOF) { }
			}
			while ((ch=getchar()!='\n') && ch!=EOF) { }
			char cheduibianhao[4];
			char name[100]={0},start_time[100]={0},end_time[100]={0};
			temp_str[0]=0;
			switch (useful_query) {
				case 1:
					printf("请输入要查询的车队编号（如 1 ）：\n");
					while (scanf("%3s", cheduibianhao)!=1) {
						printf("输入错误，请重新输入（一个对应的车队编号确实存在的整数）：\n");
						while ((ch=getchar()!='\n') && ch!=EOF) { }
					}
					strcat(temp_str, "CALL get_siji_by_chedui(");
					strcat(temp_str, cheduibianhao);
					strcat(temp_str, ");");
					break;
				case 2:
					printf("请输入要查询的司机名、起始时间和结束时间（如`孟沛凝,2018-01-01 00:00:00,2018-10-01 00:00:00`）：\n");
					while (scanf("%[^,\n],%[^,\n],%[^,\n]", name, start_time, end_time)!=3) {
						printf("输入错误，请重新输入（如`孟沛凝,2018-01-01 00:00:00,2018-10-01 00:00:00`）：\n");
						while ((ch=getchar()!='\n') && ch!=EOF) { }
					}
					strcat(temp_str, "CALL get_weizhang_by_siji_and_datetime('");
					strcat(temp_str, name);
					strcat(temp_str, "', '");
					strcat(temp_str, start_time);
					strcat(temp_str, "', '");
					strcat(temp_str, end_time);
					strcat(temp_str, "');");
					break;
				case 3:
					printf("请输入要查询的车队编号、起始时间和结束时间（如`1,2018-01-01 00:00:00,2018-10-01 00:00:00`）：\n");
					while (scanf("%[^,\n],%[^,\n],%[^,\n]", cheduibianhao, start_time, end_time)!=3) {
						printf("输入错误，请重新输入（如`1,2018-01-01 00:00:00,2018-10-01 00:00:00`）：\n");
						while ((ch=getchar()!='\n') && ch!=EOF) { }
					}
					strcat(temp_str, "CALL get_weizhangtongji_by_chedui_and_datetime(");
					strcat(temp_str, cheduibianhao);
					strcat(temp_str, ", '");
					strcat(temp_str, start_time);
					strcat(temp_str, "', '");
					strcat(temp_str, end_time);
					strcat(temp_str, "');");
					break;
			}
			execute_sql(con, temp_str);
		}
	} while (1);

	mysql_close(con);

	return 0;
}
