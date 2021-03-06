
declare @audit_log_id int
insert into audit_logs (session_id, application_id, user_no, user_role_id, operation, screen_id, object_id, operation_dts) 
				values (0		  , 'hrm_app',		0,		'hrm_adm',		'I',		'script',	0,		getdate())
				
select @audit_log_id = audit_log_id from audit_logs where application_id = 'hrm_app'

insert into nationalities (nationality_nm, effective_from_dt, effective_till_dt, audit_log_id)
					values  ('Afghan', getdate(), '31 dec 9999', @audit_log_id),
							('Albanian', getdate(), '31 dec 9999', @audit_log_id),
							('Algerian', getdate(), '31 dec 9999', @audit_log_id),
							('American', getdate(), '31 dec 9999', @audit_log_id),
							('Andorran', getdate(), '31 dec 9999', @audit_log_id),
							('Angolan', getdate(), '31 dec 9999', @audit_log_id),
							('Antiguans', getdate(), '31 dec 9999', @audit_log_id),
							('Argentinean', getdate(), '31 dec 9999', @audit_log_id),
							('Armenian', getdate(), '31 dec 9999', @audit_log_id),
							('Australian', getdate(), '31 dec 9999', @audit_log_id),
							('Austrian', getdate(), '31 dec 9999', @audit_log_id),
							('Azerbaijani', getdate(), '31 dec 9999', @audit_log_id),
							('Bahamian', getdate(), '31 dec 9999', @audit_log_id),
							('Bahraini', getdate(), '31 dec 9999', @audit_log_id),
							('Bangladeshi', getdate(), '31 dec 9999', @audit_log_id),
							('Barbadian', getdate(), '31 dec 9999', @audit_log_id),
							('Barbudans', getdate(), '31 dec 9999', @audit_log_id),
							('Batswana', getdate(), '31 dec 9999', @audit_log_id),
							('Belarusian', getdate(), '31 dec 9999', @audit_log_id),
							('Belgian', getdate(), '31 dec 9999', @audit_log_id),
							('Belizean', getdate(), '31 dec 9999', @audit_log_id),
							('Beninese', getdate(), '31 dec 9999', @audit_log_id),
							('Bhutanese', getdate(), '31 dec 9999', @audit_log_id),
							('Bolivian', getdate(), '31 dec 9999', @audit_log_id),
							('Bosnian', getdate(), '31 dec 9999', @audit_log_id),
							('Brazilian', getdate(), '31 dec 9999', @audit_log_id),
							('British', getdate(), '31 dec 9999', @audit_log_id),
							('Bruneian', getdate(), '31 dec 9999', @audit_log_id),
							('Bulgarian', getdate(), '31 dec 9999', @audit_log_id),
							('Burkinabe', getdate(), '31 dec 9999', @audit_log_id),
							('Burmese', getdate(), '31 dec 9999', @audit_log_id),
							('Burundian', getdate(), '31 dec 9999', @audit_log_id),
							('Cambodian', getdate(), '31 dec 9999', @audit_log_id),
							('Cameroonian', getdate(), '31 dec 9999', @audit_log_id),
							('Canadian', getdate(), '31 dec 9999', @audit_log_id),
							('Cape Verdean', getdate(), '31 dec 9999', @audit_log_id),
							('Central African', getdate(), '31 dec 9999', @audit_log_id),
							('Chadian', getdate(), '31 dec 9999', @audit_log_id),
							('Chilean', getdate(), '31 dec 9999', @audit_log_id),
							('Chinese', getdate(), '31 dec 9999', @audit_log_id),
							('Colombian', getdate(), '31 dec 9999', @audit_log_id),
							('Comoran', getdate(), '31 dec 9999', @audit_log_id),
							('Congolese', getdate(), '31 dec 9999', @audit_log_id),
							('Costa Rican', getdate(), '31 dec 9999', @audit_log_id),
							('Croatian', getdate(), '31 dec 9999', @audit_log_id),
							('Cuban', getdate(), '31 dec 9999', @audit_log_id),
							('Cypriot', getdate(), '31 dec 9999', @audit_log_id),
							('Czech', getdate(), '31 dec 9999', @audit_log_id),
							('Danish', getdate(), '31 dec 9999', @audit_log_id),
							('Djibouti', getdate(), '31 dec 9999', @audit_log_id),
							('Dominican', getdate(), '31 dec 9999', @audit_log_id),
							('Dutch', getdate(), '31 dec 9999', @audit_log_id),
							('East Timorese', getdate(), '31 dec 9999', @audit_log_id),
							('Ecuadorean', getdate(), '31 dec 9999', @audit_log_id),
							('Egyptian', getdate(), '31 dec 9999', @audit_log_id),
							('Emirian', getdate(), '31 dec 9999', @audit_log_id),
							('Equatorial Guinean', getdate(), '31 dec 9999', @audit_log_id),
							('Eritrean', getdate(), '31 dec 9999', @audit_log_id),
							('Estonian', getdate(), '31 dec 9999', @audit_log_id),
							('Ethiopian', getdate(), '31 dec 9999', @audit_log_id),
							('Fijian', getdate(), '31 dec 9999', @audit_log_id),
							('Filipino', getdate(), '31 dec 9999', @audit_log_id),
							('Finnish', getdate(), '31 dec 9999', @audit_log_id),
							('French', getdate(), '31 dec 9999', @audit_log_id),
							('Gabonese', getdate(), '31 dec 9999', @audit_log_id),
							('Gambian', getdate(), '31 dec 9999', @audit_log_id),
							('Georgian', getdate(), '31 dec 9999', @audit_log_id),
							('German', getdate(), '31 dec 9999', @audit_log_id),
							('Ghanaian', getdate(), '31 dec 9999', @audit_log_id),
							('Greek', getdate(), '31 dec 9999', @audit_log_id),
							('Grenadian', getdate(), '31 dec 9999', @audit_log_id),
							('Guatemalan', getdate(), '31 dec 9999', @audit_log_id),
							('Guinea-Bissauan', getdate(), '31 dec 9999', @audit_log_id),
							('Guinean', getdate(), '31 dec 9999', @audit_log_id),
							('Guyanese', getdate(), '31 dec 9999', @audit_log_id),
							('Haitian', getdate(), '31 dec 9999', @audit_log_id),
							('Herzegovinian', getdate(), '31 dec 9999', @audit_log_id),
							('Honduran', getdate(), '31 dec 9999', @audit_log_id),
							('Hungarian', getdate(), '31 dec 9999', @audit_log_id),
							('Icelander', getdate(), '31 dec 9999', @audit_log_id),
							('Indian', getdate(), '31 dec 9999', @audit_log_id),
							('Indonesian', getdate(), '31 dec 9999', @audit_log_id),
							('Iranian', getdate(), '31 dec 9999', @audit_log_id),
							('Iraqi', getdate(), '31 dec 9999', @audit_log_id),
							('Irish', getdate(), '31 dec 9999', @audit_log_id),
							('Israeli', getdate(), '31 dec 9999', @audit_log_id),
							('Italian', getdate(), '31 dec 9999', @audit_log_id),
							('Ivorian', getdate(), '31 dec 9999', @audit_log_id),
							('Jamaican', getdate(), '31 dec 9999', @audit_log_id),
							('Japanese', getdate(), '31 dec 9999', @audit_log_id),
							('Jordanian', getdate(), '31 dec 9999', @audit_log_id),
							('Kazakhstani', getdate(), '31 dec 9999', @audit_log_id),
							('Kenyan', getdate(), '31 dec 9999', @audit_log_id),
							('Kittian and Nevisian', getdate(), '31 dec 9999', @audit_log_id),
							('Kuwaiti', getdate(), '31 dec 9999', @audit_log_id),
							('Kyrgyz', getdate(), '31 dec 9999', @audit_log_id),
							('Laotian', getdate(), '31 dec 9999', @audit_log_id),
							('Latvian', getdate(), '31 dec 9999', @audit_log_id),
							('Lebanese', getdate(), '31 dec 9999', @audit_log_id),
							('Liberian', getdate(), '31 dec 9999', @audit_log_id),
							('Libyan', getdate(), '31 dec 9999', @audit_log_id),
							('Liechtensteiner', getdate(), '31 dec 9999', @audit_log_id),
							('Lithuanian', getdate(), '31 dec 9999', @audit_log_id),
							('Luxembourger', getdate(), '31 dec 9999', @audit_log_id),
							('Macedonian', getdate(), '31 dec 9999', @audit_log_id),
							('Malagasy', getdate(), '31 dec 9999', @audit_log_id),
							('Malawian', getdate(), '31 dec 9999', @audit_log_id),
							('Malaysian', getdate(), '31 dec 9999', @audit_log_id),
							('Maldivan', getdate(), '31 dec 9999', @audit_log_id),
							('Malian', getdate(), '31 dec 9999', @audit_log_id),
							('Maltese', getdate(), '31 dec 9999', @audit_log_id),
							('Marshallese', getdate(), '31 dec 9999', @audit_log_id),
							('Mauritanian', getdate(), '31 dec 9999', @audit_log_id),
							('Mauritian', getdate(), '31 dec 9999', @audit_log_id),
							('Mexican', getdate(), '31 dec 9999', @audit_log_id),
							('Micronesian', getdate(), '31 dec 9999', @audit_log_id),
							('Moldovan', getdate(), '31 dec 9999', @audit_log_id),
							('Monacan', getdate(), '31 dec 9999', @audit_log_id),
							('Mongolian', getdate(), '31 dec 9999', @audit_log_id),
							('Moroccan', getdate(), '31 dec 9999', @audit_log_id),
							('Mosotho', getdate(), '31 dec 9999', @audit_log_id),
							('Motswana', getdate(), '31 dec 9999', @audit_log_id),
							('Mozambican', getdate(), '31 dec 9999', @audit_log_id),
							('Namibian', getdate(), '31 dec 9999', @audit_log_id),
							('Nauruan', getdate(), '31 dec 9999', @audit_log_id),
							('Nepalese', getdate(), '31 dec 9999', @audit_log_id),
							('New Zealander', getdate(), '31 dec 9999', @audit_log_id),
							('Ni-Vanuatu', getdate(), '31 dec 9999', @audit_log_id),
							('Nicaraguan', getdate(), '31 dec 9999', @audit_log_id),
							('Nigerien', getdate(), '31 dec 9999', @audit_log_id),
							('North Korean', getdate(), '31 dec 9999', @audit_log_id),
							('Northern Irish', getdate(), '31 dec 9999', @audit_log_id),
							('Norwegian', getdate(), '31 dec 9999', @audit_log_id),
							('Omani', getdate(), '31 dec 9999', @audit_log_id),
							('Pakistani', getdate(), '31 dec 9999', @audit_log_id),
							('Palauan', getdate(), '31 dec 9999', @audit_log_id),
							('Panamanian', getdate(), '31 dec 9999', @audit_log_id),
							('Papua New Guinean', getdate(), '31 dec 9999', @audit_log_id),
							('Paraguayan', getdate(), '31 dec 9999', @audit_log_id),
							('Peruvian', getdate(), '31 dec 9999', @audit_log_id),
							('Polish', getdate(), '31 dec 9999', @audit_log_id),
							('Portuguese', getdate(), '31 dec 9999', @audit_log_id),
							('Qatari', getdate(), '31 dec 9999', @audit_log_id),
							('Romanian', getdate(), '31 dec 9999', @audit_log_id),
							('Russian', getdate(), '31 dec 9999', @audit_log_id),
							('Rwandan', getdate(), '31 dec 9999', @audit_log_id),
							('Saint Lucian', getdate(), '31 dec 9999', @audit_log_id),
							('Salvadoran', getdate(), '31 dec 9999', @audit_log_id),
							('Samoan', getdate(), '31 dec 9999', @audit_log_id),
							('San Marinese', getdate(), '31 dec 9999', @audit_log_id),
							('Sao Tomean', getdate(), '31 dec 9999', @audit_log_id),
							('Saudi', getdate(), '31 dec 9999', @audit_log_id),
							('Scottish', getdate(), '31 dec 9999', @audit_log_id),
							('Senegalese', getdate(), '31 dec 9999', @audit_log_id),
							('Serbian', getdate(), '31 dec 9999', @audit_log_id),
							('Seychellois', getdate(), '31 dec 9999', @audit_log_id),
							('Sierra Leonean', getdate(), '31 dec 9999', @audit_log_id),
							('Singaporean', getdate(), '31 dec 9999', @audit_log_id),
							('Slovakian', getdate(), '31 dec 9999', @audit_log_id),
							('Slovenian', getdate(), '31 dec 9999', @audit_log_id),
							('Solomon Islander', getdate(), '31 dec 9999', @audit_log_id),
							('Somali', getdate(), '31 dec 9999', @audit_log_id),
							('South African', getdate(), '31 dec 9999', @audit_log_id),
							('South Korean', getdate(), '31 dec 9999', @audit_log_id),
							('Spanish', getdate(), '31 dec 9999', @audit_log_id),
							('Sri Lankan', getdate(), '31 dec 9999', @audit_log_id),
							('Sudanese', getdate(), '31 dec 9999', @audit_log_id),
							('Surinamer', getdate(), '31 dec 9999', @audit_log_id),
							('Swazi', getdate(), '31 dec 9999', @audit_log_id),
							('Swedish', getdate(), '31 dec 9999', @audit_log_id),
							('Swiss', getdate(), '31 dec 9999', @audit_log_id),
							('Syrian', getdate(), '31 dec 9999', @audit_log_id),
							('Taiwanese', getdate(), '31 dec 9999', @audit_log_id),
							('Tajik', getdate(), '31 dec 9999', @audit_log_id),
							('Tanzanian', getdate(), '31 dec 9999', @audit_log_id),
							('Thai', getdate(), '31 dec 9999', @audit_log_id),
							('Togolese', getdate(), '31 dec 9999', @audit_log_id),
							('Tongan', getdate(), '31 dec 9999', @audit_log_id),
							('Trinidadian', getdate(), '31 dec 9999', @audit_log_id),
							('Tunisian', getdate(), '31 dec 9999', @audit_log_id),
							('Turkish', getdate(), '31 dec 9999', @audit_log_id),
							('Tuvaluan', getdate(), '31 dec 9999', @audit_log_id),
							('Ugandan', getdate(), '31 dec 9999', @audit_log_id),
							('Ukrainian', getdate(), '31 dec 9999', @audit_log_id),
							('Uruguayan', getdate(), '31 dec 9999', @audit_log_id),
							('Uzbekistani', getdate(), '31 dec 9999', @audit_log_id),
							('Venezuelan', getdate(), '31 dec 9999', @audit_log_id),
							('Vietnamese', getdate(), '31 dec 9999', @audit_log_id),
							('Welsh', getdate(), '31 dec 9999', @audit_log_id),
							('Yemenite', getdate(), '31 dec 9999', @audit_log_id),
							('Zambian', getdate(), '31 dec 9999', @audit_log_id),
							('Zimbabwean', getdate(), '31 dec 9999', @audit_log_id)


insert into religions (religion_nm, effective_from_dt, effective_till_dt, audit_log_id)
				values  ('Hinduism', getdate(), '31 dec 9999',@audit_log_id),
						('Sikhism', getdate(), '31 dec 9999',@audit_log_id),
						('Christianity', getdate(), '31 dec 9999',@audit_log_id),
						('Islam ', getdate(), '31 dec 9999',@audit_log_id),
						('Buddhism', getdate(), '31 dec 9999',@audit_log_id),
						('Jainism', getdate(), '31 dec 9999',@audit_log_id),
						('Judaism', getdate(), '31 dec 9999',@audit_log_id),
						('Bahai', getdate(), '31 dec 9999',@audit_log_id)


insert into castes (caste_nm, effective_from_dt, effective_till_dt, audit_log_id)
				values  ('SC', getdate(), '31 dec 9999',@audit_log_id),
						('ST', getdate(), '31 dec 9999',@audit_log_id),
						('OBC', getdate(), '31 dec 9999',@audit_log_id),
						('General ', getdate(), '31 dec 9999',@audit_log_id)
