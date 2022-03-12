using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.Utils;

namespace DCC.UMB.CDF.UIControls.Grid
{
    /// <summary>
    /// Represents the data of a row of the grid.
    /// </summary>
    public class DCCDataRowView
    {
        private DataRowView rowView = null;
        private DCCGrid grid = null;
        public DCCDataRowView(System.Data.DataRowView view, DCCGrid containerGrid)
        {
            this.rowView = view;
            this.grid = containerGrid;
        }
        public DCCDataRowView(System.Data.DataRow row)
        {
            DataView tempView = new DataView(row.Table);
            tempView.RowFilter = GridDataModel.ROW_GUID_COLUMN_NAME + "='" + row[GridDataModel.ROW_GUID_COLUMN_NAME].ToString() + "'";
            this.rowView = tempView[0];
        }
        
        /// <summary>
        /// Gets the identifier for the grid row to which this DCCDataRowView represetns.
        /// </summary>
        public string RowIdentifier
        {
            get { return this.rowView[GridDataModel.ROW_GUID_COLUMN_NAME].ToString(); }
        }

        /// <summary>
        /// Gets the index of this row.
        /// </summary>
        public int RowIndex
        {
            get
            {
                return this.grid.GetGridRowIndexFromRowIdentifier(RowIdentifier);
            }
        }
        public int DisplayOrder
        {
            get
            {
                return this.grid.GetDisplayOrder(this.RowIdentifier);
            }
        }

        /// <summary>
        /// Returns the row state of the grid row to which this DCCDataRowView represetns.
        /// </summary>
        public RowStates RowState
        {
            get { return (RowStates)this.rowView[GridDataModel.ROW_STATE_COLUMN_NAME]; }
        }

        /// <summary>
        /// Returns the value at the cell specified by the column Index
        /// </summary>
        /// <param name="columnIndex">Index of the column where the cell value is required.</param>
        /// <returns></returns>
        public object this[int columnIndex]
        {
            get { return rowView[columnIndex]; }
        }

        /// <summary>
        /// Returns the value of the cell specified by the columnName
        /// </summary>
        /// <param name="colName">Name of the column where the cell value is required.</param>
        /// <returns></returns>
        public object this[string colName]
        {
            get { return rowView[colName]; }
        }
        
        /// <summary>
        /// Returns the nullable integer value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public int? AsInt(string colName)
        {
            int? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                try
                {
                    long embeddedLongValue = (long)rowView[colName];
                    returnValue = (int)embeddedLongValue;
                }
                catch
                {
                    int embeddedShortValue = (int)(rowView[colName]);
                    returnValue = embeddedShortValue;
                }
            }
            return returnValue;            
        }

        /// <summary>
        /// Returns the nullable short value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public short? AsShort(string colName)
        {
            short? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                try
                {
                    returnValue = Convert.ToInt16(rowView[colName]);
                    //returnValue = (short)embeddedLongValue;
                }
                catch
                {
                    short embeddedShortValue = (short)(rowView[colName]);
                    returnValue = embeddedShortValue;
                }
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the nullable long value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public long? AsLng(string colName)
        {
            long? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                long embeddedLongValue = (long)rowView[colName];
                returnValue = embeddedLongValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the LookupResult value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a LookupResult object. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public LookupResult AsLookupResult(string colName)
        {
            LookupResult returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                returnValue = (LookupResult)rowView[colName];
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the nullable byte value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public byte? AsByte(string colName)
        {
            try
            {
                long? longValue = AsLng(colName);
                if (longValue.HasValue)
                {
                    return (byte?)longValue;
                }
                return null;
            }catch
            {
                byte? returnValue;
                if (rowView[colName] == null || rowView[colName] == DBNull.Value)
                {
                    returnValue = null;
                }
                else
                {
                    byte embeddedByteValue = (byte)rowView[colName];
                    returnValue = embeddedByteValue;
                }
                return returnValue;
            }
        }

        /// <summary>
        /// Returns the nullable float value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public float? AsFlt(string colName)
        {
            double? doubleValue = AsDbl(colName);
            if (doubleValue.HasValue)
            {
                return (float?)doubleValue;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Returns the nullable double value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public double? AsDbl(string colName)
        {
            double? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                double embeddedDoubleValue = (double)rowView[colName];
                returnValue = embeddedDoubleValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the nullable decimal value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public decimal? AsDcml(string colName)
        {
            decimal? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                double? embeddedDoubleValue = (double?)rowView[colName];
                returnValue = (decimal?)embeddedDoubleValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the nullable datetime value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public DateTime? AsDTM(string colName)
        {
            DateTime? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                DateTime embeddedDoubleValue = (DateTime)rowView[colName];
                returnValue = embeddedDoubleValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the object value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public object AsObject(string colName)
        {
            object returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                returnValue = rowView[colName];
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the byte[] value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public byte[] AsByteArr(string colName)
        {
            byte[] returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                byte[] embeddedValue = (byte[])rowView[colName];
                returnValue = embeddedValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the nullable boolean value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public bool? AsBln(string colName)
        {
            bool? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                bool embeddedDoubleValue = (bool)rowView[colName];
                returnValue = embeddedDoubleValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the string value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. 
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public string AsStr(string colName)
        {
            return rowView == null ? null : rowView[colName].ToString();
        }

        /// <summary>
        /// Returns the nullable boolean value of the cell of the column specified by parameter colName.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        /// <remarks>The return value is a nullable primitive. It is assumed that the cell will have string 
        /// representation of boolean in terms of "Yes" or "No " values. If "Yes" returns a true, if "No" then false.
        /// If the cast is not valid, an exception is thrown. If the cell does not have any value in it, then a null is returned.</remarks>
        /// <returns></returns>
        public bool? AsBlnFromBlnString(string colName)
        {
            bool? returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = null;
            }
            else
            {
                bool embeddedDoubleValue = UtilityManager.GetBlnFromBlnString((string)rowView[colName]);
                returnValue = embeddedDoubleValue;
            }
            return returnValue;
        }
        /// <summary>
        /// Returns string representation of the boolean value present in the cell. A "Yes" is 
        /// returned if the cell value evaluates to be a true, else "No" is returned.
        /// </summary>
        /// <param name="colName">Name of the column which identifies the cell whose value is sought</param>
        public string AsBlnStringFromBln(string colName)
        {
            string returnValue;
            if (rowView[colName] == null || rowView[colName] == DBNull.Value)
            {
                returnValue = UtilityManager.GetBlnString(false);
            }
            else
            {
                returnValue = UtilityManager.GetBlnString((bool)rowView[colName]);
            }
            return returnValue;
        }

        public object GetTypedValue(string columnName, Type type)
        {
            if (rowView[columnName] != null && rowView[columnName].GetType() == typeof(LookupResult))
            {
                return ((LookupResult)rowView[columnName]).ValueMember;
            }
            if (type == typeof(int?))
            {
                return AsInt(columnName);
            }           
            else if (type == typeof(short?))
            {
                return AsShort(columnName);
            }            
            else if (type == typeof(long?))
            {
                return AsLng(columnName);
            }
            else if (type == typeof(double?))
            {
                return AsDbl(columnName);
            }
            else if (type == typeof(string))
            {
                return AsStr(columnName);
            }
            else if (type == typeof(DateTime?))
            {
                return AsDTM(columnName);
            }          
            else if (type == typeof(byte?))
            {
                return AsByte(columnName);
            }
            else if (type == typeof(bool?))
            {
                return AsBln(columnName);                
            }
            else if (type == typeof(byte[]))
            {
                return AsByteArr(columnName);
            }
            else if (type == typeof(decimal?))
            {
                return AsDcml(columnName);
            }
            throw new Exception("Unsupported type for conversion");
        }
    }
}
