
ECHO STOPPING SQL INSTANCE
NET STOP MSSQL$%1 

ECHO STARTING SQL INSTANCE
NET START MSSQL$%1

Echo Starting installing db objects for target database(ZSM)
OSQL -U sa -P %2 -S .\%1 -dmaster -n -c -i"C:\ZSM_TEMP\ZSM_Procs_Only.txt" 
Echo Done installing db objects for target database(ZSM)

PAUSE

