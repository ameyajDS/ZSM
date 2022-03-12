using System;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.DBFacade;
using DCC.UMB.CDF.MGMT.Controller;
using System.ComponentModel;
public class CDBAbstractScreen : AbstractScreen
{
    protected CDB_APPDbFacade dbFacade = null;
    private string objIdForLogOperation = default(string);
    protected override void InitializeDbFacade()
    {
        if (dbFacade == null) { this.dbFacade = new CDB_APPDbFacade("CDB_APP"); }
    }
    public virtual void CreateData()
    {
        throw new Exception("Child Screen must implement this method");
    }
    public virtual void UpdateData()
    {
        throw new Exception("Child Screen must implement this method");
    }
    public virtual void DeleteData()
    {
        throw new Exception("Child Screen must implement this method");
    }
    [Browsable(false)]
    [ReadOnly(true)]
    public virtual string ObjectIdForLogOperation
    {
        get
        {
            if(string.IsNullOrEmpty(objIdForLogOperation))
            {
                throw new Exception("Object Id is not set, child screen must set the object id for log operation");
            }
            return this.objIdForLogOperation;
        }
        set
        {
            this.objIdForLogOperation = value;
        }
    }

    public override void DeleteRecord()
    {
        try
        {
            this.dbFacade.BeginTrans();
            UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Delete, this.ObjectIdForLogOperation);
            this.DeleteData();
            this.dbFacade.CommitTrans();
        }
        catch (Exception ex)
        {
            this.dbFacade.RollbackTrans();
            throw ex;
        }
    }
    public override void Save()
    {
        try
        {
            this.dbFacade.BeginTrans();
            switch (this.CurrentUIMode)
            {
                case UIModes.Insert:
                case UIModes.New:
                     CreateData();
                     UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, ObjectIdForLogOperation);                     
                    break;
                case UIModes.Browse:
                case UIModes.Update:
                    UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Update, ObjectIdForLogOperation);
                    UpdateData();
                    break;
                case UIModes.Tabular:
                    UpdateData();
                    break;
            }
            UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
            this.dbFacade.CommitTrans();
        }
        catch (Exception ex)
        {
            this.dbFacade.RollbackTrans();
            throw ex;
        }
    }
}