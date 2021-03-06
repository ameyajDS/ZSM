if Exists (select 1 from sysobjects where name = 'insItems' and type ='P')
DROP PROCEDURE insItems
Go
CREATE	PROCEDURE insItems
(	
	/*
	<SP_SUMMARY>
	
	<DESCRIPTION> 
		This is the description of the procedure. Explain here what
		it does and what not.
	</DESCRIPTION>

	<REMARKS>
		Write any extra remarks here. It can be a paragraph explaining the business
		Logic sometimes.
	</REMARKS>
	
	<RETURNS>
		Explain here what is reutnred out of this Procedure. The OUT/INOUT parameters 
		will be listed in the parameter documentaion itself, this section will cover
		what all things are returned out as record sets.
	</RETURNS>
	
	</SP_SUMMARY>
	*/
	@p_item_head_cd item_head_cd, --<DESC>First Sample of description</DESC>
	@p_item_sub_head_cd item_sub_head_cd,--<DESC>Second Sample, the closing tag is optional
	@p_item_no smallint,--<desc>Thrid Sample, you can specify the *desc* in lower case as well, but mixed case is not supported.
	@p_item_nm varchar(100),
	@p_item_sort_nm	varchar(100),
	@p_item_class item_class,
	@p_purchase_item_class item_class,
	@p_consumption_unit_id measuring_unit_id,
	@p_purchase_unit_id measuring_unit_id,
	@p_is_fixed_purchase_unit Boolean,
	@p_conversion_term_from conversion_term,
	@p_conversion_term_to conversion_term,
	@p_shelf_life smallint,
	@p_shelf_life_unit varchar(6),
	@p_default_location_id storage_location_id,
	@p_is_capital_item Boolean,
	@p_is_non_moving_item Boolean,
	@p_is_manufacturer_required Boolean,
	@p_is_brand_required Boolean,
	@p_is_expiry_date_required Boolean,
	@p_min_stock_days stock_cmpttn_period_days,
	@p_max_stock_days stock_cmpttn_period_days,
	@p_reorder_stock_days stock_cmpttn_period_days,	
	@p_stock_computation_usage varchar(6),
	@p_min_stock_level stock_qty0,
	@p_max_stock_level stock_qty,
	@p_reorder_stock_level stock_qty0,
	@p_effective_from datetime,
	@p_effective_till datetime,
	@p_technical_specifications varchar(4000) = NULL


	/* Header Ends */
)
WITH ENCRYPTION
AS
BEGIN
	DECLARE @v_inserted_item_id int
	DECLARE @v_manufacturere_empty int

	INSERT INTO items
		(item_head_cd, item_sub_head_cd, item_no, item_nm, item_sort_nm, item_class, 
		purchase_item_class, consumption_unit_id, purchase_unit_id, is_fixed_purchase_unit, 
		conversion_term_from, conversion_term_to, shelf_life, shelf_life_unit, 
		default_location_id, is_capital_item, is_non_moving_item, is_manufacturer_required,
		is_brand_required, is_expiry_date_required, min_stock_days, max_stock_days, reorder_stock_days, 
		stock_computation_usage, min_stock_level, max_stock_level, reorder_stock_level, 
		effective_from, effective_till)
	VALUES
		(@p_item_head_cd, @p_item_sub_head_cd, @p_item_no, @p_item_nm, @p_item_sort_nm, @p_item_class, 
		 @p_purchase_item_class, @p_consumption_unit_id, @p_purchase_unit_id, @p_is_fixed_purchase_unit,
		 @p_conversion_term_from, @p_conversion_term_to, @p_shelf_life, @p_shelf_life_unit,
		 @p_default_location_id, @p_is_capital_item, @p_is_non_moving_item, @p_is_manufacturer_required,
		 @p_is_brand_required, @p_is_expiry_date_required, @p_min_stock_days, @p_max_stock_days, @p_reorder_stock_days,
		 @p_stock_computation_usage, @p_min_stock_level, @p_max_stock_level, @p_reorder_stock_level,
		 @p_effective_from, @p_effective_till)

	SELECT @v_inserted_item_id = IDENT_CURRENT('items')

	SELECT 
		@v_manufacturere_empty = manufacturer_id
	FROM
		manufacturers
	WHERE
		manufacturer_cd = '   '

	INSERT INTO item_manufacturer_brands
		(item_id, manufacturer_id, brand_cd, display_order)
	VALUES
		( @v_inserted_item_id , @v_manufacturere_empty , ' ', 0 )

	IF @p_technical_specifications IS NOT NULL
		BEGIN
			INSERT INTO items_specifications
				(item_id, technical_specifications)
			VALUES
				(@v_inserted_item_id, @p_technical_specifications)
		END

	SELECT @v_inserted_item_id as item_id

	------------------ trigger start----------------------

	/*DECLARE	@v_mps_item_id	INT

	----------------------------- CREATE A NEW RECORD IN MPS ------------------------------------------

	--- To avoid recursive insert we first need to check that the alternate key does NOT exists in MPS
	IF NOT	EXISTS	(	SELECT	mi.item_id
						FROM	items AS ins
						JOIN	ppc..Items AS mi
							ON	(	ins.item_head_cd		= mi.Head_Code
								AND	ins.item_sub_head_cd	= mi.SubHead_Code
								AND	ins.item_no				= mi.Item_Number
								)
						WHERE ins.item_id = @v_inserted_item_id
					)

		BEGIN
			--- insert the record in the items table of MPS
			INSERT	INTO	ppc..Items	(
											Head_Code,
											SubHead_Code,
											Item_Number,
											Item_Name,
											Item_SortName,
											Item_Class,
											Item_Consumption_Unit,
											Item_Purchase_Unit,
											Item_Conversion_Numerator,
											Item_Conversion_Denominator,
											Item_Min_StockQty,
											Item_Max_StockQty,
											Item_Reorder_Qty,
											Item_Min_Eco_OrderQty,
											Item_Max_Eco_OrderQty,
											Item_ShelfLife_Unit,
											Item_ShelfLife,
											Item_Is_Sample,
											Acct_ID,
											Item_Authorisation,
											Valid
										)
			SELECT	ins.item_head_cd,
					ins.item_sub_head_cd,
					ins.item_no,
					ins.item_nm,
					ins.item_sort_nm,
					ins.item_class,
					c_unit.measuring_unit_cd AS Item_Consumption_Unit,
					p_unit.measuring_unit_cd AS Item_Purchase_Unit,
					ins.conversion_term_from AS Item_Conversion_Numerator,
					ins.conversion_term_to AS Item_Conversion_Denominator,
					COALESCE (ins.min_stock_level, 0) AS Item_Min_StockQty,
					COALESCE (ins.max_stock_level, 0) AS Item_Max_StockQty,
					COALESCE (ins.reorder_stock_level, 0) AS Item_Reorder_Qty,
					0 AS Item_Min_Eco_OrderQty, 								-- Review
					0 AS Item_Max_Eco_OrderQty, 								-- Review
					ins.shelf_life_unit,
					ins.shelf_life,
					'No' AS Item_Is_Sample,										-- Review
					syn_ac_hd.mps_id AS Acct_Id,
					str.store_nm	AS Item_Authorisation,
					CASE WHEN GetDate () BETWEEN ins.effective_from AND ins.effective_till THEN 'Yes' ELSE 'No' END AS Valid
			FROM	items 				AS ins
			JOIN	CDB..measuring_units	AS c_unit
				ON	(	ins.consumption_unit_id		= c_unit.measuring_unit_id	)
			JOIN	CDB..measuring_units	AS p_unit
				ON	(	ins.purchase_unit_id		= p_unit.measuring_unit_id	)
			JOIN	item_heads	AS itm_hd
				ON	(	ins.item_head_cd			= itm_hd.item_head_cd	)
			JOIN	item_sub_heads	AS sub_hd
				ON	(	sub_hd.item_head_cd			= itm_hd.item_head_cd
					AND	ins.item_sub_head_cd		= sub_hd.item_sub_head_cd
					)
			JOIN	ppc..sync_account_heads AS syn_ac_hd
				ON	(	syn_ac_hd.sim_id			= sub_hd.account_head_cd	)
			JOIN	stores	AS str
				ON	(	itm_hd.authorised_store_id	= str.store_id	)
			WHERE  ins.item_id = @v_inserted_item_id


			--- Take the identity value generated
			SET	@v_mps_item_id	= IDENT_CURRENT ('ppc..items')

			IF (@@ERROR > 0)
				BEGIN
					--Raising The Error as no rows were updated
					EXEC SysAdmin..RaiseErrorMessage 'NotAffected', Null, Null, Null, Null
					RETURN
				END


			--- Now insert the record into the sync_items table in MPS to store the mapping
			INSERT	INTO	ppc..sync_items	(
											mps_id,
											sim_id
										)
			VALUES	(@v_mps_item_id, @v_inserted_item_id)			

			IF (@@ERROR > 0)
				BEGIN
					--Raising The Error as no rows were updated
					EXEC SysAdmin..RaiseErrorMessage 'NotAffected', Null, Null, Null, Null
					RETURN
				END


		END




-------------------------------------------------specifications ----------------------



	---- UPDATE THE Item_Specs in the MPS..Items table too
	UPDATE	ppc..Items
		SET	Item_Specs	=	LEFT (@p_technical_specifications, 1000)	--- only 1000 characters supported in MPS
	WHERE	ppc..Items.Item_Id	= @v_mps_item_id
	
	IF (@@ROWCOUNT = 0)
		BEGIN
			--Raising The Error as no rows were updated
			EXEC SysAdmin..RaiseErrorMessage 'NotAffected', Null, Null, Null, Null
			RETURN
		END


	------------------- trigger end -------------------------------
*/
