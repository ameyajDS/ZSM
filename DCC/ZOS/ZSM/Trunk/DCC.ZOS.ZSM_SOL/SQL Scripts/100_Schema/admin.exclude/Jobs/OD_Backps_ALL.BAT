-- Replace ZSMAHM01 with Names of the server and all also change drive letter if necessary

@echo off

echo startting On Demand Backup .. Please Wait
echo .
sqlcmd -s ZSMAHM01  -i D:\Jobs\OD_Backps_ALL.sql
echo .
echo On Demand Backup Over

pause
@echo off

