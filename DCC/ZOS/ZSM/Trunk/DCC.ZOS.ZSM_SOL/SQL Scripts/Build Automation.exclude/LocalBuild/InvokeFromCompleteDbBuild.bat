
ECHO STOPPING SQL INSTANCE
NET STOP MSSQL$%1 

ECHO STARTING SQL INSTANCE
NET START MSSQL$%1

Echo Starting Recreation of database(s)
OSQL -U sa -P %2 -S .\%1 -dmaster -n -c -i"ReCreateDatabases.sql"
Echo Done Recreation of database(s)

Echo Starting installing db objects for target database(ZSM)
OSQL -U sa -P %2 -S .\%1 -dmaster -n -c -i"C:\ZSM_TEMP\ZSM_ConsolidateBuildDatabase.txt" 
Echo Done installing db objects for target database(ZSM)

Echo Starting setup of SysAdmin (setting password, setting package_databases)
OSQL -U sa -P %2 -S .\%1 -dmaster -n -c -i"postConsolidatedBuild.sql"
Echo Done setup of SysAdmin (setting password, setting package_databases)

PAUSE

