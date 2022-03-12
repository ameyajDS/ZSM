alter table skills alter column skill_nm varchar(100) not null



insert into skills (skill_nm, effective_from, effective_till) 
			values ('Architecture', getdate(), '31 dec 9999'),
					('Budgeting', getdate(), '31 dec 9999'),
					('Car Repairing', getdate(), '31 dec 9999'),
					('Carpenting', getdate(), '31 dec 9999'),
					('Computer Graphics', getdate(), '31 dec 9999'),
					('Drama', getdate(), '31 dec 9999'),
					('Driving', getdate(), '31 dec 9999'),
					('First Aid', getdate(), '31 dec 9999'),
					('Gardening', getdate(), '31 dec 9999'),
					('Music (Vocal)', getdate(), '31 dec 9999'),
					('Playing Musical Instruments', getdate(), '31 dec 9999'),
					('Plumbing', getdate(), '31 dec 9999'),
					('Repair Electronic Devices', getdate(), '31 dec 9999'),
					('Sculpting', getdate(), '31 dec 9999'),
					('Story Telling', getdate(), '31 dec 9999'),
					('Woodwork', getdate(), '31 dec 9999'),
					('Writing (Content Writer)', getdate(), '31 dec 9999')

