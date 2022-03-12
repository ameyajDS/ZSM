using System;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.DBFacade;
using DCC.UMB.CDF.MGMT.Controller;
using System.ComponentModel;
using System.Windows.Forms;
public class ZSMAbstractScreen : AbstractScreen
{
    protected ZSM_MUMDbFacade dbFacade = null;
    private string objIdForLogOperation = default(string);
    protected override void InitializeDbFacade()
    {
        if (dbFacade == null) { this.dbFacade = new ZSM_MUMDbFacade(this.ApplicationId); }
    }
    public string  OnSaveMessge { get; set; }
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
    public virtual string ObjectIdForLogOperation
    {
        get
        {
            if (string.IsNullOrEmpty(objIdForLogOperation))
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

    [Browsable(false)]
    [ReadOnly(true)]
    public string InfoMessageToShow { get; set; }

    public override void DeleteRecord(ref bool removeRecordFromListViewGrid)
    {
        try
        {
            this.dbFacade.BeginTrans();
            UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Delete, this.ObjectIdForLogOperation);
            if (!this.DeleteData())
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
            InfoMessageToShow = null;
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
            if (OnSaveMessge == null)
            {
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, OnSaveMessge, MessageTypes.Plain);
            }
            this.dbFacade.CommitTrans();
            if (!string.IsNullOrEmpty(InfoMessageToShow))
            {
                DialogResult result = MessageBox.Show(this, this.InfoMessageToShow,
                          "Information",
                          MessageBoxButtons.OK, MessageBoxIcon.Exclamation,
                          MessageBoxDefaultButton.Button1);
            }
        }
        catch (Exception ex)
        {
            this.dbFacade.RollbackTrans();
            throw ex;
        }
    }
}