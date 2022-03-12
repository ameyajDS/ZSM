if exists(select top 1 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME='ViewSatsangCentres' and TABLE_TYPE='View')
begin
	drop view dbo.ViewSatsangCentres
end
go
create view dbo.ViewSatsangCentres
with encryption
as
	select sc.satsang_centre_id
	,sc.satsang_centre_cd
	,sc.satsang_centre_nm
	,sc.satsang_centre_type
	,sc.address_line_1
	,sc.address_line_2
	,sc.district_or_city_id
	,sc.pin_or_zip_code
	,sc.secretary
	,sc.telephones
	,sc.email_addresses
	,sc.fax_lines
	,sc.txn_ts
	,sc.effective_from
	,sc.effective_till
	,sc.file_no
	,null as area_id
	,null as area_nm
	,null as status
	,null as zone_id 
	from satsang_centres sc 
	--join MSC..centres c on (sc.satsang_centre_id=c.centre_id)
	--join msc..areas a on (c.area_id=a.area_id)

