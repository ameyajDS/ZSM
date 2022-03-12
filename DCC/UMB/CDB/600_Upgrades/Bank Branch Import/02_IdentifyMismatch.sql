DECLARE @Flag CHAR(1) -- S for Select, U for update
SET @flag = 'S'

if @flag = 'U' 

	BEGIN TRAN
	--COMMIT
	--ROLLBACK

--------------------------------------------------
-- Create copy of Banks and Branches
--------------------------------------------------
IF @Flag = 'U'
BEGIN
	IF EXISTS	(	SELECT  TOP 1 1
					FROM    sysobjects
					WHERE   type	=	'U'
					AND     name	=	'Banks_copy'
				)
	BEGIN
		DROP TABLE Banks_copy
		DROP TABLE Branches_copy
	END

	SELECT * 
	INTO Banks_copy
	FROM Banks

	SELECT * 
	INTO Branches_copy
	FROM Branches
END
--------------------------------------------------
-- Banks
--------------------------------------------------
--------------------------------------------------
-- To be marked effective
--------------------------------------------------
SELECT	r.*
FROM	banks b 
JOIN	banks_RBI r
		ON	r.bank_code = b.bank_cd
WHERE	GETDATE() NOT BETWEEN b.effective_from_dt AND b.effective_till_dt
ORDER BY 3

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE	b
	SET		b.effective_from_dt = GETDATE(),
			b.effective_till_dt = '9999-12-31'
	FROM	banks b 
	JOIN	banks_RBI r
			ON	r.bank_code = b.bank_cd
	WHERE	GETDATE() NOT BETWEEN b.effective_from_dt AND b.effective_till_dt
END

--------------------------------------------------
-- To be marked ineffective, as these does not exists in bank or branch
--------------------------------------------------
SELECT	b.bank_nm, b.bank_cd
FROM	banks b
LEFT JOIN	banks_RBI r
	ON		b.bank_cd = r.bank_code
LEFT JOIN	branches_RBI br
	ON		b.bank_nm = br.branch
WHERE	r.bank_name IS NULL 
	AND	br.bank IS NULL
	AND	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
ORDER BY 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE b
	SET b.effective_till_dt = GETDATE()
	FROM	banks b
	LEFT JOIN	banks_RBI r
		ON		b.bank_cd = r.bank_code
	LEFT JOIN	branches_RBI br
		ON		b.bank_nm = br.branch
	WHERE	r.bank_name IS NULL 
		AND	br.bank IS NULL
		AND	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
END

--------------------------------------------------
-- Bank code matches, name does not match with bank and does not exists in branch
--------------------------------------------------
SELECT	b.bank_nm, r.bank_name, br.branch 
FROM	banks b
JOIN	banks_RBI r 
	ON	b.bank_cd = r.bank_code
LEFT JOIN branches_RBI br
	ON	r.bank_name = br.branch
WHERE	b.bank_nm != r.bank_name
	AND	br.bank IS NULL
	AND	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
ORDER BY 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE b
	SET b.bank_alias = b.bank_nm, b.bank_nm = r.bank_name
	FROM Banks b
	JOIN	banks_RBI r 
		ON	b.bank_cd = r.bank_code
	LEFT JOIN branches_RBI br
		ON	r.bank_name = br.branch
	WHERE	b.bank_nm != r.bank_name
		AND	br.bank IS NULL
		AND	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
END

--------------------------------------------------
-- Bank name matches, code does not match
--------------------------------------------------
SELECT	b.bank_nm, r.bank_name, b.bank_cd, r.bank_code
FROM	banks b
JOIN	banks_RBI r 
	ON	b.bank_cd != r.bank_code
	AND	b.bank_nm = r.bank_name
WHERE	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
ORDER BY 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE b
	SET b.bank_cd = r.bank_code
	FROM	banks b
	JOIN	banks_RBI r 
		ON	b.bank_cd != r.bank_code
		AND	b.bank_nm = r.bank_name
	WHERE	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
END

--------------------------------------------------
-- Bank exists as branch
--------------------------------------------------
SELECT	DISTINCT b.bank_nm, a.bank_id, a.bank_nm
FROM	Banks b
JOIN	branches_RBI r
	ON	b.bank_nm = r.branch
LEFT JOIN	banks_RBI x
	ON	x.bank_code = b.bank_cd
LEFT JOIN banks a 
	ON	r.bank = a.bank_nm
WHERE	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
AND		x.bank_code IS NULL
AND		b.parent_bank_id IS NULL
ORDER BY 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE b
	SET b.parent_bank_id = a.bank_id
	FROM	Banks b
	JOIN	branches_RBI r
		ON	b.bank_nm = r.branch
	LEFT JOIN	banks_RBI x
		ON	x.bank_code = b.bank_cd
	LEFT JOIN banks a 
		ON r.bank = a.bank_nm
	WHERE	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt
	AND		x.bank_code IS NULL
	AND		b.parent_bank_id IS NULL
END

--------------------------------------------------
-- Update parent bank id for specific banks
--------------------------------------------------
SELECT	b.bank_nm, r.branch_cd, r.branch_nm, r.address, x.bank_nm
FROM	banks b 
JOIN	branches r
	ON	r.bank_id = b.bank_id
JOIN	branches_rbi rr
	ON	r.branch_cd = rr.ifsc
JOIN banks x 
	ON	rr.bank = x.bank_nm
WHERE	rr.bank IN ('YES BANK', 'HDFC BANK', 'ICICI BANK LIMITED', 'IDBI BANK', 'AXIS BANK', 'PUNJAB NATIONAL BANK', 'SYNDICATE BANK', 'THE GUJARAT STATE COOPERATIVE BANK LIMITED', 'THE KALYAN JANATA SAHAKARI BANK LTD.', 'THE SHAMRAO VITHAL COOPERATIVE BANK')
AND		b.parent_bank_id IS NULL
AND		b.bank_id != x.bank_id
ORDER BY 5, 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE	b
	SET		b.parent_bank_id = x.bank_id
	FROM	banks b 
	JOIN	branches r
		ON	r.bank_id = b.bank_id
	JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	JOIN banks x 
		ON	rr.bank = x.bank_nm
	WHERE	rr.bank IN ('YES BANK', 'HDFC BANK', 'ICICI BANK LIMITED', 'IDBI BANK', 'AXIS BANK', 'PUNJAB NATIONAL BANK', 'SYNDICATE BANK', 'THE GUJARAT STATE COOPERATIVE BANK LIMITED', 'THE KALYAN JANATA SAHAKARI BANK LTD.', 'THE SHAMRAO VITHAL COOPERATIVE BANK')
	AND		b.parent_bank_id IS NULL
	AND		b.bank_id != x.bank_id
END

--------------------------------------------------
-- To be added
--------------------------------------------------
SELECT	r.*
FROM	banks_RBI r
LEFT JOIN	banks b 
		ON	r.bank_code = b.bank_cd
WHERE	b.bank_nm IS NULL
ORDER BY 3

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	INSERT INTO banks (bank_nm, bank_cd, effective_from_dt, effective_till_dt)
	SELECT	bank_name, bank_code, GETDATE(), '9999-12-31'
	FROM	banks_RBI r
	LEFT JOIN	banks b 
			ON	r.bank_code = b.bank_cd
	WHERE	b.bank_nm IS NULL
END

--------------------------------------------------
-- Bank Branches
--------------------------------------------------
--------------------------------------------------
-- Remove special characters 
--------------------------------------------------
IF @flag = 'U'
BEGIN
	UPDATE	branches_RBI
	SET		branch = REPLACE(branch, N'┬á', N'')
	WHERE	branch LIKE N'%┬á%'

	UPDATE	branches_RBI
	SET		branch = REPLACE(branch, N'├╜', N'')
	WHERE	branch LIKE N'%├╜%'

	UPDATE	branches_RBI
	SET		branch = REPLACE(branch, N'┬û', N'')
	WHERE	branch LIKE N'%┬û%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'┬á', N'')
	WHERE	address LIKE N'%┬á%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'├╜', N'')
	WHERE	address LIKE N'%├╜%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'┬û', N'')
	WHERE	address LIKE N'%┬û%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'┬Æ', N'')
	WHERE	address LIKE N'%┬Æ%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'┬ô', N'')
	WHERE	address LIKE N'%┬ô%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'┬ö', N'')
	WHERE	address LIKE N'%┬ö%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'?�', N'')
	WHERE	address LIKE N'%?�%'

	UPDATE	branches_RBI
	SET		address = REPLACE(address, N'�', N'')
	WHERE	address LIKE N'%�%'

	UPDATE	branches_RBI
	SET		branch = REPLACE(branch, N'?�', N'')
	WHERE	branch LIKE N'%?�%'
END

--------------------------------------------------
-- To make it effective for matching IFSC
--------------------------------------------------
SELECT	r.*, rr.*
FROM	branches r
JOIN	branches_rbi rr
	ON	r.branch_cd = rr.ifsc
WHERE	GETDATE() NOT BETWEEN r.effective_from_dt AND r.effective_till_dt
AND	rr.BRANCH IS NOT NULL
ORDER BY 2

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE r
	SET r.effective_from_dt = GETDATE(),
		r.effective_till_dt = '9999-12-31'
	FROM	branches r
	JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	WHERE	GETDATE() NOT BETWEEN r.effective_from_dt AND r.effective_till_dt
	AND	rr.BRANCH IS NOT NULL
END

--------------------------------------------------
-- IFSC does not exists, to be marked ineffective
--------------------------------------------------
SELECT	b.bank_nm, r.branch_cd, r.branch_nm, r.address
FROM	branches r
JOIN	banks b 
	ON	r.bank_id = b.bank_id
LEFT JOIN	branches_rbi rr
	ON	r.branch_cd = rr.ifsc
WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
AND		rr.branch IS NULL
ORDER BY 1, 2

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE r
	SET r.effective_till_dt = GETDATE()
	FROM	branches r
	JOIN	banks b 
		ON	r.bank_id = b.bank_id
	LEFT JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
	AND		rr.branch IS NULL
END

--------------------------------------------------
-- Branch name does not match for same IFSC
--------------------------------------------------
SELECT	r.branch_cd, r.branch_nm, rr.branch
FROM	branches r
JOIN	branches_rbi rr
	ON	r.branch_cd = rr.ifsc
WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
AND		r.branch_nm != rr.branch  
AND		rr.BRANCH NOT IN ('NA', '#NAME')
ORDER BY 2

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE r
	SET r.branch_nm = rr.branch
	FROM	branches r
	JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
	AND		r.branch_nm != rr.branch  
	AND		rr.BRANCH NOT IN ('NA', '#NAME')
END

--------------------------------------------------
-- Address does not match for same IFSC
--------------------------------------------------
SELECT	r.branch_cd, r.branch_nm, r.address, rr.address
FROM	branches r
JOIN	branches_rbi rr
	ON	r.branch_cd = rr.ifsc
WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
AND		r.address != rr.address
AND		rr.address != '#NAME'
ORDER BY 2

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE r
	SET		r.address = rr.address
	FROM	branches r
	JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
	AND		r.address != rr.address
	AND		rr.address != '#NAME'

	UPDATE r
	SET		address = REPLACE(r.address, '?', ' ')
	FROM	branches r
	JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	WHERE	GETDATE() BETWEEN r.effective_from_dt AND r.effective_till_dt
	AND		r.address != rr.address
	AND		rr.address != '#NAME'
END

--------------------------------------------------
-- IFSC to be added
--------------------------------------------------
SELECT	rr.*, b.bank_id
FROM	branches_rbi rr
LEFT JOIN	branches r
	ON	rr.ifsc = r.branch_cd
LEFT JOIN	banks_RBI br
	ON	rr.BANK = br.bank_name
LEFT JOIN	banks b
	ON	br.bank_code = b.bank_cd
WHERE	r.branch_cd IS NULL
ORDER BY 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	INSERT INTO branches (bank_id, branch_nm, branch_cd, address, effective_from_dt, effective_till_dt)
	SELECT	b.bank_id, rr.BRANCH, rr.IFSC, COALESCE(rr.ADDRESS, City1 + ' ' + city2 + ' ' + state), GETDATE(), '9999-12-31'
	FROM	branches_rbi rr
	LEFT JOIN	branches r
		ON	rr.ifsc = r.branch_cd
	LEFT JOIN	banks_RBI br
		ON	rr.BANK = br.bank_name
	LEFT JOIN	banks b
		ON	br.bank_code = b.bank_cd
	WHERE	r.branch_cd IS NULL
END

--------------------------------------------------
-- Branch mapping to be corrected for banks exists as branches (Parent Bank)
--------------------------------------------------
SELECT	b.bank_id, r.bank_id, b.*, r.* 
FROM	branches r 
JOIN	branches_rbi rr 
	ON	rr.IFSC = r.branch_cd
JOIN	banks b
	ON	b.bank_nm = rr.BRANCH
WHERE	b.parent_bank_id IS NOT NULL
AND		b.bank_id != r.bank_id

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE r
	SET r.bank_id = b.bank_id
	FROM	branches r 
	JOIN	branches_rbi rr 
		ON	rr.IFSC = r.branch_cd
	JOIN	banks b
		ON	b.bank_nm = rr.BRANCH
	WHERE	b.parent_bank_id IS NOT NULL
	AND		b.bank_id != r.bank_id
END

--------------------------------------------------
-- Bank to be updated for existing branch
--------------------------------------------------
SELECT	b.bank_nm, r.branch_cd, r.branch_nm, r.address, x.bank_nm
FROM	branches r
JOIN	banks b 
	ON	r.bank_id = b.bank_id
JOIN	branches_rbi rr
	ON	r.branch_cd = rr.ifsc
JOIN banks x 
	ON	rr.bank = x.bank_nm
WHERE	b.parent_bank_id IS NULL
AND		b.bank_id != x.bank_id
ORDER BY 5, 1

IF @@ROWCOUNT > 0 AND @flag = 'U'
BEGIN
	UPDATE r
	SET		r.bank_id = x.bank_id
	FROM	branches r
	JOIN	banks b 
		ON	r.bank_id = b.bank_id
	JOIN	branches_rbi rr
		ON	r.branch_cd = rr.ifsc
	JOIN banks x 
		ON	rr.bank = x.bank_nm
	WHERE	b.parent_bank_id IS NULL
	AND		b.bank_id != x.bank_id
END

--------------------------------------------------
-- To be marked ineffective
--------------------------------------------------
--SELECT	*
--FROM	banks b
--WHERE	bank_id IN (151, 152, 379, 456, 509)
--	AND	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt

--IF @@ROWCOUNT > 0 AND @flag = 'U'
--BEGIN
--	UPDATE banks
--	SET effective_till_dt = GETDATE()
--	WHERE	bank_id IN (151, 152, 379, 456, 509)
--		AND	GETDATE() BETWEEN effective_from_dt AND effective_till_dt
--END

--------------------------------------------------
-- To be marked ineffective, as these were merged
--------------------------------------------------
--SELECT	*
--FROM	banks b
--WHERE	bank_id IN (134, 137, 135, 63, 64)
--	AND	GETDATE() BETWEEN b.effective_from_dt AND b.effective_till_dt

--IF @@ROWCOUNT > 0 AND @flag = 'U'
--BEGIN
--	UPDATE banks
--	SET effective_till_dt = GETDATE()
--	WHERE	bank_id IN (134, 137, 135, 63, 64)
--		AND	GETDATE() BETWEEN effective_from_dt AND effective_till_dt
--END

--------------------------------------------------
-- Remove / Restore of Banks and Branches 
--------------------------------------------------
/*

-- Remove copy
	DROP TABLE Banks_copy
	DROP TABLE Branches_copy

-- Restore from copy
	DELETE FROM branches
	DELETE FROM banks


	SET IDENTITY_INSERT banks ON

	INSERT INTO banks (bank_id, bank_nm, bank_cd, effective_from_dt, effective_till_dt)
	SELECT bank_id, bank_nm, bank_cd, effective_from_dt, effective_till_dt
	FROM Banks_copy

	SET IDENTITY_INSERT banks OFF


	SET IDENTITY_INSERT branches ON

	INSERT INTO branches (branch_id, bank_id, bank_centre_id, branch_nm, branch_cd, address, effective_from_dt, effective_till_dt)
	SELECT branch_id, bank_id, bank_centre_id, branch_nm, branch_cd, address, effective_from_dt, effective_till_dt
	FROM Branches_copy

	SET IDENTITY_INSERT branches OFF
*/
