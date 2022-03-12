using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.UMB.TAF.View;

namespace DCC.ZOS.ZSM.TEST.RPT
{
    public class BadgePrinting : TAFAbstractScreen
    {
        public BadgePrinting(White.Core.Application application, string[] menuPath)
            : base(application, menuPath)
        {

        }

        public TAFTextField intBadgeExpiryYear { get { return this.GetTextField("intBadgeExpiryYear"); } }

        public TAFTextField intGents { get { return this.GetTextField("intGents"); } }

        public TAFTextField intLadies { get { return this.GetTextField("intLadies"); } }

        public TAFTextField chkFront { get { return this.GetTextField("chkFront"); } }

        public TAFTextField chkBack { get { return this.GetTextField("chkBack"); } }

        public TAFComboBox badgeTemplateCombo1 { get { return this.GetComboBox("badgeTemplateCombo1"); } }

        public TAFTextField sewadarListLookup1 { get { return this.GetTextField("sewadarListLookup1"); } }

        public TAFTextField txtDefaultRemarks { get { return this.GetTextField("txtDefaultRemarks"); } }        

        public TAFGrid grdSewadars { get { return this.GetGrid("grdSewadars"); } }
    }
}
