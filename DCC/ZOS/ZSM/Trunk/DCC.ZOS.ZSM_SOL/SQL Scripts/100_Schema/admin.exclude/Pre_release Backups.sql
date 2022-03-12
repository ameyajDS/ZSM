--Ensure to change drive name to appropriate Backup drive whereever required
BACKUP DATABASE CDB TO DISK = 'C:\ZSM_All_Pre_Release\CDB.bak' WITH  INIT ,  NOUNLOAD ,  NOSKIP , STATS = 10,  NOFORMAT ;
BACKUP DATABASE ZSM TO DISK = 'C:\ZSM_All_Pre_Release\ZSM.bak' WITH  INIT ,  NOUNLOAD ,  NOSKIP , STATS = 10,  NOFORMAT ;
BACKUP DATABASE ZSM_Photos TO DISK = 'C:\ZSM_All_Pre_Release\ZSM_Photos.bak' WITH  INIT ,  NOUNLOAD ,  NOSKIP , STATS = 10,  NOFORMAT ;
BACKUP DATABASE SysAdmin TO DISK = 'C:\ZSM_All_Pre_Release\SysAdmin.bak' WITH  INIT ,  NOUNLOAD ,  NOSKIP , STATS = 10,  NOFORMAT ;

