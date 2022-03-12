set quoted_identifier off
go

set ansi_nulls on
go

-- =============================================================================
--  Patron Representatives of various countries 
--  No Screen - enter data with a script and then create controller so that Lookup can work
-- =============================================================================

create table patron_representatives
(
	patron_representative_id		int					not null	identity (1, 1)
																		constraint	PatronRepresentative_PK_PatronRepresentativeID
																			primary key	clustered,
															
	patron_representative_nm		nvarchar(200)		not null	constraint	PatronRepresentative_U2_PatronRepresentativeName
																		unique	nonclustered																		
)
go

EXEC xcs..RegisterRemoteEntity	44, 'CDB',	'patron_representatives',		'patron_representative_id',			'patron_representative_nm',		'/CDR/api/patron_representative/LookupListing';


