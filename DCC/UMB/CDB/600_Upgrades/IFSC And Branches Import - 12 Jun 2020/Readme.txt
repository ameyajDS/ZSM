Readme file Last Updated on 12 Jun 2020
=======================================

rbi site list file was last updated on 31 may 2020 [as mentioned on their site]

downloaded from - 

https://www.rbi.org.in/scripts/neft.aspx

Both sheets are having 70,000+ records. Both were imported.

Functionality is added in Bank screen to allow import of excel file into table - temp_bank_branch

Intentionally from UI, only entries are added there in that table.

Once that is done, we can run following command in sql to process those entries -

exec process_temp_bank_branch @audit_log_id

Audit log can be seen in the temp table and supplied here. 

After processing is done [addition of missing bank/branch & marking ineffective branches which doesn't exist in excel file]

temp table entries are deleted.