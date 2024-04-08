using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;

public partial class test : common
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region 104 Enterprise Portal

            hfcompno.Value = WebConfigurationManager.AppSettings["compNo"];
            hfempno.Value = empNo;

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                iframeEP.Src = string.Format("{0}?COMPSNO={1}&IDKEY={2}&OP=act&MLANG=0", WebConfigurationManager.AppSettings["104EP"], hfcompno.Value, dv[0]["KEYVALUE"].ToString());
                //ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", dv[0]["KEYVALUE"].ToString()), true);
            }

            #endregion
        }
    }
}