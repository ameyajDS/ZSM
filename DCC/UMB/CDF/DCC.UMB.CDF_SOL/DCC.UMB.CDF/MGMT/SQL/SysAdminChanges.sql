use sysadmin
go

grant select on package_databases to public
grant select on package_menu_groups to public
grant select on package_menus to public

delete from package_menu_groups
insert into package_menu_groups(package_id,parent_group_id,group_nm,group_desc,ctrl_key_accessor, display_order)
values('SIM',null,'ENT','ENT-DESC','E', 1)
insert into package_menu_groups(package_id,parent_group_id,group_nm,group_desc,ctrl_key_accessor, display_order)
values('SIM',null,'ISS','ISS-DESC','I', 2)
insert into package_menu_groups(package_id,parent_group_id,group_nm,group_desc,ctrl_key_accessor, display_order)
values('SIM',null,'RCT','RCT-DESC','R', 3)
insert into package_menu_groups(package_id,parent_group_id,group_nm,group_desc,ctrl_key_accessor, display_order)
values('SIM',null,'RQS','RQS-DESC','Q', 4)
insert into package_menu_groups(package_id,parent_group_id,group_nm,group_desc,ctrl_key_accessor, display_order)
values('SIM',null,'STK','STK-DESC','T', 5)

select 'insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values('
+convert(varchar,g.group_id)+','''+ s.screen_nm +''''+', '''+ s.screen_nm +''', null,null, 1)'
From package_menu_groups g
join package_screens s on (s.package_id=g.package_id and g.group_nm=convert(varchar(3),s.screen_id))
order by s.screen_nm							 

delete from package_menus
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'A/C head-wise Department Summary', 'A/C head-wise Department Summary', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'ABC Analysis Report', 'ABC Analysis Report', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Account Heads', 'Account Heads', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Allocate Storage Location', 'Allocate Storage Location', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Amendment Reasons', 'Amendment Reasons', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Amendment to Requisition / Amendment', 'Amendment to Requisition / Amendment', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Amendments', 'Amendments', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Authorised Persons', 'Authorised Persons', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Bill Passing and Goods Acceptance Note', 'Bill Passing and Goods Acceptance Note', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Centre Wise Issues', 'Centre Wise Issues', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Centre-wise Issues of Material', 'Centre-wise Issues of Material', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Comparison of Receipts and Issues', 'Comparison of Receipts and Issues', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Components', 'Components', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Concise Item Stock Ledger', 'Concise Item Stock Ledger', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Control Information', 'Control Information', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Conversion Voucher', 'Conversion Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Conversion Vouchers', 'Conversion Vouchers', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Department Requisitions Analysis', 'Department Requisitions Analysis', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Department Requisitions with Status', 'Department Requisitions with Status', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Department-wise Issue Returns Register', 'Department-wise Issue Returns Register', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Department-wise overdue Requisitions', 'Department-wise overdue Requisitions', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Department-wise pending Requisitions', 'Department-wise pending Requisitions', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Department-wise Receipts', 'Department-wise Receipts', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Destroy Material', 'Destroy Material', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Discrepancy Rejection Note', 'Discrepancy Rejection Note', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Discrepancy Rejection Notes Register', 'Discrepancy Rejection Notes Register', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Excess Receipts Report', 'Excess Receipts Report', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Fabricators', 'Fabricators', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Gain / Loss Statement', 'Gain / Loss Statement', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Gate Pass', 'Gate Pass', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Gate Passes', 'Gate Passes', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Goods Receipt Note', 'Goods Receipt Note', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Group/Item Head/Subhead-wise Receipts', 'Group/Item Head/Subhead-wise Receipts', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Indent-cum-Issue Voucher', 'Indent-cum-Issue Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Indent-cum-Issues', 'Indent-cum-Issues', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Indent-cum-Issues Register', 'Indent-cum-Issues Register', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Indents', 'Indents', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Issue Returns', 'Issue Returns', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Issue Returns Register', 'Issue Returns Register', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Issue Returns Voucher', 'Issue Returns Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Issues', 'Issues', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Issues against Payment', 'Issues against Payment', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Issues against Payment Register', 'Issues against Payment Register', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Issues against Payment Voucher', 'Issues against Payment Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Issues for a Period', 'Issues for a Period', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Issues to Departments', 'Issues to Departments', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Item Head Groups', 'Item Head Groups', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Item Heads', 'Item Heads', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Item Stock Ledger', 'Item Stock Ledger', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Item Stock Summary', 'Item Stock Summary', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Item Sub Heads', 'Item Sub Heads', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Item-wise overdue Requisitions', 'Item-wise overdue Requisitions', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Item-wise pending Requisitions', 'Item-wise pending Requisitions', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Items', 'Items', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Loan Issues', 'Loan Issues', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Manufacturers', 'Manufacturers', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Manufctr/Brand/Project-wise Requisitions', 'Manufctr/Brand/Project-wise Requisitions', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Non Moving', 'Non Moving', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Physical Stock Records', 'Physical Stock Records', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Physical Stocks', 'Physical Stocks', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Prefix Groups', 'Prefix Groups', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Process Rejected Goods', 'Process Rejected Goods', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Project Status', 'Project Status', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Projects', 'Projects', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Purchase Requisition', 'Purchase Requisition', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Purchase Return Voucher', 'Purchase Return Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Purchase Returns', 'Purchase Returns', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Purchase Returns Register', 'Purchase Returns Register', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Quality Check', 'Quality Check', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Quantity Check', 'Quantity Check', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Receipt Register for Checking', 'Receipt Register for Checking', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Receipt Vouchers', 'Receipt Vouchers', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Receipts Status Item-wise', 'Receipts Status Item-wise', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Requisitions', 'Requisitions', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(14,'Requisitions for a Period', 'Requisitions for a Period', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Return Reasons', 'Return Reasons', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Return Storage Allocations', 'Return Storage Allocations', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Returns to Stores', 'Returns to Stores', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(12,'Scrap Issues', 'Scrap Issues', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Stock Adjustment Reasons', 'Stock Adjustment Reasons', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Adjustment Reasons-wise Report', 'Stock Adjustment Reasons-wise Report', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Adjustment Voucher', 'Stock Adjustment Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Adjustments', 'Stock Adjustments', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Discrepancies Report', 'Stock Discrepancies Report', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Ledger Summary', 'Stock Ledger Summary', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Movement Voucher', 'Stock Movement Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Movements', 'Stock Movements', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Status on a date', 'Stock Status on a date', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Taking', 'Stock Taking', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Stock Transfer Reasons', 'Stock Transfer Reasons', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Transfer Reasons-wise Report', 'Stock Transfer Reasons-wise Report', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Transfer Voucher', 'Stock Transfer Voucher', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Transfers', 'Stock Transfers', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Transfers Report', 'Stock Transfers Report', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock Valuation Variance', 'Stock Valuation Variance', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stock-wise closing with Rate', 'Stock-wise closing with Rate', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(15,'Stocks Drill Down', 'Stocks Drill Down', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Storage Locations', 'Storage Locations', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(11,'Transaction Lockings', 'Transaction Lockings', null,null, 1)
insert into package_menus(group_id,menu_nm,menu_desc,screen_params,ctrl_key_accessor, display_order)values(13,'Work Load Analysis', 'Work Load Analysis', null,null, 1)

select menuGroup.*,menus.* from package_menus  menus join package_menu_groups menuGroup on menus.group_id=menuGroup.group_id order by menus.group_id for xml auto

select * from package_databases where package_id = 'SAM'



select menuGroup.*,menus.* from package_menus  menus join package_menu_groups menuGroup on menus.group_id=menuGroup.group_id order by menus.group_id for xml auto

select   from package_menus 

update package_menus set display_order = group_id



select pg.*, sg.* From package_menu_groups pg
join package_menu_groups sg on (sg.parent_group_id = pg.group_id)
for xml auto

