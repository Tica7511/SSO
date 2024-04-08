using Ede.Uof.EIP.External.Utility;
using Ede.Uof.EIP.Organization.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;

public partial class webpage_reset : common
{
    private SSO_DAL sd = new SSO_DAL();
    private SSO_Model sm = new SSO_Model();

    #region 系統事件

    #region 起始事件
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    #endregion

    #region 按鈕事件
    protected void Button1_Click(object sender, EventArgs e)
    {
        sm.guid = Request["guid"];
        sm.password = new UserUCO().HashPassword(Request["uid"], RemoveHTMLTags(loginpw.Text)); //密碼加密
        sd.ChangePassword(sm);

        ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("goto('{0}');", "密碼重設成功。"), true);
    }
    #endregion

    #endregion
}