using Ede.Uof.EIP.External.Utility;
using Ede.Uof.EIP.Organization.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThirdLoginHelper;
using System.Web.Configuration;


public partial class webpage_login : common
{
    private SSO_DAL sd = new SSO_DAL();
    private SSO_Model sm = new SSO_Model();

    private UOF_DAL ud = new UOF_DAL();

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
        string hashpwd = new UserUCO().HashPassword(RemoveHTMLTags(cleanQuote(loginacc.Text)), RemoveHTMLTags(loginpw.Text));
        string pwd = RemoveHTMLTags(loginpw.Text);

        sm.account = RemoveHTMLTags(cleanQuote(loginacc.Text));
        DataView dv = sd.CheckAuth(sm);

        if (dv != null && dv.Count > 0)
        {
            if ( (dv[0][6].ToString() == hashpwd) || (dv[0][6].ToString() == "" && dv[0][4].ToString() == pwd) )
            {
                string token = "";

                Session["SUNBA_SSO"] = "success";
                Session["登入工號"] = dv[0][0].ToString();
                Session["登入姓名"] = dv[0][1].ToString();
                Session["dept_code"] = dv[0][2].ToString();
                Session["dept_name"] = dv[0][3].ToString();
                Session["title_name"] = dv[0][5].ToString();
				Session["title_rank"] = dv[0][7].ToString() == "" ? "9" : dv[0][7].ToString();
                Session["Uid"] = Session["登入工號"].ToString();
                try
                {
                    token = ud.GetToken(dv[0][0].ToString(), RemoveHTMLTags(loginpw.Text));
                }
                catch (Exception ex)
                {

                }
                Session["UOF_TOKEN"] = token;

                Response.Redirect("enter.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", "密碼錯誤。"), true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", "帳號錯誤或不存在。"), true);
        }

    }
    #endregion

    #region DropDownList事件
    //protected void DropDownList1_DataBound(object sender, EventArgs e)
    //{
    //    ((DropDownList)sender).Items.Insert(0, new ListItem("請選擇", ""));
    //}

    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string appName = "UOFTEST";
    //    string webUrl = "https://powersunba.com.tw/UOFTEST";
    //    string targetUrl = "https://powersunba.com.tw/UOFTEST/Homepage.aspx";
    //    string account = ((DropDownList)sender).SelectedValue;
    //    string key = "123456";
    //    string iv = "abcde";

    //    string url = ThirdLoginHelper.Encryption.GetUrl(appName, webUrl, targetUrl, account, key, iv);
    //    Response.Redirect(url);
    //}
    #endregion

    #endregion
}