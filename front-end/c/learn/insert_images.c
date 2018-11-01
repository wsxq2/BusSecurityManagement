#include <my_global.h>
#include <mysql.h>
#include <string.h>

void finish_with_error(MYSQL *con)
{
  fprintf(stderr, "%s\n", mysql_error(con));
  mysql_close(con);
  exit(1);        
}

int main(int argc, char **argv)
{

  FILE *fp = fopen("woman.jpg", "rb");
  
  if (fp == NULL) 
  {
      fprintf(stderr, "cannot open image file\n");    
      exit(1);
  }
      
  fseek(fp, 0, SEEK_END);
  
  if (ferror(fp)) {
      
      fprintf(stderr, "fseek() failed\n");
      int r = fclose(fp);

      if (r == EOF) {
          fprintf(stderr, "cannot close file handler\n");          
      }    
      
      exit(1);
  }  
  
  int flen = ftell(fp);
  
  if (flen == -1) {
      
      perror("error occurred");
      int r = fclose(fp);

      if (r == EOF) {
          fprintf(stderr, "cannot close file handler\n");
      }
      
      exit(1);      
  }
  
  fseek(fp, 0, SEEK_SET);
  
  if (ferror(fp)) {
      
      fprintf(stderr, "fseek() failed\n");
      int r = fclose(fp);

      if (r == EOF) {
          fprintf(stderr, "cannot close file handler\n");
      }    
      
      exit(1);
  }

  char data[flen+1];

  int size = fread(data, 1, flen, fp);
  
  if (ferror(fp)) {
      
      fprintf(stderr, "fread() failed\n");
      int r = fclose(fp);

      if (r == EOF) {
          fprintf(stderr, "cannot close file handler\n");
      }
      
      exit(1);      
  }
  
  int r = fclose(fp);

  if (r == EOF) {
      fprintf(stderr, "cannot close file handler\n");
  }          
  
  MYSQL *con = mysql_init(NULL);
  
  if (con == NULL)
  {
      fprintf(stderr, "mysql_init() failed\n");
      exit(1);
  }  
    
  if (mysql_real_connect(con, "localhost", "wsxq", "658231", 
          "test", 0, NULL, 0) == NULL) 
  {
      finish_with_error(con);
  }   
    
  char chunk[2*size+1];
  mysql_real_escape_string(con, chunk, data, size);

  char *st = "INSERT INTO Images(Id, Data) VALUES(1, '%s')";
  size_t st_len = strlen(st);

  char query[st_len + 2*size+1]; 
  int len = snprintf(query, st_len + 2*size+1, st, chunk);

  if (mysql_real_query(con, query, len))
  {
      finish_with_error(con);
  }
  
  mysql_close(con);
  exit(0);
}
