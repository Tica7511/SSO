using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;

public partial class webpage_enter : common
{
    #region 系統事件

    #region 起始事件
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SUNBA_SSO"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (Session["SUNBA_SSO"].ToString() != "success")
            {
                Response.Redirect("login.aspx");
            }

            hfcompno.Value = WebConfigurationManager.AppSettings["compNo"];
            hfempno.Value = empNo;
			
			Label1.Text = empName;

            #region 各系統使用權限
            DataView dvSys = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (dvSys != null && dvSys.Count > 0)
            {
                sys1.Visible = dvSys[0]["人資"].ToString() == "True" ? true : false;
                sys2.Visible = dvSys[0]["請採購"].ToString() == "True" ? true : false;

                sys4.Visible = false;
                sys5.Visible = dvSys[0]["固定資產"].ToString() == "True" ? true : false;
                sys6.Visible = dvSys[0]["庶務"].ToString() == "True" ? true : false;
                sys7.Visible = dvSys[0]["承攬商"].ToString() == "True" ? true : false;
                sys8.Visible = dvSys[0]["請修"].ToString() == "True" ? true : false;
                sys9.Visible = dvSys[0]["預防保養"].ToString() == "True" ? true : false;
                sys10.Visible = dvSys[0]["巡檢"].ToString() == "True" ? true : false;
                sys11.Visible = dvSys[0]["聯絡掛卡"].ToString() == "True" ? true : false;
                sys12.Visible = dvSys[0]["工作日誌"].ToString() == "True" ? true : false;
                sys13.Visible = dvSys[0]["營運效率"].ToString() == "True" ? true : false;
				sys14.Visible = dvSys[0]["權限設定"].ToString() == "True" ? true : false;
            }
            #endregion

        }
    }
    #endregion

    #region 按鈕事件

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string appName = string.Format("{0}", WebConfigurationManager.AppSettings["appName"]);
        string webUrl = string.Format("{0}", WebConfigurationManager.AppSettings["uofURL"]);
        string targetUrl = string.Format("{0}/{1}", WebConfigurationManager.AppSettings["uofURL"], WebConfigurationManager.AppSettings["uofTarget"]);
        string account = empNo;
        string key = string.Format("{0}", WebConfigurationManager.AppSettings["uofKey"]);
        string iv = string.Format("{0}", WebConfigurationManager.AppSettings["uofIV"]);

        string url = ThirdLoginHelper.Encryption.GetUrl(appName, webUrl, targetUrl, account, key, iv);
        Response.Redirect(url);
    }
	
    protected void lb104_Click(object sender, EventArgs e)
    {
        #region 104 Enterprise Portal

        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv != null && dv.Count > 0)
        {
			//string url = string.Format("{0}?COMPSNO={1}&IDKEY={2}&IDPWD={3}&OP=act&MLANG=0", WebConfigurationManager.AppSettings["104EP"], hfcompno.Value, empNo, dv[0]["KEYVALUE"].ToString());
            a1.HRef = string.Format("{0}?COMPSNO={1}&IDKEY={2}&IDPWD={3}&OP=act&MLANG=0", WebConfigurationManager.AppSettings["104EP"], hfcompno.Value, empNo, dv[0]["KEYVALUE"].ToString());
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("open104();"), true);
			//ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("opentest('"+url+"');"), true);
        }
        #endregion
    }
	
	
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("login.aspx");
    }

    #endregion

    #endregion
}