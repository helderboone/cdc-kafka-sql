#aguardando 90 segundos para aguardar o provisionamento e start do banco
sleep 20s
#rodar o comando para criar o banco
/opt/mssql-tools/bin/sqlcmd -S localhost,1433 -U SA -P "P@ssw0rd" -i criacao-banco-docker.sql