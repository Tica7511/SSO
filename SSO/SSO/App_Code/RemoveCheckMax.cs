using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// RemoveCheckMax 的摘要描述
/// </summary>
public class RemoveCheckMax
{
    public RemoveCheckMax()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string SQLInjectionReplaceAll(string inputString)
    {
        //20131217:Hugo(add), SQL Injection 使用規則運算式過濾特殊字元及部份關鍵字
        //參考的網址, http://renjin.blogspot.tw/2008/05/sql-injection-attacks-by-example.html
        return Regex.Replace(inputString, @"\b(exec(ute)?|select|update|insert|delete|drop|create)\b|(-{2})|(/\*.*\*/)", string.Empty, RegexOptions.IgnoreCase);
        //return Regex.Replace(inputString, @"\b(exec(ute)?|select|update|insert|delete|drop|create)\b|[;']|(-{2})|(/\*.*\*/)", string.Empty, RegexOptions.IgnoreCase);
    }

    public string RemovePathTraversal(string str)
    {
        string strOri = str;
        if (!string.IsNullOrEmpty(strOri))
        {
            strOri = strOri.Replace("../", "");
            //strOri = Regex.Replace(strOri, ".", "", RegexOptions.IgnoreCase);
            //strOri = Regex.Replace(strOri, "/", "", RegexOptions.IgnoreCase);
            //strOri = Regex.Replace(strOri, "'", "", RegexOptions.IgnoreCase);
            //strOri = Regex.Replace(strOri, @"\", "", RegexOptions.IgnoreCase);
        }
        return strOri;
    }

    public string RemoveXss(string str)
    {
        string strOri = str;
        if (!string.IsNullOrEmpty(strOri))
        {
            strOri = Regex.Replace(strOri, "script", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "alert", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "onmouseove", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "onload", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, @"\+last", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, @"\+not", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, @"\+and", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, @"\+or", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, @"\+position", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "%27", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "%28", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "%29", "", RegexOptions.IgnoreCase);
            //strOri = Regex.Replace(strOri, "%3D", "", RegexOptions.IgnoreCase);
            strOri = Regex.Replace(strOri, "%2C", "", RegexOptions.IgnoreCase);
            //防止盲目的SQL
            strOri = Regex.Replace(strOri, @"\b(exec(ute)?|select|update|insert|delete|drop|create)\b|[;']|(-{2})|(/\*.*\*/)", string.Empty, RegexOptions.IgnoreCase);
        }
        return strOri;
    }

    #region 取得用戶端IP
    /// <summary>
    /// 取得用戶端IP
    /// </summary>
    /// <returns></returns>
    public string GetClientIP(System.Web.HttpRequest request)
    {
        if (request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
        {
            return request.ServerVariables["REMOTE_HOST"].ToString();
        }
        else
        {
            return request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
    }

    public string GetIP()
    {
        string ip = string.Empty;
        string trueIP = string.Empty;

        //先取得是否有經過代理伺服器
        if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
            ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        else
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();

        if (!string.IsNullOrEmpty(ip))
        {
            //將取得的 IP 字串存入陣列
            string[] ipRange = ip.Split(',');

            //比對陣列中的每個 IP
            if (ip != "::1")
            {
                for (int i = 0; i < ipRange.Length; i++)
                {
                    //剔除內部 IP 及不合法的 IP 後，取出第一個合法 IP
                    if (ipRange[i].Trim().Substring(0, 3) != "10." &&
                        ipRange[i].Trim().Substring(0, 7) != "192.168" &&
                        ipRange[i].Trim().Substring(0, 7) != "172.16." &&
                        CheckIP(ipRange[i].Trim()))
                    {
                        trueIP = ipRange[i].Trim();
                        break;
                    }
                }
            }
            else
            {
                trueIP = "127.0.0.1";
            }

        }
        else
        {
            //沒經過代理伺服器，直接使用 ServerVariables["REMOTE_ADDR"]
            //並經過 CheckIP( ) 的驗證
            trueIP = CheckIP(HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]) ?
                HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] : "";
        }
        //trueIP = "fe80::3928:5e4c:2e54:dee5%13";
        return trueIP;
    }

    private bool CheckIP(string strPattern)
    {
        // 繼承自：System.Text.RegularExpressions
        // regular: ^\d{1,3}[\.]\d{1,3}[\.]\d{1,3}[\.]\d{1,3}$
        Regex regex = new Regex("^\\d{1,3}[\\.]\\d{1,3}[\\.]\\d{1,3}[\\.]\\d{1,3}$");
        Match m = regex.Match(strPattern);

        return m.Success;
    }
    #endregion
     
    /// <summary>
    /// ErrorLogMail 的摘要描述
    /// </summary>
    public class ErrorLogMail
    {
        private HttpRequest request;
        private HttpResponse response;
        private Exception ex;

        public string ConnStr { get; private set; }
        public HttpRequest Request { get; private set; }
        public HttpResponse Response { get; private set; }
        public Exception Excep { get; private set; }

        public ErrorLogMail(string connStr, HttpRequest request, HttpResponse response, Exception ex)
        {
            //
            // TODO: 在這裡新增建構函式邏輯
            //            
            ConnStr = connStr;
            Request = request;
            Response = response;
            Excep = ex;
        }
    }

    /// <summary>
    /// 異常通報
    /// </summary>
    /// <param name="errorLogMail">異常通報物件</param>
    public void ErrorExceptionDataToDB(ErrorLogMail errorLogMail)
    {
        using (SqlConnection sqlConn = new SqlConnection(errorLogMail.ConnStr))
        {
            try
            {
                //sqlConn.Open();

                //// --- 主機IP --- //
                ////string serverIP = SQLInjectionReplaceAll(GetClientIP(errorLogMail.Request));
                //string serverIP = SQLInjectionReplaceAll(GetIP());

                //SSOUtil.SSOLoginUser ssoUser = new SSOUtil.SSOLoginUser();
                //ssoUser.GetEmpInfo();

                //string empNo = SQLInjectionReplaceAll(ssoUser.empNo);

                //string empName = SQLInjectionReplaceAll(ssoUser.empName);

                //string mailBody = "發生時間：" + DateTime.Now + "<BR>" +
                //                  "主機IP：" + serverIP + "<BR>" +
                //                  "發生網頁：" + errorLogMail.Request.Url + "<BR>" +
                //                  "使用者：" + empName + "(" + empNo + ")" + "<BR>" +
                //                  "錯誤內容：" + errorLogMail.Excep.ToString() + "<BR>";

                //SqlCommand exceptionCmd = new SqlCommand();
                //exceptionCmd.Connection = sqlConn;

                //exceptionCmd.CommandText = "esp_except_mail";
                //exceptionCmd.CommandType = CommandType.StoredProcedure;

                //exceptionCmd.Parameters.Clear();
                //exceptionCmd.Parameters.AddWithValue("mailBody", SQLInjectionReplaceAll(mailBody));

                //exceptionCmd.ExecuteNonQuery();
            }
            catch
            {
                errorLogMail.Response.Redirect("No_Auth.aspx");
            }
            finally
            {
                sqlConn.Close();
            }
        }
    }

}