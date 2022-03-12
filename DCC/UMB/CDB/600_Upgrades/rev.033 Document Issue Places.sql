UPDATE document_issue_places
SET document_issue_country_id = 35
WHERE document_issue_place_nm = 'Jakarta'

UPDATE document_issue_places
SET document_issue_country_id = 59
WHERE document_issue_place_nm = 'Wellington'

INSERT INTO document_issue_places (document_issue_place_nm, document_issue_country_id, effective_from_dt, effective_till_dt, audit_log_id)
VALUES 
('BRAMPTON', 14, GETDATE(), '9999-12-31', 2), 
('DAR ES SALAAM', 82, GETDATE(), '9999-12-31', 2),
('HELSINKI', 25, GETDATE(), '9999-12-31', 2),
('JOHANNESBURG', 74, GETDATE(), '9999-12-31', 2),
('KOELN', 27, GETDATE(), '9999-12-31', 2),
('SURREY', 14, GETDATE(), '9999-12-31', 2),
('PERTH', 4, GETDATE(), '9999-12-31', 2), 
('SYDNEY', 4, GETDATE(), '9999-12-31', 2), 
('VIENNA', 5, GETDATE(), '9999-12-31', 2), 
('BRUSSELS', 8, GETDATE(), '9999-12-31', 2), 
('SAO PAULO', 12, GETDATE(), '9999-12-31', 2), 
('EDMONTON', 14, GETDATE(), '9999-12-31', 2), 
('COPENHAGEN', 20, GETDATE(), '9999-12-31', 2), 
('PARIS', 26, GETDATE(), '9999-12-31', 2), 
('FRANKFURT', 27, GETDATE(), '9999-12-31', 2), 
('HAMBURG', 27, GETDATE(), '9999-12-31', 2), 
('ACCRA', 28, GETDATE(), '9999-12-31', 2), 
('ATHENS', 30, GETDATE(), '9999-12-31', 2), 
('JALANDHAR', 1, GETDATE(), '9999-12-31', 2), 
('MILAN (MILANO)', 39, GETDATE(), '9999-12-31', 2), 
('KOBE', 42, GETDATE(), '9999-12-31', 2), 
('NAIROBI', 43, GETDATE(), '9999-12-31', 2), 
('KUALA LUMPUR', 50, GETDATE(), '9999-12-31', 2), 
('MEXICO CITY', 52, GETDATE(), '9999-12-31', 2), 
('THE HAGUE (DEN HAAG)', 58, GETDATE(), '9999-12-31', 2), 
('OSLO', 61, GETDATE(), '9999-12-31', 2), 
('MANILA', 65, GETDATE(), '9999-12-31', 2), 
('LISBON', 67, GETDATE(), '9999-12-31', 2), 
('SEOUL', 107, GETDATE(), '9999-12-31', 2), 
('MADRID', 75, GETDATE(), '9999-12-31', 2), 
('STOCKHOLM', 79, GETDATE(), '9999-12-31', 2), 
('PORT OF SPAIN', 234, GETDATE(), '9999-12-31', 2), 
('KAMPALA', 84, GETDATE(), '9999-12-31', 2), 
('ABU DHABI', 21, GETDATE(), '9999-12-31', 2), 
('HILLINGDON', 85, GETDATE(), '9999-12-31', 2), 
('BARQUISIMETO', 87, GETDATE(), '9999-12-31', 2), 
('BANDUNG', 35, GETDATE(), '9999-12-31', 2), 
('CALGARY', 14, GETDATE(), '9999-12-31', 2), 
('GUELPH', 14, GETDATE(), '9999-12-31', 2), 
('KARACHI', 62, GETDATE(), '9999-12-31', 2), 
('PANAJI', 1, GETDATE(), '9999-12-31', 2), 
('RIYADH', 70, GETDATE(), '9999-12-31', 2);
go

