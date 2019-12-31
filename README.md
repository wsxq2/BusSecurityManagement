## 公交安全管理系统
* **GitHub**: <https://github.com/wsxq2/BusSecurityManagement>
* **Web前端**: <http://wsxq21.55555.io:8080/> (用户名为：`admin`，密码为：`658231`)
* **相关博客理论部分**: [数据库设计——理论](https://wsxq2.55555.io/blog/2018/10/13/数据库设计-理论)
* **相关博客实践部分**: [数据库设计——实践](https://wsxq2.55555.io/blog/2018/10/13/数据库设计-实践)

### 环境说明
* `CentOS7`: `Linux`发行版之一，最大的优点是稳（所以主要用做服务器），最大的缺点是太稳了（更新贼慢，如`php`）
* `mariadb 5.5.60`: 一个类似于`mysql`但完全开源的数据库
* `httpd 2.4.6(apache)`: Web前端需要
* `php 5.4.16`: Web前端需要

### 目录结构

```
.
├── back-end/ # 数据库后端
│   ├── all.sh* # 使用该脚本一键建立整个系统的数据库：`./all.sh`
│   ├── create_database_and_user.sql*
│   ├── create-table.sql*
│   ├── create_user_info.sql* # 用于web前端网页登陆：admin 658231
│   ├── drop-all-table.sql* 
│   ├── insert-data.sql*
│   ├── procedure_root.sql* # 只包含`export_csv`，在front-end/c/csv/export_csv被使用
│   ├── procedure.sql* # 所有处理需求封装成的过程，一个处理需求对应一个过程
│   ├── delete-all-table.sql* # 在测试 C 语言前端程序时会用到该文件，因为可能需要删除所有的表再用C前端导入
│   └── triggers.sql*
├── ERwin/
│   ├── BusSecurityManagement.erwin* # ERwin 主文件
│   └── BusSecurityManagement.rtb* # report template builder
├── front-end/
│   ├── c/
│   │   ├── bin/
│   │   │   └── main*
│   │   ├── csv/ # csv 文件，在 bin/main 执行时使用以导入所有表的数据
│   │   │   ├── CheDui.csv*
│   │   │   ├── CheLiang.csv*
│   │   │   ├── DuiZhang.csv*
│   │   │   ├── export_csv.sh* # 从当前数据库中导出所有表为 csv 到当前目录下，用于测试
│   │   │   ├── LuDuiZhang.csv*
│   │   │   ├── RenYuan.csv*
│   │   │   ├── SiJi.csv*
│   │   │   ├── WeiZhang.csv*
│   │   │   └── XianLu.csv*
│   │   ├── learn/ # 学习 c-mariadb-api 时看过的文件
│   │   │   ├── bin/
│   │   │   ├── column_headers.c*
│   │   │   ├── createdb.c*
│   │   │   ├── create_populate_table.c*
│   │   │   ├── insert_images.c*
│   │   │   ├── last_inserted_row_id.c*
│   │   │   ├── Makefile* # 用于编译当前目录的所有 c 文件到 ./bin/
│   │   │   ├── muliple_statements.c*
│   │   │   └── retrieving_data.c*
│   │   ├── main.c* # c 前端主文件（其实就这一个源文件）
│   │   ├── Makefile*
│   │   └── .ycm_extra_conf.py* # 用于 vim 中的 YCM 插件（自动补全插件）的配置文件
│   └── web/
│       ├── css/
│       │   └── w3.css*
│       ├── js/
│       │   └── my.js*
│       ├── learn/ # 学习过程中使用的文件
│       │   ├── simple-example/ # 来自 https://blog.csdn.net/L_BestCoder/article/details/51234512
│       │   │   ├── index.php*
│       │   │   ├── login.html*
│       │   │   ├── login.php*
│       │   │   ├── register.html*
│       │   │   └── register.php*
│       │   ├── base_use.php*
│       │   ├── index.html*
│       │   ├── mysql_select.php*
│       │   └── mysql_use.php*
│       ├── gettable.php* # 根据参数获取相应的表
│       ├── index.php* # 默认页面，即登陆页面
│       ├── insertdata.php* # 处理录入数据时的表单
│       ├── login.php* # 处理登陆页面的表单
│       └── main.php* # 登陆后进入的主页面
├── generate-data/ # 产生测试数据
│   ├── bus(master).dgen* # dbForge Data Generator 主文件
│   ├── chinese-name.txt*
│   ├── DataGeneration_20181112-1551.sql*
│   └── zhandian-xian.txt*
├── images/ # 各种图片
│   ├── 公交安全管理系统E-R图.png
│   ├── 公交安全管理系统物理模型.jpeg
│   ├── 公交安全管理系统逻辑模型.jpeg
│   ├── 公交安全管理系统题目要求1.PNG
│   ├── 公交安全管理系统题目要求2.PNG
│   ├── 公交安全管理系统题目要求3.PNG
│   └── 公交安全管理系统题目要求4.PNG
├── .gitignore* # 让 git 不上传的文件
├── README.md* # 本文档
├── upload.sh* # 上传整个项目到服务器上投入实际应用的脚本
└── useful.sql* # 学习过程一些有用的但不常见的 sql 语句
```

### 使用说明
#### 构建数据库
1. 用你的数据库的`root`密码替换`back-end/all.sh`和`./front-end/c/csv/export_csv.sh`文件中的`you mysql root passowrd`，即`back-end/all.sh`中的如下两行：
   ```
   # back-end/all.sh
   mysql -uroot -p'your mysql root password' < create_database_and_user.sql
   mysql -uroot -p'your mysql root password' bus < procedure_root.sql
   ```
   和`./front-end/c/csv/export_csv.sh`中的如下一行：
   ```
   mysql -uroot -p'your mysql root password' -e 'CALL export_csv("WeiZhang");CALL export_csv("RenYuan");CALL export_csv("CheDui");CALL export_csv("CheLiang");CALL export_csv("XianLu");CALL export_csv("SiJi");CALL export_csv("DuiZhang");CALL export_csv("LuDuiZhang");' bus
   ```
   **温馨提示**：可以使用如下命令递归查找在当前目录下所有文件中的特定内容（如`your mysql root password`）：
   ```
   grep -r 'your mysql root password' .
   ```
   输出为：
   ```
   ./back-end/all.sh:mysql -uroot -p'your mysql root password' < create_database_and_user.sql
   ./back-end/all.sh:mysql -uroot -p'your mysql root password' bus < procedure_root.sql
   ./front-end/c/csv/export_csv.sh:mysql -uroot -p'your mysql root password' -e 'CALL export_csv("WeiZhang");CALL export_csv("RenYuan");CALL export_csv("CheDui");CALL export_csv("CheLiang");CALL export_csv("XianLu");CALL export_csv("SiJi");CALL export_csv("DuiZhang");CALL export_csv("LuDuiZhang");' bus
   ./README.md:   mysql -uroot -p'your mysql root password' < create_database_and_user.sql
   ./README.md:   mysql -uroot -p'your mysql root password' bus < procedure_root.sql
   ```
   
   
   
2. 在`bash`中执行`all.sh`，即：
   ```
   cd back-end/
   ./all.sh
   ```
   

#### 使用前端
1. C语言：直接`cd front-end/c/`后执行`bin/main`即可。即：
   ```
   cd front-end/c/
   make # 可选，因为我编译好了
   bin/main
   ```
   
2. Web网页：
   1. 复制`front-end/web/`中的所有文件到`/var/www/html/`中。可以使用如下命令：
      ```
      cp front-end/web/* /var/www/html/
      ```
      
   2. 确定启动了`httpd`和`mariadb`并配置正确（好像也不需要怎么配置）后打开浏览器输入 CentOS 的 IP 即可。你可能需要用到以下命令：
      ```
      systemctl status httpd # 查询 httpd 服务的状态
      systemctl start httpd # 启动 httpd 服务
      systemctl enable httpd # 使 httpd 服务开机自启
      systemctl status mariadb
      systemctl start mariadb
      systemctl enable mariadb
      ```

更多内容请参考我的相关博客: [数据库设计——实践](https://wsxq2.55555.io/blog/2018/10/13/数据库设计-实践)
