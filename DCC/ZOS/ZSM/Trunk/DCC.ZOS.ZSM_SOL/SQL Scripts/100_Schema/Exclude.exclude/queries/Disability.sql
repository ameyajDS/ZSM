select sewadar_id, any_disability
-- distinct any_disability
--update x
--set any_disability = NULL
from sewadars_details x
where any_disability in ('', '-', '-to','`','a', 'n', 'no','nil','no.', 's', 'rr',
'Acidity', 'Allergy in eyes', 'Back Pain', 'Bypass surgery', 'Cardiac', 'Cardiac Problem', 'Cataract', 'Eye Disability', 'Eye problem',
'BP Issues', 'Eye Problem(Operated for lens)', 'Eyesight Problem', 'Fracture in Left Leg', 'Gastric Problem', 'GONE THROUGH SURGERY', 'Heart Blockage',
'Heart Operation', 'Heart Patient', 'Heart Problem', 'Heart Problem(Cholestrol)', 'Heart Valve surgery', 'Hip Fracture',
'Hypertension', 'Joint Pain', 'Knee  Join Pain', 'Knee and Backache', 'Knee Joint Pain', 'Knee Pain', 'Knee problem', 'Left eye problem',
'Left Eye Sight Weak', 'Leg Problem', 'Less Vision', 'Low Haemoglobin', 'Low Vision', 'One Eye Problem', 'One Eye vision',
'Operate', 'Pain in knees', 'Piles', 'Piles and Hernia', 'Problem in left foot (Accident', 'Problem in leg', 'Psychiatric treatment',
'REOB', 'RIGHT HAND', 'Severe pain in leg', 'Skin problem', 'Squint', 'Stammering', 'Stomach Pain', 'T B Patient',
'totoo', 'Uses a Pacemaker', 'Vertigo', 'VISION PROBLEM', 'Vision Weak', 'Weak Eye Sight', 'Weak Eye Sight (left)', 'n0')

order by 1

select distinct any_disability
from sewadars_details x
where any_disability not in ('Allergy', 'Allergy, Asthma', 'Amputation (Hand)', 'Amputation (Left Arm)', 'Artificial Leg', 'Asthma', 'Arthritis',
'Asthma, Arthritis',
'B/L Kidney Failure', 'Back Bone Problem', 'Breathlessness', 'Breast Cancer', 'Cervical Spondylosis', 'Deaf', 'Deaf, Dumb',
'Ear Disorder', 'Foot Drop', 'Gout', 'Hearing Impairment', 'Kidney Problem', 'Knee Joint Disorder', 'Loss of Speech-Paralysis',
'Mentally challenged', 'Migraine', 'One Eye', 'Osteoporosis', 'Ovary Cancer', 'Paralytic', 'Parkinson''s disease',
'Physical Handicap', 'Physical Handicap (Hand)', 'Physical Handicap (Leg)',
'Polio', 'Polio (Foot)', 'Polio (Hand)', 'Polio (Hand/ Leg)', 'Polio (Leg)',
'Rod in Arm', 'Rod in Leg', 'Back Bone, Knee Joint Disorder',
'Skin Allergy', 'Slip Disc', 'Spondylitis', 'Sunburn',
'Thyroid', 'Thyroid, Allergy', 'Varicose Veins')

order by 1


/*
update sewadars_details 
set any_disability     = 'Hearing Impairment'
where any_disability IN ('Hearing Impairement')

select x.department_id, department_nm, d.sub_department_id,  sub_department_cd, sub_department_nm, satsang_centre_id from departments x join sub_departments d on (x.department_id = d.department_id)
join sub_departments_satsang_centres y on(d.sub_department_id = y.sub_department_id)
--where satsang_centre_id = 9720
order by 2, 5

--select * from satsang_centres_details where is_main_centre  = 'yes'

--select * from sub_departments_satsang_centres



INSERT INTO	sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id	)
		VALUES		(	355 , 9720);






*/
