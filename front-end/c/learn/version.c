#include <mysql.h>
#include <my_global.h>

int main(int argc, char **argv)
{
  printf("MySQL client version: %s\n", mysql_get_client_info());

  exit(0);
}
