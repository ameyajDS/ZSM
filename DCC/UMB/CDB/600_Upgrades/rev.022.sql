select * from satsang_sessions where yr = 2020
insert into master_satsangs (satsang_session_id, master_satsang_dt, is_cancelled, audit_log_id)
					 values (40,'2020-02-16',0,2),
							(40,'2020-02-23',0,2),
							(40,'2020-03-01',0,2),
							(41,'2020-03-22',0,2),
							(41,'2020-03-29',0,2),
							(41,'2020-04-05',0,2),
							(42,'2020-05-17',0,2),
							(42,'2020-05-24',0,2),
							(42,'2020-05-31',0,2),
							(43,'2020-06-28',0,2),
							(43,'2020-07-05',0,2),
							(44,'2020-09-06',0,2),
							(44,'2020-09-13',0,2),
							(44,'2020-09-20',0,2),
							(45,'2020-11-08',0,2),
							(45,'2020-11-15',0,2),
							(45,'2020-11-22',0,2),
							(46,'2020-12-06',0,2),
							(46,'2020-12-13',0,2),
							(46,'2020-12-20',0,2)
