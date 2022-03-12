#This batch file will generate the CS Model for SCI
c:\cdftools\DCC.UMB.WDF.Tools.exe model_cl_cs "connection_string=Data Source=dev01.deravpn.net; Initial Catalog=CDB;Persist Security Info=True;User ID=sa;Password=dev@123" "target_model_file_path=D:\DERA_APPS\DCC\UMB\CDB\Trunk\CDBWeb\DCC.UMB.CDB.Web\Models\CDBModels.cs"
c:\cdftools\DCC.UMB.WDF.Tools.exe model_cl_ts "connection_string=Data Source=dev01.deravpn.net; Initial Catalog=CDB;Persist Security Info=True;User ID=sa;Password=dev@123" "target_model_file_path=D:\DERA_APPS\DCC\UMB\WDF\Trunk\DCC.UMB.WDF.Auth\c\js\3p\wdf\CDBModel.ts"

echo Done, see log above. Press a key to exit..
pause