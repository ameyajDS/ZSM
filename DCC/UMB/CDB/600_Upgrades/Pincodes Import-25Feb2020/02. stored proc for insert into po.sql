if exists (	select top 1 1 from INFORMATION_SCHEMA.ROUTINES where ROUTINE_TYPE='procedure' and routine_name='insert_po')
	begin
		drop procedure dbo.insert_po
	end
go
create procedure dbo.insert_po
(
	@pincode							int,
	@level1								varchar(1000),
	@level2								varchar(1000),
	@level3								varchar(1000)
)
with encryption
as
begin
	insert into poimport(pincode, level1_nm, level2_nm, level3_nm)
	values
	(
		@pincode, @level1, @level2, @level3
	)

end
go

--HASH:4714718186126106198658122999602271316839