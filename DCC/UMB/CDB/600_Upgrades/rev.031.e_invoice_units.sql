use cdb
go

create table e_invoice_units
(
	e_invoice_unit_cd	varchar(10)		not null	constraint EInvoiceUnits_PK_EInvoiceUnitCd primary key,
	e_invoice_unit_nm	varchar(50)		not null	constraint EInvoiceUnits_UK_EInvoiceUnitNm unique
);

insert into e_invoice_units
values 
('BAG',	'BAGS'),
('BAL',	'BALE'),
('BDL',	'BUNDLES'),
('BKL',	'BUCKLES'),
('BOU',	'BILLION OF UNITS'),
('BOX',	'BOX'),
('BTL',	'BOTTLES'),
('BUN',	'BUNCHES'),
('CAN',	'CANS'),
('CCM',	'CUBIC CENTIMETERS'),
('CMS',	'CENTIMETERS'),
('CBM',	'CUBIC METERS'),
('CTN',	'CARTONS'),
('DOZ',	'DOZENS'),
('DRM',	'DRUMS'),
('GGK',	'GREAT GROSS'),
('GMS',	'GRAMMES'),
('GRS',	'GROSS'),
('GYD',	'GROSS YARDS'),
('KGS',	'KILOGRAMS'),
('KLR',	'KILOLITRE'),
('KME',	'KILOMETRE'),
('LTR',	'LITRES'),
('MLS',	'MILLI LITRES'),
('MLT',	'MILILITRE'),
('MTR',	'METERS'),
('MTS',	'METRIC TON'),
('NOS',	'NUMBERS'),
('OTH',	'OTHERS'),
('PAC',	'PACKS'),
('PCS',	'PIECES'),
('PRS',	'PAIRS'),
('QTL',	'QUINTAL'),
('ROL',	'ROLLS'),
('SET',	'SETS'),
('SQF',	'SQUARE FEET'),
('SQM',	'SQUARE METERS'),
('SQY',	'SQUARE YARDS'),
('TBS',	'TABLETS'),
('TGM',	'TEN GROSS'),
('THD',	'THOUSANDS'),
('TON',	'TONNES'),
('TUB',	'TUBES'),
('UGS',	'US GALLONS'),
('UNT',	'UNITS'),
('YDS',	'YARDS');
go 

alter table measuring_units add e_invoice_unit_cd varchar(10) null constraint MeasuringUnits_FK_EInvoiceCd references e_invoice_units;
go

update measuring_units set e_invoice_unit_cd = 'OTH';
go

alter table measuring_units alter column e_invoice_unit_cd varchar(10) not null;
go
