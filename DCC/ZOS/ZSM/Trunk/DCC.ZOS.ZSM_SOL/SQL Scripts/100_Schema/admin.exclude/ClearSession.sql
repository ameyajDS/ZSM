SELECT b.user_nm, a.*

FROM log..sessions a

JOIN SysAdmin..all_users b

ON ( a.user_no = b.user_no )

where finish_dtm is NULL AND clear_dtm IS NULL


--EXEC SysAdmin..ClearSingleSession 11892
 