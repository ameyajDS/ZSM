using System;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.DBFacade;
using DCC.UMB.CDF.MGMT.Controller;
using System.ComponentModel;
using System.Collections;
public class ZSMAbstractScreen2 : AbstractScreen
{
    protected ZSM_MUMDbFacade dbFacade = null;
    private Hashtable parametersForLogOperation = null;
    protected override void InitializeDbFacade()
    {
        if (dbFacade == null) { this.dbFacade = new ZSM_MUMDbFacade(this.ApplicationId); }
    }
    public virtual void CreateData()
    {
        throw new Exception("Child Screen must implement this method");
    }
    public virtual void UpdateData()
    {
        throw new Exception("Child Screen must implement this method");
    }
    public virtual bool DeleteData()
    {
        throw new Exception("Child Screen must implement this method");
    }
    [Browsable(false)]
    [ReadOnly(true)]
    public virtual Hashtable ParametersForLogOperation
    {
        get
        {
            if (parametersForLogOperation == null || parametersForLogOperation.Count == 0)
            {
                throw new Exception("Object Id is not set, child screen must set the object id for log operation");
            }
            return this.parametersForLogOperation;
        }
        set
        {
            this.parametersForLogOperation = value;
        }
    }

    public override void DeleteRecord(ref bool removeRecordFromListViewGrid)
    {
        try
        {
            this.dbFacade.BeginTrans();
            if (this.DeleteData())
            {
                UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Delete, this.parametersForLogOperation);
            }
            else
            {
                removeRecordFromListViewGrid = false;
            }
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
                     UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, this.parametersForLogOperation);                     
                    break;
                case UIModes.Browse:
                case UIModes.Update:
                    UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Update, this.parametersForLogOperation);
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