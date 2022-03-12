namespace DCC.ZOS.ZSM.Controls.Misc
{
    partial class AddressBox
    {

        #region Component Designer generated code
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtAddress1 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtAddress2 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtPin = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.DistrictorCitiesLookup = new DCC.UMB.CDBLookups.DistrictorCitiesLookup();
            this.CountryLookup = new DCC.UMB.CDBLookups.CountriesLookup();
            this.StateLookup = new DCC.UMB.CDBLookups.StatesLookup();
            this.postOfficeOrCityLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.PostOfficeOrCityLookup();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.AutoSize = true;
            this.dccTableLayoutPanel1.ColumnCount = 4;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTableLayoutPanel1.Controls.Add(this.txtAddress1, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtAddress2, 0, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.txtPin, 1, 4);
            this.dccTableLayoutPanel1.Controls.Add(this.DistrictorCitiesLookup, 0, 3);
            this.dccTableLayoutPanel1.Controls.Add(this.CountryLookup, 0, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.StateLookup, 2, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.postOfficeOrCityLookup, 2, 3);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 5;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 22.85714F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 21.42857F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(277, 210);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // txtAddress1
            // 
            this.txtAddress1.AllowsNew = false;
            this.txtAddress1.AllowsReference = false;
            this.txtAddress1.AllowsUpdate = false;
            this.txtAddress1.ApplicationIdForDbConnection = null;
            this.txtAddress1.BackColor = System.Drawing.Color.Transparent;
            this.txtAddress1.CalledScreenApplicationId = null;
            this.txtAddress1.CalledScreenTypeName = null;
            this.txtAddress1.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.txtAddress1, 4);
            this.txtAddress1.DisplayText = "";
            this.txtAddress1.DisplayTextBindingKey = "address_line_1";
            this.txtAddress1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtAddress1.EditingControlDataGridView = null;
            this.txtAddress1.EditingControlFormattedValue = "";
            this.txtAddress1.EditingControlRowIndex = 0;
            this.txtAddress1.EditingControlValueChanged = false;
            this.txtAddress1.EnableToolTip = false;
            this.txtAddress1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAddress1.IdText = null;
            this.txtAddress1.IdTextBindingKey = null;
            this.txtAddress1.Location = new System.Drawing.Point(4, 3);
            this.txtAddress1.Lookup = false;
            this.txtAddress1.LookupColumns = null;
            this.txtAddress1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAddress1.LookupResult = null;
            this.txtAddress1.LookupTitle = "Address";
            this.txtAddress1.Mandatory = true;
            this.txtAddress1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtAddress1.MaxCharacterLength = 50;
            this.txtAddress1.MaximumSize = new System.Drawing.Size(1300, 70);
            this.txtAddress1.MinCharactersForQuery = 0;
            this.txtAddress1.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtAddress1.Name = "txtAddress1";
            this.txtAddress1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtAddress1.PascalCase = false;
            this.txtAddress1.RangeInQueryMode = false;
            this.txtAddress1.ReadOnly = false;
            this.txtAddress1.RegularExpressionValidator = null;
            this.txtAddress1.Size = new System.Drawing.Size(269, 40);
            this.txtAddress1.TabIndex = 0;
            this.txtAddress1.Title = "Address";
            this.txtAddress1.ToolTipLookupField = "information";
            this.txtAddress1.ValueText = null;
            // 
            // txtAddress2
            // 
            this.txtAddress2.AllowsNew = false;
            this.txtAddress2.AllowsReference = false;
            this.txtAddress2.AllowsUpdate = false;
            this.txtAddress2.ApplicationIdForDbConnection = null;
            this.txtAddress2.BackColor = System.Drawing.Color.Transparent;
            this.txtAddress2.CalledScreenApplicationId = null;
            this.txtAddress2.CalledScreenTypeName = null;
            this.txtAddress2.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.txtAddress2, 4);
            this.txtAddress2.DisplayText = "";
            this.txtAddress2.DisplayTextBindingKey = "address_line_2";
            this.txtAddress2.Dock = System.Windows.Forms.DockStyle.Top;
            this.txtAddress2.EditingControlDataGridView = null;
            this.txtAddress2.EditingControlFormattedValue = "";
            this.txtAddress2.EditingControlRowIndex = 0;
            this.txtAddress2.EditingControlValueChanged = false;
            this.txtAddress2.EnableToolTip = false;
            this.txtAddress2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAddress2.IdText = null;
            this.txtAddress2.IdTextBindingKey = null;
            this.txtAddress2.Location = new System.Drawing.Point(4, 49);
            this.txtAddress2.Lookup = false;
            this.txtAddress2.LookupColumns = null;
            this.txtAddress2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAddress2.LookupResult = null;
            this.txtAddress2.LookupTitle = "";
            this.txtAddress2.Mandatory = false;
            this.txtAddress2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtAddress2.MaxCharacterLength = 50;
            this.txtAddress2.MaximumSize = new System.Drawing.Size(1300, 90);
            this.txtAddress2.MinCharactersForQuery = 0;
            this.txtAddress2.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtAddress2.Name = "txtAddress2";
            this.txtAddress2.PascalCase = false;
            this.txtAddress2.RangeInQueryMode = false;
            this.txtAddress2.ReadOnly = false;
            this.txtAddress2.RegularExpressionValidator = null;
            this.txtAddress2.Size = new System.Drawing.Size(269, 22);
            this.txtAddress2.TabIndex = 1;
            this.txtAddress2.Title = "";
            this.txtAddress2.ToolTipLookupField = "information";
            this.txtAddress2.ValueText = null;
            // 
            // txtPin
            // 
            this.txtPin.AllowsNew = false;
            this.txtPin.AllowsReference = false;
            this.txtPin.AllowsUpdate = false;
            this.txtPin.ApplicationIdForDbConnection = null;
            this.txtPin.BackColor = System.Drawing.Color.Transparent;
            this.txtPin.CalledScreenApplicationId = null;
            this.txtPin.CalledScreenTypeName = null;
            this.txtPin.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.txtPin, 2);
            this.txtPin.DisplayText = "";
            this.txtPin.DisplayTextBindingKey = "pin_or_zip_code";
            this.txtPin.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPin.EditingControlDataGridView = null;
            this.txtPin.EditingControlFormattedValue = "";
            this.txtPin.EditingControlRowIndex = 0;
            this.txtPin.EditingControlValueChanged = false;
            this.txtPin.EnableToolTip = false;
            this.txtPin.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPin.IdText = null;
            this.txtPin.IdTextBindingKey = null;
            this.txtPin.Location = new System.Drawing.Point(73, 167);
            this.txtPin.Lookup = false;
            this.txtPin.LookupColumns = null;
            this.txtPin.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtPin.LookupResult = null;
            this.txtPin.LookupTitle = "Pincode";
            this.txtPin.Mandatory = false;
            this.txtPin.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtPin.MaxCharacterLength = 6;
            this.txtPin.MaximumSize = new System.Drawing.Size(1300, 70);
            this.txtPin.MinCharactersForQuery = 0;
            this.txtPin.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtPin.Name = "txtPin";
            this.txtPin.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtPin.PascalCase = false;
            this.txtPin.RangeInQueryMode = false;
            this.txtPin.ReadOnly = false;
            this.txtPin.RegularExpressionValidator = null;
            this.txtPin.Size = new System.Drawing.Size(130, 40);
            this.txtPin.TabIndex = 6;
            this.txtPin.Title = "Pincode";
            this.txtPin.ToolTipLookupField = "information";
            this.txtPin.ValueText = null;
            // 
            // DistrictorCitiesLookup
            // 
            this.DistrictorCitiesLookup.AllowsNew = false;
            this.DistrictorCitiesLookup.AllowsReference = false;
            this.DistrictorCitiesLookup.AllowsUpdate = false;
            this.DistrictorCitiesLookup.BackColor = System.Drawing.Color.Transparent;
            this.DistrictorCitiesLookup.CalledScreenApplicationId = null;
            this.DistrictorCitiesLookup.CalledScreenTypeName = null;
            this.DistrictorCitiesLookup.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.DistrictorCitiesLookup, 2);
            this.DistrictorCitiesLookup.DisplayText = "";
            this.DistrictorCitiesLookup.DisplayTextBindingKey = "district_nm";
            this.DistrictorCitiesLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.DistrictorCitiesLookup.EditingControlDataGridView = null;
            this.DistrictorCitiesLookup.EditingControlFormattedValue = null;
            this.DistrictorCitiesLookup.EditingControlRowIndex = 0;
            this.DistrictorCitiesLookup.EditingControlValueChanged = true;
            this.DistrictorCitiesLookup.EnableToolTip = false;
            this.DistrictorCitiesLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.DistrictorCitiesLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DistrictorCitiesLookup.IdText = "";
            this.DistrictorCitiesLookup.IdTextBindingKey = "district_or_city_id";
            this.DistrictorCitiesLookup.Location = new System.Drawing.Point(4, 120);
            this.DistrictorCitiesLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.DistrictorCitiesLookup.LookupResult = null;
            this.DistrictorCitiesLookup.LookupTitle = "District / City";
            this.DistrictorCitiesLookup.Mandatory = false;
            this.DistrictorCitiesLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.DistrictorCitiesLookup.MaxCharacterLength = 32767;
            this.DistrictorCitiesLookup.MaximumSize = new System.Drawing.Size(1300, 70);
            this.DistrictorCitiesLookup.MinCharactersForQuery = 0;
            this.DistrictorCitiesLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.DistrictorCitiesLookup.Name = "DistrictorCitiesLookup";
            this.DistrictorCitiesLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.DistrictorCitiesLookup.PascalCase = false;
            this.DistrictorCitiesLookup.RangeInQueryMode = false;
            this.DistrictorCitiesLookup.ReadOnly = false;
            this.DistrictorCitiesLookup.RegularExpressionValidator = null;
            this.DistrictorCitiesLookup.Size = new System.Drawing.Size(130, 41);
            this.DistrictorCitiesLookup.StateCode = 0;
            this.DistrictorCitiesLookup.TabIndex = 4;
            this.DistrictorCitiesLookup.Title = "District / City";
            this.DistrictorCitiesLookup.ToolTipLookupField = "information";
            this.DistrictorCitiesLookup.ValueText = "";
            this.DistrictorCitiesLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.DistrictorCitiesLookup_LookupDialogShowing);
            // 
            // CountryLookup
            // 
            this.CountryLookup.AllowsNew = false;
            this.CountryLookup.AllowsReference = false;
            this.CountryLookup.AllowsUpdate = false;
            this.CountryLookup.BackColor = System.Drawing.Color.Transparent;
            this.CountryLookup.CalledScreenApplicationId = null;
            this.CountryLookup.CalledScreenTypeName = null;
            this.CountryLookup.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.CountryLookup, 2);
            this.CountryLookup.DisplayText = "";
            this.CountryLookup.DisplayTextBindingKey = "country_nm";
            this.CountryLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CountryLookup.EditingControlDataGridView = null;
            this.CountryLookup.EditingControlFormattedValue = null;
            this.CountryLookup.EditingControlRowIndex = 0;
            this.CountryLookup.EditingControlValueChanged = true;
            this.CountryLookup.EnableToolTip = false;
            this.CountryLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.CountryLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CountryLookup.IdText = "";
            this.CountryLookup.IdTextBindingKey = "country_id";
            this.CountryLookup.Location = new System.Drawing.Point(4, 74);
            this.CountryLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.CountryLookup.LookupResult = null;
            this.CountryLookup.LookupTitle = "Country";
            this.CountryLookup.Mandatory = false;
            this.CountryLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.CountryLookup.MaxCharacterLength = 32767;
            this.CountryLookup.MaximumSize = new System.Drawing.Size(1300, 70);
            this.CountryLookup.MinCharactersForQuery = 0;
            this.CountryLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.CountryLookup.Name = "CountryLookup";
            this.CountryLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.CountryLookup.PascalCase = false;
            this.CountryLookup.RangeInQueryMode = false;
            this.CountryLookup.ReadOnly = false;
            this.CountryLookup.RegularExpressionValidator = null;
            this.CountryLookup.Size = new System.Drawing.Size(130, 40);
            this.CountryLookup.TabIndex = 2;
            this.CountryLookup.Title = "Country";
            this.CountryLookup.ToolTipLookupField = "information";
            this.CountryLookup.ValueText = "";
            // 
            // StateLookup
            // 
            this.StateLookup.AllowsNew = false;
            this.StateLookup.AllowsReference = false;
            this.StateLookup.AllowsUpdate = false;
            this.StateLookup.BackColor = System.Drawing.Color.Transparent;
            this.StateLookup.CalledScreenApplicationId = null;
            this.StateLookup.CalledScreenTypeName = null;
            this.StateLookup.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.StateLookup, 2);
            this.StateLookup.CountryCode = 0;
            this.StateLookup.DisplayText = "";
            this.StateLookup.DisplayTextBindingKey = "state_nm";
            this.StateLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.StateLookup.EditingControlDataGridView = null;
            this.StateLookup.EditingControlFormattedValue = null;
            this.StateLookup.EditingControlRowIndex = 0;
            this.StateLookup.EditingControlValueChanged = true;
            this.StateLookup.EnableToolTip = false;
            this.StateLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.StateLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StateLookup.IdText = "";
            this.StateLookup.IdTextBindingKey = "state_id";
            this.StateLookup.Location = new System.Drawing.Point(142, 74);
            this.StateLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.StateLookup.LookupResult = null;
            this.StateLookup.LookupTitle = "State";
            this.StateLookup.Mandatory = false;
            this.StateLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.StateLookup.MaxCharacterLength = 32767;
            this.StateLookup.MaximumSize = new System.Drawing.Size(1300, 70);
            this.StateLookup.MinCharactersForQuery = 0;
            this.StateLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.StateLookup.Name = "StateLookup";
            this.StateLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.StateLookup.PascalCase = false;
            this.StateLookup.RangeInQueryMode = false;
            this.StateLookup.ReadOnly = false;
            this.StateLookup.RegularExpressionValidator = null;
            this.StateLookup.Size = new System.Drawing.Size(131, 40);
            this.StateLookup.TabIndex = 3;
            this.StateLookup.Title = "State";
            this.StateLookup.ToolTipLookupField = "information";
            this.StateLookup.ValueText = "";
            this.StateLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.StateLookup_LookupDialogShowing);
            // 
            // postOfficeOrCityLookup
            // 
            this.postOfficeOrCityLookup.AllowsNew = false;
            this.postOfficeOrCityLookup.AllowsReference = false;
            this.postOfficeOrCityLookup.AllowsUpdate = false;
            this.postOfficeOrCityLookup.ApplicationIdForDbConnection = null;
            this.postOfficeOrCityLookup.BackColor = System.Drawing.Color.Transparent;
            this.postOfficeOrCityLookup.CalledScreenApplicationId = null;
            this.postOfficeOrCityLookup.CalledScreenTypeName = null;
            this.postOfficeOrCityLookup.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.postOfficeOrCityLookup, 2);
            this.postOfficeOrCityLookup.DisplayText = "";
            this.postOfficeOrCityLookup.DisplayTextBindingKey = "post_office_or_city_nm";
            this.postOfficeOrCityLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.postOfficeOrCityLookup.EditingControlDataGridView = null;
            this.postOfficeOrCityLookup.EditingControlFormattedValue = null;
            this.postOfficeOrCityLookup.EditingControlRowIndex = 0;
            this.postOfficeOrCityLookup.EditingControlValueChanged = true;
            this.postOfficeOrCityLookup.EnableToolTip = false;
            this.postOfficeOrCityLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.postOfficeOrCityLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.postOfficeOrCityLookup.IdText = "";
            this.postOfficeOrCityLookup.IdTextBindingKey = "post_office_or_city_id";
            this.postOfficeOrCityLookup.Location = new System.Drawing.Point(142, 120);
            this.postOfficeOrCityLookup.Lookup = true;
            this.postOfficeOrCityLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.postOfficeOrCityLookup.LookupResult = null;
            this.postOfficeOrCityLookup.LookupTitle = "Post Office / City";
            this.postOfficeOrCityLookup.Mandatory = false;
            this.postOfficeOrCityLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.postOfficeOrCityLookup.MaxCharacterLength = 32767;
            this.postOfficeOrCityLookup.MaximumSize = new System.Drawing.Size(1300, 70);
            this.postOfficeOrCityLookup.MinCharactersForQuery = 0;
            this.postOfficeOrCityLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.postOfficeOrCityLookup.Name = "postOfficeOrCityLookup";
            this.postOfficeOrCityLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.postOfficeOrCityLookup.PascalCase = false;
            this.postOfficeOrCityLookup.RangeInQueryMode = false;
            this.postOfficeOrCityLookup.ReadOnly = false;
            this.postOfficeOrCityLookup.RegularExpressionValidator = null;
            this.postOfficeOrCityLookup.Size = new System.Drawing.Size(131, 41);
            this.postOfficeOrCityLookup.StateCode = 0;
            this.postOfficeOrCityLookup.TabIndex = 5;
            this.postOfficeOrCityLookup.Title = "Post Office / City";
            this.postOfficeOrCityLookup.ToolTipLookupField = "information";
            this.postOfficeOrCityLookup.ValueText = "";
            this.postOfficeOrCityLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.postOfficeOrCityLookup_LookupDialogShowing);
            // 
            // AddressBox
            // 
            this.Controls.Add(this.dccTableLayoutPanel1);
            this.Name = "AddressBox";
            this.Size = new System.Drawing.Size(277, 210);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion


        public UMB.CDF.UIControls.TextControls.DCCTextField txtAddress1;
        public UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        public UMB.CDF.UIControls.TextControls.DCCTextField txtAddress2;
        public UMB.CDF.UIControls.TextControls.DCCTextField txtPin;
        public UMB.CDBLookups.DistrictorCitiesLookup DistrictorCitiesLookup;
        public UMB.CDBLookups.CountriesLookup CountryLookup;
        public UMB.CDBLookups.StatesLookup StateLookup;
        public ZSMLookups.PostOfficeOrCityLookup postOfficeOrCityLookup;
        private System.ComponentModel.IContainer components;
    }
}
