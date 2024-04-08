using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;

public partial class webpage_forget : System.Web.UI.Page
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
        sm.email = mail.Text;
        sm.url = Request.Url.AbsoluteUri.Replace("forget", "reset");
        DataView dv = sd.GetUserGuid(sm);

        if (dv[0][0].ToString() == "1")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", "系統已寄送重設密碼連結給您。"), true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", "信箱無效，請洽系統管理員。"), true);
        }
    }
    #endregion

    #endregion
}