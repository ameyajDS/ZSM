alter table cdb..measuring_units DROP CONSTRAINT UK_MeasuringUnits_Code;
alter table cdb..measuring_units alter column measuring_unit_cd varchar (4);
alter table cdb..measuring_units ADD CONSTRAINT UK_MeasuringUnits_Code UNIQUE (measuring_unit_cd);

UPDATE cdb..measuring_units
	SET	measuring_unit_cd =	LTRIM (RTRIM (measuring_unit_cd))


