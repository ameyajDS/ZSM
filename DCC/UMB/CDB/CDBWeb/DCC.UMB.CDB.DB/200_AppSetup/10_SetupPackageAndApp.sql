
exec insApplication 
@application_id='CDB_WEB'
,@application_nm='Central Database Web'
,@package_id='CDB'
,@database_nm='CDB'
,@implementation_dt='11 Jun 2013'
,@error_log_level='ERROR'
,@log_file_size_in_mb=1
,@report_title=null
,@report_footer=null
,@path_1=null
,@path_2=null
,@path_3=null
,@argument_1=null
,@argument_2=null
,@argument_3=null
,@argument_4=null
,@argument_5=null

update applications set display_order = 2, style_nm='grey'
where application_id='CDB_WEB'
