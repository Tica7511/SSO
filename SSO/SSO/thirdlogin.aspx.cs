using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThirdLoginHelper;
using System.Web.Configuration;

public partial class thirdlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string appName = string.Format("{0}", WebConfigurationManager.AppSettings["appName"]);
            string webUrl = string.Format("{0}", WebConfigurationManager.AppSettings["uofURL"]);
            string targetUrl = string.Format("{0}/{1}", WebConfigurationManager.AppSettings["uofURL"], WebConfigurationManager.AppSettings["uofTarget"]);
            string account = "E945";
            string key = string.Format("{0}", WebConfigurationManager.AppSettings["uofKey"]);
            string iv = string.Format("{0}", WebConfigurationManager.AppSettings["uofIV"]);

            string url = ThirdLoginHelper.Encryption.GetUrl(appName, webUrl, targetUrl, account, key, iv);
            Response.Redirect(url);
          
        }
    }
}