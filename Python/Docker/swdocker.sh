sudo docker pull mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04

sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=MyStrongPw!23' \
   --name 'swsql' -p 1402:1433 \
   -v sql1data:/var/opt/mssql \
   -d mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04

sudo docker exec -it swsql mkdir /var/opt/mssql/backup

cd ~

sudo docker cp SWDB.bak swsql:/var/opt/mssql/backup

sudo docker exec -it swsql /opt/mssql-tools/bin/sqlcmd -S localhost \
   -U SA -P 'MyStrongPw!23' \
   -Q 'RESTORE FILELISTONLY FROM DISK = "/var/opt/mssql/backup/SWDB.bak"' \
   | tr -s ' ' | cut -d ' ' -f 1-2

sudo docker exec -it swsql /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P 'MyStrongPw!23' \
   -Q 'RESTORE DATABASE SWDB FROM DISK = "/var/opt/mssql/backup/SWDB.bak" WITH MOVE "SWDB" TO "/var/opt/mssql/data/SWDB.mdf", MOVE "SWDB_Log" TO "/var/opt/mssql/data/SWDB_log.ldf"'