if exists (select top 1
	1
from information_schema.routines
where routine_name = 'LPAD' and routine_type = 'function')
begin
drop function dbo.lpad
end
go
CREATE FUNCTION dbo.LPAD
               (@SourceString VARCHAR(MAX),
                @FinalLength  INT,
                @PadChar      CHAR(1))
RETURNS VARCHAR(MAX)
AS
  BEGIN
    RETURN
      ( select
	REPLICATE(@padchar, @finallength - LEN(@sourcestring)) + @sourcestring)
  END
go
 
if exists (select top 1
	1
from information_schema.routines
where routine_name = 'RPAD' and routine_type = 'function')
begin
drop function dbo.rpad
end
go
CREATE FUNCTION dbo.RPAD
               (@SourceString VARCHAR(MAX),
                @FinalLength  INT,
                @PadChar      CHAR(1))
RETURNS VARCHAR(MAX)
AS
  BEGIN
    RETURN
      ( select
	@sourcestring + REPLICATE(@padchar, @finallength - LEN(@sourcestring)))
  END
go

