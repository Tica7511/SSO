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

public partial class changePassword : common
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
        sm.account = empNo;
        sm.password = loginpwo.Text; //原密碼
        sm.hashPassword = new UserUCO().HashPassword(empNo, loginpwo.Text); //Hash原密碼
        sm.hashPassword2 = new UserUCO().HashPassword(empNo, loginpw.Text); ; //新密碼
        DataView dv = sd.ChangePassword2(sm);

        if (dv[0][0].ToString() == "1")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("goto('{0}');", "密碼修改成功。"), true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", "原密碼錯誤。"), true);
        }
    }
    #endregion

    #endregion
}