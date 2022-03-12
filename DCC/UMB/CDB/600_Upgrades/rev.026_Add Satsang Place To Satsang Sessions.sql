
-- Script to Add Colum 'satsang_place_id'
select * from satsang_sessions;
alter table satsang_sessions add satsang_place_id int null;
alter table adt_satsang_sessions add satsang_place_id int null;

update satsang_sessions set satsang_place_id = 9379;
alter table satsang_sessions alter column satsang_place_id int not null;

-- Added to have Remote Entity Reference to SCI.stsang_places
exec xcs..RegisterRemoteEntityReference 'cdb', 'satsang_sessions', 'satsang_place_id', 'sci', 'satsang_places';

alter table satsang_sessions add constraint SatsangSessions_UK_YrPlaceStartEnd
			unique (yr, satsang_place_id, session_start_dt, session_end_dt)