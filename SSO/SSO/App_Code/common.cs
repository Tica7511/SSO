using System;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Net;
using System.IO;
using System.Web.Services.Description;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Reflection;
using System.Xml.Serialization;
using System.Threading;
using System.Collections;
using System.Web.UI;
using System.Text;
using System.Web.Configuration;
using System.Security.Cryptography;

/// <summary>
/// 公用函式
/// </summary>
public class common : System.Web.UI.Page
{
    #region 屬性設定

    /// <summary>
    /// 登入工號
    /// </summary>
    public string empNo
    {
        get
        {
            if (Session["登入工號"] == null)
            {
                return string.Empty;
            }

            return Session["登入工號"].ToString();
        }
    }
	
    /// <summary>
    /// 登入者
    /// </summary>
    public string empName
    {
        get
        {
            if (Session["登入姓名"] == null)
            {
                return string.Empty;
            }

            return Session["登入姓名"].ToString();
        }
    }

    #endregion

    //資料庫連線。
    public SqlConnection ConnString = new SqlConnection(WebConfigurationManager.AppSettings["ConnString"]);

    //無系統管理權限導向的頁面。
    private string errorPage = WebConfigurationManager.AppSettings["ErrorPage"];

    public common()
    {

    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
    }

    #region 系統發生錯誤處理
    /// <summary>
    /// 系統發生錯誤處理
    /// </summary>
    /// <param name=""></param>
    protected override void OnError(EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            //throw new Exception("系統發生錯誤，錯誤訊息：" + ex.Message);
        }
        finally
        {
            Response.Redirect(errorPage);
        }
    }
    #endregion

    #region 半形轉全形
    /// <summary>
    /// 半形轉全形
    /// </summary>
    /// <param name="word">字串</param>
    public string FilterSpecialChar(string word)
    {
        string p1 = "";
        p1 = word.Replace("|", "｜");
        p1 = p1.Replace("&", "＆");
        //p1 = p1.Replace(";", "；");
        p1 = p1.Replace("$", "＄");
        p1 = p1.Replace("%", "％");
        p1 = p1.Replace("@", "＠");
        p1 = p1.Replace("'", "’");
        p1 = p1.Replace("<", "＜");
        p1 = p1.Replace(">", "＞");
        p1 = p1.Replace("(", "（");
        p1 = p1.Replace(")", "）");
        p1 = p1.Replace("+", "＋");
        p1 = p1.Replace("#", "＃");
        p1 = p1.Replace(":", "：");
        p1 = p1.Replace("*", "＊");
        p1 = p1.Replace("?", "？");
        p1 = p1.Replace("\"", "”");
        p1 = p1.Replace("/", "／");
        p1 = p1.Replace("\\", "＼");
        p1 = p1.Replace("&lt", "＜");
        p1 = p1.Replace("&gt", "＞");
        p1 = p1.Replace("--", "－－");
        return p1.Trim();
    }
    #endregion

    #region 全形轉半形
    /// <summary>
    /// 全形轉半形
    /// </summary>
    /// <param name="strOri"></param>
    /// <returns></returns>
    public string DoRetrunSpecialChar(string strOri)
    {
        if (strOri.Length > 0)
        {
            strOri = strOri.Replace("︱", "|");
            strOri = strOri.Replace("＆", "&");
            //strOri = strOri.Replace(";", "；");
            strOri = strOri.Replace("＄", "$");
            strOri = strOri.Replace("％", "%");
            strOri = strOri.Replace("＠", "@");
            strOri = strOri.Replace("’", "'");
            strOri = strOri.Replace("＜", "<");
            strOri = strOri.Replace("（", "(");
            strOri = strOri.Replace("＂", "\"");
            strOri = strOri.Replace("＞", ">");
            strOri = strOri.Replace("）", ")");
            strOri = strOri.Replace("＋", "+");
            strOri = strOri.Replace("＃", "#");
            strOri = strOri.Replace("ＣＲ", " CR ");
            strOri = strOri.Replace("ＬＦ", " LF ");
            strOri = strOri.Replace("＼", "\\");
            strOri = strOri.Replace("＆lt", "&lt");
            strOri = strOri.Replace("＆gt", "&gt");
            strOri = strOri.Replace("－－", "--");//如果有連續兩個以上的"-"，則將所有的"-"變成全型"－"
        }

        return strOri;
    }
    #endregion

    #region 去除特殊字元
    /// <summary>
    /// 去除特殊字元
    /// </summary>
    /// <param name="word">字串</param>
    public string clean(string word)
    {
        string p1 = "";
        p1 = word.Replace("|", "");
        p1 = p1.Replace("&", "");
        p1 = p1.Replace(";", "");
        p1 = p1.Replace("$", "");
        p1 = p1.Replace("%", "");
        //p1 = p1.Replace("@", "");
        p1 = p1.Replace("'", "");
        p1 = p1.Replace("<", "");
        p1 = p1.Replace("(", "");
        p1 = p1.Replace("\"", "");
        p1 = p1.Replace(">", "");
        p1 = p1.Replace(")", "");
        p1 = p1.Replace("+", "");
        p1 = p1.Replace("#", "");
        p1 = p1.Replace("CR", "");
        p1 = p1.Replace("LF", "");
        p1 = p1.Replace("\\", "");
        p1 = p1.Replace("&lt", "");
        p1 = p1.Replace("&gt", "");
        p1 = p1.Replace("--", "");
        return p1;
    }
    #endregion

    #region 去除引號
    /// <summary>
    /// 去除引號
    /// </summary>
    /// <param name="word">字串</param>
    public string cleanQuote(string word)
    {
        string p1 = "";
        p1 = word.Replace("'", ""); //「'」單引號
        p1 = p1.Replace("\"", ""); //「"」雙引號

        return p1;
    }
    #endregion

    #region 轉換成YYYY/MM/DD格式
    /// <summary>
    /// 轉換成YYYY/MM/DD格式
    /// </summary>
    /// <param name="strInputDate">8碼日期字串</param>
    /// <returns></returns>
    public string DateToSlash(string strInputDate)
    {
        string str = string.Empty;
        strInputDate = strInputDate.Trim();
        if (strInputDate.Length != 8)
            strInputDate = "";

        if (strInputDate != "")
        {
            str = string.Format("{0}/{1}/{2}", strInputDate.Substring(0, 4), strInputDate.Substring(4, 2), strInputDate.Substring(6, 2));
        }

        return str;
    }
    #endregion

    #region 將過多的字轉成 Tip 格式
    /// <summary>
    /// 將過多的字轉成 Tip 格式(ex.只要顯示七個字...，滑鼠移到...時會出現Tip顯示所有內容)
    /// 1.請先確定頁面有引用 <script type="text/javascript" src="../js/jQueryTips.js"></script>
    /// 2.請先確定頁面有套用 <link href="../css/jQueryTips.css" rel="Stylesheet" type="text/css" />
    /// </summary>
    /// <param name="strOri">內容字串</param>
    /// <param name="iMax">欲顯示幾個字後用...代替</param>
    /// <returns></returns>
    public string TransMore(string strOri, int iMax)
    {
        string strResutl = string.Empty;
        StringBuilder sb = new StringBuilder();

        if (iMax <= 3)
            return strOri;

        if (strOri.Length > iMax)
        {
            sb.Append(strOri.Substring(0, iMax - 3));
            sb.Append(string.Format("<a href='#' class='ShowTips' title='{0}'>...</a>", strOri.Replace("\r\n", "<br>")));

        }
        else
            sb.Append(strOri);

        return sb.ToString();
    }
    #endregion

    #region 取WebConfig變數
    public string GetConfigString(string strConfig)
    {
        return System.Web.Configuration.WebConfigurationManager.AppSettings[strConfig];
    }
    #endregion

    #region 取得用戶端IP
    /// <summary>
    /// 取得用戶端IP
    /// </summary>
    /// <returns></returns>
    public string GetClientIP()
    {
        if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
        {
            return Request.ServerVariables["REMOTE_HOST"].ToString();
        }
        else
        {
            return Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
    }
    #endregion

    #region 檢查e-mail格式
    /// <summary>
    /// 檢查e-mail格式
    /// </summary>
    /// <param name="strIn">信箱地址</param>
    /// <returns>bool</returns>
    /// <remarks></remarks>
    public bool IsValidEmail(string strIn)
    {
        // Return true if strIn is in valid e-mail format.只能輸入這些字元
        return Regex.IsMatch(strIn, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
    }
    #endregion

    #region 檢查有效日期
    /// <summary>
    /// 檢查有效日期(錯誤時回傳訊息；否則，回傳空值。)
    /// </summary>
    /// <param name="inputDate">日期</param>
    /// <returns>錯誤時回傳訊息；否則，回傳空值。</returns>
    public string IsDateFormat(string inputDate)
    {
        try
        {
            string msg = "";
            if (inputDate != "")
            {
                if (inputDate.Length < 8 || inputDate.Length > 10)
                {
                    msg = "請輸入yyyy/MM/dd或yyyyMMdd的日期格式!";
                }
                else
                {
                    try
                    {
                        string[] DateTimeList = { "yyyy/M/d tt hh:mm:ss",
                                              "yyyy/MM/dd tt hh:mm:ss",
                                              "yyyy/MM/dd tt hh:mm:ss",
                                              "yyyy/MM/dd HH:mm:ss",
                                              "yyyy/MM/dd",
                                              "yyyyMMdd"
                                            };
                        DateTime dt = DateTime.ParseExact(inputDate, DateTimeList, CultureInfo.InvariantCulture, DateTimeStyles.AllowWhiteSpaces);
                    }
                    catch
                    {
                        msg = "請輸入有效日期!";
                    }
                }
            }

            return msg;

        }
        catch (Exception ex)
        {
            throw new Exception("檢查日期(common.IsDateFormat)發生錯誤，錯誤訊息：" + ex.Message);
        }
    }
    #endregion

    #region 檢查起迄有效日期
    /// <summary>
    /// 檢查起迄有效日期(錯誤時回傳訊息；否則，回傳空值。)
    /// </summary>
    /// <param name="inputSDate">開始日期</param>
    /// /// <param name="inputEDate">結束日期</param>
    /// <returns>錯誤時回傳訊息；否則，回傳空值。</returns>
    public string IsDateFormat(string inputSDate, string inputEDate)
    {
        try
        {
            string msg = "";
            DateTime sdt = new DateTime();
            DateTime edt = new DateTime();
            if (inputSDate != "")
            {
                if (inputSDate.Length < 8 || inputSDate.Length > 10)
                {
                    msg = "開始日期，請輸入yyyy/MM/dd或yyyyMMdd的日期格式!\n";
                }
                else
                {
                    try
                    {
                        string[] DateTimeList = { "yyyy/M/d tt hh:mm:ss",
                                              "yyyy/MM/dd tt hh:mm:ss",
                                              "yyyy/MM/dd tt hh:mm:ss",
                                              "yyyy/MM/dd HH:mm:ss",
                                              "yyyy/MM/dd",
                                              "yyyyMMdd"
                                            };
                        sdt = DateTime.ParseExact(inputSDate, DateTimeList, CultureInfo.InvariantCulture, DateTimeStyles.AllowWhiteSpaces);
                    }
                    catch
                    {
                        msg = "開始日期，請輸入有效日期!\n";
                    }
                }
            }

            if (inputEDate != "")
            {
                if (inputEDate.Length < 8 || inputEDate.Length > 10)
                {
                    msg += "結束日期，請輸入yyyy/MM/dd或yyyyMMdd的日期格式!";
                }
                else
                {
                    try
                    {
                        string[] DateTimeList = { "yyyy/M/d tt hh:mm:ss",
                                              "yyyy/MM/dd tt hh:mm:ss",
                                              "yyyy/MM/dd tt hh:mm:ss",
                                              "yyyy/MM/dd HH:mm:ss",
                                              "yyyy/MM/dd",
                                              "yyyyMMdd"
                                            };
                        edt = DateTime.ParseExact(inputEDate, DateTimeList, CultureInfo.InvariantCulture, DateTimeStyles.AllowWhiteSpaces);
                    }
                    catch
                    {
                        msg += "結束日期，請輸入有效日期!";
                    }
                }
            }

            if (inputSDate != "" && inputEDate != "" && msg == "")
            {
                if (edt > sdt)
                {
                    msg = "開始時間不可大於或等於結束時間!";
                }
            }

            return msg;

        }
        catch (Exception ex)
        {
            throw new Exception("檢查起迄有效日期(common.IsDateFormat)發生錯誤，錯誤訊息：" + ex.Message);
        }
    }
    #endregion

    #region 檢查起迄有效日期時間
    /// <summary>
    /// 檢查起迄有效日期時間(錯誤時回傳訊息；否則，回傳空值。)
    /// </summary>
    /// <param name="inputSDateTime">開始日期時間</param>
    /// /// <param name="inputEDateTime">結束日期時間</param>
    /// <returns>錯誤時回傳訊息；否則，回傳空值。</returns>
    public string IsDateFormat(DateTime inputSDateTime, DateTime inputEDateTime)
    {
        try
        {
            string msg = "";
            if (inputEDateTime > inputSDateTime)
            {
                msg = "開始時間不可大於或等於結束時間!";
            }

            return msg;
        }
        catch (Exception ex)
        {
            throw new Exception("檢查起迄有效日期時間(common.IsDateFormat)發生錯誤，錯誤訊息：" + ex.Message);
        }
    }
    #endregion

    #region 檢查是否為數值
    /// <summary>
    /// 檢查是否為數值
    /// </summary>
    /// <param name="str_Integer">字串</param>
    public bool IsInteger(string str_Integer)
    {
        if (str_Integer.Length == 0)
        {
            return false;
        }
        else
        {
            //return Regex.IsMatch(str_Integer, @"^\d+$");
            return Regex.IsMatch(str_Integer, @"^[-]?\d+\d*$");
        }
    }
    #endregion

    #region 檢查是否為浮點數
    /// <summary>
    /// 檢查是否為浮點數
    /// </summary>
    /// <param name="str_Integer">字串</param>
    public bool IsDecimal(string str_IsDecimal)
    {


        bool flag;
        if (str_IsDecimal.Length == 0)
        {
            flag = false;
        }
        else
        {
            flag = Regex.IsMatch(str_IsDecimal, @"^([-+]?[0-9]*\.?[0-9]+)$");
        }
        return flag;
    }
    #endregion

    #region 檢查有效身份證字號
    /// <summary>
    /// 檢查有效身份證字號
    /// </summary>
    /// <param name="strIn"></param>
    /// <returns></returns>
    public bool IsIdNumber(string strIn)
    {
        return Regex.IsMatch(strIn, @"([A-Z]|[a-z])\d{9}");
    }
    #endregion

    #region 檢查是否為科學符號
    /// <summary>
    /// 檢查是否為科學符號
    /// </summary>
    /// <param name="str_IsScientific"></param>
    /// <returns></returns>
    public bool IsScientific(string str_IsScientific)
    {
        if (str_IsScientific.Length == 0)
        {
            return false;
        }
        else
        {
            string left = str_IsScientific.Substring(0, str_IsScientific.IndexOf("E"));
            string right = "";
            if (str_IsScientific.IndexOf("-") != -1)
            {
                right = str_IsScientific.Substring(str_IsScientific.IndexOf("-") + 1, str_IsScientific.Length - str_IsScientific.IndexOf("-") - 1);

                if (!IsDecimal(left) || !IsInteger(right) || str_IsScientific.IndexOf("E") == -1 || str_IsScientific.IndexOf("-") == -1)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                right = str_IsScientific.Substring(str_IsScientific.IndexOf("+") + 1, str_IsScientific.Length - str_IsScientific.IndexOf("+") - 1);

                if (!IsDecimal(left) || !IsInteger(right) || str_IsScientific.IndexOf("E") == -1 || str_IsScientific.IndexOf("+") == -1)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }


        }
    }
    #endregion

    #region 檢查GUID格式是否為正確
    /// <summary>
    /// 檢查GUID格式是否為正確
    /// </summary>
    /// <param name="cal_id"></param>
    /// <returns></returns>
    public bool Check_calendarID(string cal_id)
    {
        Match match = null;
        Regex regx = new Regex(@"^\w{8}\-\w{4}\-\w{4}\-\w{4}\-\w{12}$");
        match = regx.Match(cal_id.Trim());
        if (match.Success)
            return true;
        else
            return false;

    }
    #endregion

    #region 移除HTML Tags
    /// <summary>
    /// 移除HTML Tags
    /// </summary>
    /// <param name="HtmlSource"></param>
    /// <returns></returns>
    public static string RemoveHTMLTags(string HtmlSource)
    {
        string PureText = System.Text.RegularExpressions.Regex.Replace(Regex.Replace(HtmlSource.ToString(), "(?is)<.+?>", "").ToString(), "(?is)&.+?;", "").ToString();
        return PureText;
    }
    #endregion

    #region 檢查是否有特殊符號
    /// <summary>
    /// 檢查是否有特殊符號
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool IsContainSymbol(string str)
    {
        return Regex.IsMatch(str, @"([\#\$\%\^\&\*\+\;\?\|\']|--)");
    }
    #endregion

    #region 資料加密解密
    /// <summary>
    /// 資料加密解密
    /// </summary>
    public class Security
    {
        string _QueryStringKey = "abcdefgh"; //URL傳輸參數加密Key 
        string _PassWordKey = "hgfedcba"; //PassWord加密Key 

        public Security()
        {
            // 
            // TODO: 在此處添加構造函數邏輯 
            // 
        }

        /// <summary>
        /// 加密URL傳輸的字符串
        /// </summary>
        /// <param name="QueryString"></param>
        /// <returns></returns>
        public string EncryptQueryString(string QueryString)
        {
            return Encrypt(QueryString, _QueryStringKey);
        }

        /// <summary>
        /// 解密URL傳輸的字符串
        /// </summary>
        /// <param name="QueryString"></param>
        /// <returns></returns>
        public string DecryptQueryString(string QueryString)
        {
            return Decrypt(QueryString, _QueryStringKey);
        }

        /// <summary>
        /// 加密帳號口令 
        /// </summary>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public string EncryptPassWord(string PassWord)
        {
            return Encrypt(PassWord, _PassWordKey);
        }

        /// <summary>
        /// 解密帳號口令 
        /// </summary>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public string DecryptPassWord(string PassWord)
        {
            return Decrypt(PassWord, _PassWordKey);
        }

        /// <summary>
        /// DEC 加密過程 
        /// </summary>
        /// <param name="pToEncrypt"></param>
        /// <param name="sKey"></param>
        /// <returns></returns>
        public string Encrypt(string pToEncrypt, string sKey)
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider(); //把字符串放到byte數組中 

            byte[] inputByteArray = Encoding.Default.GetBytes(pToEncrypt);
            //byte[] inputByteArray=Encoding.Unicode.GetBytes(pToEncrypt); 

            des.Key = ASCIIEncoding.ASCII.GetBytes(sKey); //建立加密對象的密鑰和偏移量 
            des.IV = ASCIIEncoding.ASCII.GetBytes(sKey); //原文使用ASCIIEncoding.ASCII方法的GetBytes方法 
            MemoryStream ms = new MemoryStream(); //使得輸入密碼必須輸入英文文本 
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(), CryptoStreamMode.Write);

            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            StringBuilder ret = new StringBuilder();
            foreach (byte b in ms.ToArray())
            {
                ret.AppendFormat("{0:X2}", b);
            }
            ret.ToString();
            return ret.ToString();
        }

        /// <summary>
        /// DEC 解密過程
        /// </summary>
        /// <param name="pToDecrypt"></param>
        /// <param name="sKey"></param>
        /// <returns></returns>
        public string Decrypt(string pToDecrypt, string sKey)
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();

            byte[] inputByteArray = new byte[pToDecrypt.Length / 2];
            for (int x = 0; x < pToDecrypt.Length / 2; x++)
            {
                int i = (Convert.ToInt32(pToDecrypt.Substring(x * 2, 2), 16));
                inputByteArray[x] = (byte)i;
            }

            des.Key = ASCIIEncoding.ASCII.GetBytes(sKey); //建立加密對象的密鑰和偏移量，此值重要，不能修改 
            des.IV = ASCIIEncoding.ASCII.GetBytes(sKey);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write);

            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            StringBuilder ret = new StringBuilder(); //建立StringBuild對象，CreateDecrypt使用的是流對象，必須把解密後的文本變成流對像 

            return System.Text.Encoding.Default.GetString(ms.ToArray());
        }

        /// <summary>
        /// 檢查己加密的字符串是否與原文相同
        /// </summary>
        /// <param name="EnString"></param>
        /// <param name="FoString"></param>
        /// <param name="Mode"></param>
        /// <returns></returns>
        public bool ValidateString(string EnString, string FoString, int Mode)
        {
            switch (Mode)
            {
                default:
                case 1:
                    if (Decrypt(EnString, _QueryStringKey) == FoString.ToString())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                case 2:
                    if (Decrypt(EnString, _PassWordKey) == FoString.ToString())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
            }
        }
    }
    #endregion

    #region 彈出訊息
    /// <summary>
    /// 彈出訊息(如果使用UpdatePanel時，須將button加入PostBackTrigger才有效)
    /// </summary>
    /// <param name="strIn">要顯示的訊息</param>
    public void alertMessage(UpdatePanel updatePanel, string strIn)
    {
        string script = "<script language='javascript'>window.alert('" + strIn + "');</script>";
        ScriptManager.RegisterClientScriptBlock(updatePanel, this.GetType(), "ErrorMessage1", script, false);
    }

    /// <summary>
    /// 彈出訊息
    /// </summary>
    /// <param name="strIn">要顯示的訊息</param>
    public void alertMessage(string strIn)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage2", "<script>alert('" + strIn + "')</script>");
    }
    #endregion

    #region 執行資料庫的方法(由Data.cs整入)(含特殊字元處理：半形轉全形處理)
    #region 轉換成Int32
    /// <summary>
    /// 轉換成Int32
    /// </summary>
    /// <param name="str_Integer">要轉換的數字字串</param>
    private static Int32 ToInt32(string str_Integer)
    {
        return Convert.ToInt32(str_Integer);
    }
    #endregion

    #region 宣告參數型態
    /// <summary>
    /// 宣告變數型態
    /// </summary>
    /// <param name="sqlPara">SqlParameter</param>
    /// <param name="dr">DataRow</param>
    private static void setPara(SqlParameter sqlPara, DataRow dr)
    {
        string strLocation = "Data::SetPara";
        sqlPara.ParameterName = dr["COLUMN_NAME"].ToString();
        switch (dr["TYPE_NAME"].ToString())
        {
            case "bigint":
                sqlPara.SqlDbType = SqlDbType.BigInt;
                break;
            case "binary":
                sqlPara.SqlDbType = SqlDbType.Binary;
                break;
            case "char":
                sqlPara.SqlDbType = SqlDbType.Char;
                sqlPara.Size = ToInt32(dr["LENGTH"].ToString());
                break;
            case "datetime":
                sqlPara.SqlDbType = SqlDbType.DateTime;
                break;
            case "decimal":
                sqlPara.SqlDbType = SqlDbType.Decimal;
                break;
            case "float":
                sqlPara.SqlDbType = SqlDbType.Float;
                break;
            case "int":
                sqlPara.SqlDbType = SqlDbType.Int;
                break;
            case "nchar":
                sqlPara.SqlDbType = SqlDbType.NChar;
                sqlPara.Size = ToInt32(dr["LENGTH"].ToString());
                break;
            case "ntext":
                sqlPara.SqlDbType = SqlDbType.NText;
                break;
            case "nvarchar":
                sqlPara.SqlDbType = SqlDbType.NVarChar;
                sqlPara.Size = ToInt32(dr["LENGTH"].ToString());
                break;
            case "smallint":
                sqlPara.SqlDbType = SqlDbType.SmallInt;
                break;
            case "text":
                sqlPara.SqlDbType = SqlDbType.Text;
                break;
            case "tinyint":
                sqlPara.SqlDbType = SqlDbType.TinyInt;
                break;
            case "varbinary":
                sqlPara.SqlDbType = SqlDbType.VarBinary;
                break;
            case "varchar":
                sqlPara.SqlDbType = SqlDbType.VarChar;
                sqlPara.Size = ToInt32(dr["LENGTH"].ToString());
                break;
            default:
                Exception exErr = new Exception("系統未設定此型別 " + dr["info_name"] + ", 請通知系統人員");
                exErr.Source = strLocation;
                throw exErr;
        }

        if (ToInt32(dr["COLUMN_TYPE"].ToString()) == 2)
            sqlPara.Direction = ParameterDirection.Output;
    }
    #endregion

    #region 利用此函式來執行SQL statement, 並回傳單一值
    /// <summary>
    /// 利用此函式來執行SQL statement, 並回傳單一值		 
    /// </summary>
    /// <param name="sqlCmd">SqlCommand</param>
    /// <returns>return object</returns>
    public Object runScalar(SqlCommand sqlCmd)
    {
        //取代可能的攻擊字眼
        //ReplaceMaliciousParametersSqlCommand(ref sqlCmd);

        string strLocation = "Data::RunScalar";
        Object obj = null;
        sqlCmd.Connection = ConnString;

        try
        {
            ConnString.Open();
            obj = sqlCmd.ExecuteScalar();
        }
        catch (Exception err)
        {
            err.Source = strLocation;
            throw err;
        }
        finally
        {
            ConnString.Close();
        }

        return obj;
    }
    #endregion

    #region 利用此函式來執行stored procedure, 並回傳單一值
    /// <summary>
    /// 利用此函式來執行stored procedure, 並回傳單一值		 
    /// </summary>		
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <returns>return object</returns>
    public object runScalar(string pSPName)
    {
        string strLocation = "Data::RunScalar()";
        object objResult = null;
        SqlCommand cmd = new SqlCommand();
        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;
        // execute SQL 

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        try
        {
            ConnString.Open();
            objResult = cmd.ExecuteScalar();
        }
        catch (Exception err)
        {
            err.Source = strLocation;
            throw err;
        }
        finally
        {
            ConnString.Close();
        }

        return objResult;
    }
    #endregion

    #region 利用此函式來執行stored procedure, 並回傳單一值
    /// <summary>
    /// 利用此函式來執行stored procedure, 並回傳單一值		 
    /// </summary>		
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">參數</param>
    /// <returns>return object</returns>
    public object runScalar(string pSPName, Object[] pParas)
    {
        string strLocation = "Data::RunScalar()";
        object objResult = null;

        SqlCommand cmd = new SqlCommand();
        SqlParameter[] paras;

        //設定Parameters
        paras = getParameters(pSPName, pParas);

        if (paras.Length != pParas.Length)
            throw new Exception("參數個數不一致!!");

        // Add Parameter into SqlCommand.SqlParameter
        for (int i = 0; i < paras.Length; i++)
        {
            cmd.Parameters.Add(paras[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        try
        {
            ConnString.Open();
            objResult = cmd.ExecuteScalar();
        }
        catch (Exception err)
        {
            err.Source = strLocation;
            throw err;
        }
        finally
        {
            ConnString.Close();
        }

        // Release Resource 
        if (paras != null)
            cmd.Parameters.Clear();

        ConnString.Close();

        return objResult;
    }
    #endregion

    #region 利用此函式來執行SQL statement,回傳DataView
    /// <summary>
    /// 利用此函式來執行SQL statement		 
    /// </summary>
    /// <param name="sqlCmd">SQL statement</param>
    /// <returns>return DataView</returns>
    public DataView runParaCmd(SqlCommand sqlCmd)
    {
        sqlCmd.Connection = ConnString;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref sqlCmd);

        System.Data.SqlClient.SqlDataAdapter cmdSQL = new System.Data.SqlClient.SqlDataAdapter(sqlCmd);
        System.Data.DataSet ds = new System.Data.DataSet();
        cmdSQL.SelectCommand.CommandTimeout = 0;
        cmdSQL.Fill(ds, "myTable");

        ConnString.Close();
        cmdSQL.Dispose();
        return ds.Tables["myTable"].DefaultView;
    }
    #endregion

    #region 利用此函式來執行stored procedure,回傳DataView
    /// <summary>
    /// 利用此函式來執行stored procedure		 
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">參數</param>
    /// <returns>return DataView</returns>
    public DataView runSp(string pSPName, SqlParameter[] pParas)
    {
        SqlCommand cmd = new SqlCommand();

        // Add Parameter into SqlCommand.SqlParameter
        for (int i = 0; i < pParas.Length; i++)
        {
            cmd.Parameters.Add(pParas[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL and return a dataview
        SqlDataAdapter cmdSQL = new SqlDataAdapter(cmd);
        DataSet myds = new DataSet();
        cmdSQL.Fill(myds, "myTable");

        // Release Resource 
        if (pParas != null)
            cmd.Parameters.Clear();

        ConnString.Close();
        cmdSQL.Dispose();
        return myds.Tables["myTable"].DefaultView;
    }
    #endregion

    #region 利用此函式來執行stored procedure,回傳DataView
    /// <summary>
    /// 利用此函式來執行stored procedure		 
    /// </summary>		
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">參數</param>
    /// <returns>return DataView</returns>
    public DataView runSp(string pSPName, Object[] pParas)
    {
        string strLocation = "Data::RunSp";
        SqlCommand cmd = new SqlCommand();
        SqlParameter[] paras;

        //to get Parameters
        paras = getParameters(pSPName, pParas);

        //若參數個數不一致, 則丟出Exception
        if (paras.Length != pParas.Length)
        {
            Exception exErr = new Exception("參數個數不一致!!");
            exErr.Source = strLocation;
            throw exErr;
        }

        // Add Parameter into SqlCommand.SqlParameter		
        for (int i = 0; i < paras.Length; i++)
        {
            cmd.Parameters.Add(paras[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL and return a dataview
        SqlDataAdapter cmdSQL = new SqlDataAdapter(cmd);
        DataSet myds = new DataSet();
        cmdSQL.Fill(myds, "myTable");

        // Release Resource 
        if (paras != null)
            cmd.Parameters.Clear();

        ConnString.Close();
        cmdSQL.Dispose();
        return myds.Tables["myTable"].DefaultView;
    }
    #endregion

    #region 利用此函式來執行stored procedure,回傳DataView
    /// <summary>
    /// 利用此函式來執行stored procedure		 
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <returns>return DataView</returns>
    public DataView runSp(string pSPName)
    {
        SqlCommand cmd = new SqlCommand();

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL and return a dataview
        SqlDataAdapter cmdSQL = new SqlDataAdapter(cmd);
        DataSet myds = new DataSet();
        cmdSQL.Fill(myds, "myTable");

        ConnString.Close();
        cmdSQL.Dispose();
        return myds.Tables["myTable"].DefaultView;
    }
    #endregion

    #region 利用此函式來執行SQL statement,回傳DataSet
    /// <summary>
    /// 利用此函式來執行SQL statement,回傳DataSet	 
    /// </summary>
    /// <param name="sqlCmd">SQL statement</param>
    /// <returns>return DataSet</returns>
    public DataSet runParaCmdDS(SqlCommand sqlCmd)
    {
        sqlCmd.Connection = ConnString;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref sqlCmd);

        SqlDataAdapter cmdSQL = new SqlDataAdapter(sqlCmd);
        DataSet ds = new DataSet();
        cmdSQL.Fill(ds, "myTable");

        ConnString.Close();
        cmdSQL.Dispose();
        return ds;
    }
    #endregion

    #region 利用此函式來執行stored procedure,回傳DataSet
    /// <summary>
    /// 利用此函式來執行stored procedure,回傳DataSet		 
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">參數</param>
    /// <returns>return DataSet</returns>
    public DataSet runSpDS(string pSPName, SqlParameter[] pParas)
    {
        SqlCommand cmd = new SqlCommand();

        // Add Parameter into SqlCommand.SqlParameter
        for (int i = 0; i < pParas.Length; i++)
        {
            cmd.Parameters.Add(pParas[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL and return a dataview
        SqlDataAdapter cmdSQL = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmdSQL.Fill(ds, "myTable");

        // Release Resource 
        if (pParas != null)
            cmd.Parameters.Clear();

        ConnString.Close();
        cmdSQL.Dispose();
        return ds;
    }
    #endregion

    #region 利用此函式來執行stored procedure,回傳DataSet
    /// <summary>
    /// 利用此函式來執行stored procedure,回傳DataSet		 
    /// </summary>		
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">參數</param>
    /// <returns>return DataSet</returns>
    public DataSet runSpDS(string pSPName, Object[] pParas)
    {
        string strLocation = "Data::RunSp";
        SqlCommand cmd = new SqlCommand();
        SqlParameter[] paras;

        //to get Parameters
        paras = getParameters(pSPName, pParas);

        //若參數個數不一致, 則丟出Exception
        if (paras.Length != pParas.Length)
        {
            Exception exErr = new Exception("參數個數不一致!!");
            exErr.Source = strLocation;
            throw exErr;
        }

        // Add Parameter into SqlCommand.SqlParameter		
        for (int i = 0; i < paras.Length; i++)
        {
            cmd.Parameters.Add(paras[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL and return a dataview
        SqlDataAdapter cmdSQL = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmdSQL.Fill(ds, "myTable");

        // Release Resource 
        if (paras != null)
            cmd.Parameters.Clear();

        ConnString.Close();
        cmdSQL.Dispose();
        return ds;
    }
    #endregion

    #region 利用此函式來執行stored procedure,回傳DataSet
    /// <summary>
    /// 利用此函式來執行stored procedure,回傳DataSet		 
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <returns>return DataSet</returns>
    public DataSet runSpDS(string pSPName)
    {
        SqlCommand cmd = new SqlCommand();

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL and return a dataview
        SqlDataAdapter cmdSQL = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmdSQL.Fill(ds, "myTable");

        ConnString.Close();
        cmdSQL.Dispose();
        return ds;
    }
    #endregion

    #region 利用此函式來執行SQL statement(無傳回值)
    /// <summary>
    /// 利用此函式來執行SQL statement(無傳回值)		 
    /// </summary>
    /// <param name="sqlCmd">SQL statement</param>
    public void runParaCmd1(SqlCommand sqlCmd)
    {
        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref sqlCmd);

        sqlCmd.Connection = ConnString;
        ConnString.Open();
        sqlCmd.ExecuteNonQuery();
        ConnString.Close();
    }

    #endregion

    #region 利用此函式來執行stored procedure(無傳回值)
    /// <summary>
    /// 利用此函式來執行stored procedure(無回傳值)		 
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pPara">參數</param>
    public void runSp1(string pSPName, SqlParameter[] pParas)
    {
        SqlCommand cmd = new SqlCommand();

        // Add Parameter into SqlCommand.SqlParameter
        for (int i = 0; i < pParas.Length; i++)
        {
            cmd.Parameters.Add(pParas[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL 
        ConnString.Open();

        cmd.ExecuteNonQuery();

        ConnString.Close();

        // Release Resource 
        if (pParas != null)
            cmd.Parameters.Clear();
    }
    #endregion

    #region 利用此函式來執行stored procedure(無回傳值)
    /// <summary>
    /// 利用此函式來執行stored procedure(無回傳值)
    /// </summary>		
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">Object[]參數</param>
    public void runSp1(string pSPName, Object[] pParas)
    {
        string strLocation = "Data::RunSp1";
        SqlCommand cmd = new SqlCommand();
        SqlParameter[] paras;

        //設定Parameters
        paras = getParameters(pSPName, pParas);

        if (paras.Length != pParas.Length)
        {
            Exception exErr = new Exception("參數個數不一致!!");
            exErr.Source = strLocation;
            throw exErr;
        }

        // Add Parameter into SqlCommand.SqlParameter
        for (int i = 0; i < paras.Length; i++)
        {
            cmd.Parameters.Add(paras[i]);
        }

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL 
        ConnString.Open();

        cmd.ExecuteNonQuery();

        ConnString.Close();

        // Release Resource 
        if (paras != null)
            cmd.Parameters.Clear();
    }
    #endregion

    #region 利用此函式來執行stored procedure(無回傳值)
    /// <summary>
    /// 利用此函式來執行stored procedure(無回傳值)
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    public void runSp1(string pSPName)
    {
        SqlCommand cmd = new SqlCommand();

        // set properties of SqlCommand
        cmd.Connection = ConnString;
        cmd.CommandText = pSPName;
        cmd.CommandType = CommandType.StoredProcedure;

        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);

        // execute SQL 
        ConnString.Open();

        cmd.ExecuteNonQuery();

        ConnString.Close();
    }
    #endregion

    #region 利用此函式來取得Stored Procedured的參數
    /// <summary>
    /// 利用此函式來取得Stored Procedured的參數
    /// </summary>
    /// <param name="pSPName">Stored Procedure名稱</param>
    /// <param name="pParas">Parameter Values</param>
    /// <returns>return SqlParameter[]</returns>	
    public SqlParameter[] getParameters(string pSPName, object[] pParas)
    {
        string strLocation = "Data::GetParameters";
        SqlParameter[] Paras = new SqlParameter[pParas.Length];
        DataView dvMain;

        SqlParameter[] myParas = new SqlParameter[1];
        myParas[0] = new SqlParameter("@procedure_name", SqlDbType.NVarChar, 128);
        myParas[0].Value = pSPName;

        dvMain = runSp("sp_sproc_columns", myParas);

        //判斷parameters的參數個數是否正確
        if ((dvMain.Count - 1) != pParas.Length)
        {
            Exception exErr = new Exception("參數個數不一致!!");
            exErr.Source = strLocation;
            throw exErr;
        }

        for (int i = 0; i < pParas.Length; i++)
        {
            Paras[i] = new SqlParameter();
            setPara(Paras[i], dvMain.Table.Rows[i + 1]);
            Paras[i].Value = pParas[i];
        }

        //Release Resource
        dvMain = null;
        myParas = null;

        return Paras;
    }

    #endregion
    #endregion

    #region 執行資料庫的方法(由SQLHelper.cs整入)(含特殊字元處理：半形轉全形處理)
    #region private utility methods & constructors
    // Since this class provides only static methods, make the default constructor private to prevent 
    // instances from being created with "new SqlHelper()"
    //	private SqlHelper() {}

    /// <summary>
    /// This method is used to attach array of SqlParameters to a SqlCommand.
    /// 
    /// This method will assign a value of DbNull to any parameter with a direction of
    /// InputOutput and a value of null.  
    /// 
    /// This behavior will prevent default values from being used, but
    /// this will be the less common case than an intended pure output parameter (derived as InputOutput)
    /// where the user provided no input value.
    /// </summary>
    /// <param name="command">The command to which the parameters will be added</param>
    /// <param name="commandParameters">An array of SqlParameters to be added to command</param>
    private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
    {
        if (command == null) throw new ArgumentNullException("command");
        if (commandParameters != null)
        {
            foreach (SqlParameter p in commandParameters)
            {
                if (p != null)
                {
                    // Check for derived output value with no value assigned
                    if ((p.Direction == ParameterDirection.InputOutput ||
                        p.Direction == ParameterDirection.Input) &&
                        (p.Value == null))
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                }
            }
        }
    }

    /// <summary>
    /// This method assigns dataRow column values to an array of SqlParameters
    /// </summary>
    /// <param name="commandParameters">Array of SqlParameters to be assigned values</param>
    /// <param name="dataRow">The dataRow used to hold the stored procedure's parameter values</param>
    private static void AssignParameterValues(SqlParameter[] commandParameters, DataRow dataRow)
    {
        if ((commandParameters == null) || (dataRow == null))
        {
            // Do nothing if we get no data
            return;
        }

        int i = 0;
        // Set the parameters values
        foreach (SqlParameter commandParameter in commandParameters)
        {
            // Check the parameter name
            if (commandParameter.ParameterName == null ||
                commandParameter.ParameterName.Length <= 1)
                throw new Exception(
                    string.Format(
                    "Please provide a valid parameter name on the parameter #{0}, the ParameterName property has the following value: '{1}'.",
                    i, commandParameter.ParameterName));
            if (dataRow.Table.Columns.IndexOf(commandParameter.ParameterName.Substring(1)) != -1)
                commandParameter.Value = dataRow[commandParameter.ParameterName.Substring(1)];
            i++;
        }
    }

    /// <summary>
    /// This method assigns an array of values to an array of SqlParameters
    /// </summary>
    /// <param name="commandParameters">Array of SqlParameters to be assigned values</param>
    /// <param name="parameterValues">Array of objects holding the values to be assigned</param>
    private static void AssignParameterValues(SqlParameter[] commandParameters, object[] parameterValues)
    {
        if ((commandParameters == null) || (parameterValues == null))
        {
            // Do nothing if we get no data
            return;
        }

        // We must have the same number of values as we pave parameters to put them in
        if (commandParameters.Length != parameterValues.Length)
        {
            throw new ArgumentException("Parameter count does not match Parameter Value count.");
        }

        // Iterate through the SqlParameters, assigning the values from the corresponding position in the 
        // value array
        for (int i = 0, j = commandParameters.Length; i < j; i++)
        {
            // If the current array value derives from IDbDataParameter, then assign its Value property
            if (parameterValues[i] is IDbDataParameter)
            {
                IDbDataParameter paramInstance = (IDbDataParameter)parameterValues[i];
                if (paramInstance.Value == null)
                {
                    commandParameters[i].Value = DBNull.Value;
                }
                else
                {
                    commandParameters[i].Value = paramInstance.Value;
                }
            }
            else if (parameterValues[i] == null)
            {
                commandParameters[i].Value = DBNull.Value;
            }
            else
            {
                commandParameters[i].Value = parameterValues[i];
            }
        }
    }

    /// <summary>
    /// This method opens (if necessary) and assigns a connection, transaction, command type and parameters 
    /// to the provided command
    /// </summary>
    /// <param name="command">The SqlCommand to be prepared</param>
    /// <param name="connection">A valid SqlConnection, on which to execute this command</param>
    /// <param name="transaction">A valid SqlTransaction, or 'null'</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">An array of SqlParameters to be associated with the command or 'null' if no parameters are required</param>
    /// <param name="mustCloseConnection"><c>true</c> if the connection was opened by the method, otherwose is false.</param>
    private static void PrepareCommand(SqlCommand command, SqlConnection connection, SqlTransaction transaction, CommandType commandType, string commandText, SqlParameter[] commandParameters, out bool mustCloseConnection)
    {
        if (command == null) throw new ArgumentNullException("command");
        if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

        // If the provided connection is not open, we will open it
        if (connection.State != ConnectionState.Open)
        {
            mustCloseConnection = true;
            connection.Open();
        }
        else
        {
            mustCloseConnection = false;
        }

        // Associate the connection with the command
        command.Connection = connection;

        // Set the command text (stored procedure name or SQL statement)
        command.CommandText = commandText;

        // If we were provided a transaction, assign it
        if (transaction != null)
        {
            if (transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");
            command.Transaction = transaction;
        }

        // Set the command type
        command.CommandType = commandType;

        // Attach the command parameters if they are provided
        if (commandParameters != null)
        {
            AttachParameters(command, commandParameters);
        }
        return;
    }

    #endregion private utility methods & constructors

    // Hashtable to store cached parameters
    private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());

    #region Execute a SqlCommand (that returns no resultset) against the database specified in the connection string
    /// <summary>
    /// Execute a SqlCommand (that returns no resultset) against the database specified in the connection string 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="connectionString">a valid connection string for a SqlConnection</param>
    /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">the stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
    /// <returns>an int representing the number of rows affected by the command</returns>
    public static int ExecuteNonQuery(string connString, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
    {
        SqlCommand cmd = new SqlCommand();
        using (SqlConnection conn = new SqlConnection(connString))
        {
            PrepareCommand(cmd, conn, null, cmdType, cmdText, cmdParms);
            //取代可能的攻擊字眼
            ReplaceMaliciousParametersSqlCommand(ref cmd);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();

            conn.Close();

            return val;
        }
    }
    #endregion

    #region Execute a SqlCommand (that returns no resultset) against an existing database connection
    /// <summary>
    /// Execute a SqlCommand (that returns no resultset) against an existing database connection 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="conn">an existing database connection</param>
    /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">the stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
    /// <returns>an int representing the number of rows affected by the command</returns>
    public static int ExecuteNonQuery(SqlConnection conn, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
    {

        SqlCommand cmd = new SqlCommand();

        PrepareCommand(cmd, conn, null, cmdType, cmdText, cmdParms);
        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);
        int val = cmd.ExecuteNonQuery();
        cmd.Parameters.Clear();

        conn.Close();

        return val;
    }
    #endregion

    #region Execute a SqlCommand (that returns no resultset) using an existing SQL Transaction
    /// <summary>
    /// Execute a SqlCommand (that returns no resultset) using an existing SQL Transaction 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="trans">an existing sql transaction</param>
    /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">the stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
    /// <returns>an int representing the number of rows affected by the command</returns>
    public static int ExecuteNonQuery(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
    {
        SqlCommand cmd = new SqlCommand();
        PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, cmdParms);
        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);
        int val = cmd.ExecuteNonQuery();
        cmd.Parameters.Clear();
        trans.Connection.Close();
        return val;
    }
    #endregion

    #region Execute a SqlCommand that returns a resultset against the database specified in the connection string
    /// <summary>
    /// Execute a SqlCommand that returns a resultset against the database specified in the connection string 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  SqlDataReader r = ExecuteReader(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="connectionString">a valid connection string for a SqlConnection</param>
    /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">the stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
    /// <returns>A SqlDataReader containing the results</returns>
    public static SqlDataReader ExecuteReader(string connString, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection conn = new SqlConnection(connString);

        // we use a try/catch here because if the method throws an exception we want to 
        // close the connection throw code, because no datareader will exist, hence the 
        // commandBehaviour.CloseConnection will not work
        try
        {
            PrepareCommand(cmd, conn, null, cmdType, cmdText, cmdParms);
            //取代可能的攻擊字眼
            ReplaceMaliciousParametersSqlCommand(ref cmd);
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            cmd.Parameters.Clear();
            return rdr;
        }
        catch
        {
            conn.Close();
            throw;
        }
        finally
        {
            conn.Close();
        }
    }
    #endregion

    #region Execute a SqlCommand that returns the first column of the first record against the database specified in the connection string using the provided parameters.
    /// <summary>
    /// Execute a SqlCommand that returns the first column of the first record against the database specified in the connection string 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="connectionString">a valid connection string for a SqlConnection</param>
    /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">the stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
    /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
    public static object ExecuteScalar(string connString, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
    {
        SqlCommand cmd = new SqlCommand();

        using (SqlConnection conn = new SqlConnection(connString))
        {
            PrepareCommand(cmd, conn, null, cmdType, cmdText, cmdParms);
            //取代可能的攻擊字眼
            ReplaceMaliciousParametersSqlCommand(ref cmd);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            conn.Close();
            return val;
        }
    }
    #endregion

    #region Execute a SqlCommand that returns the first column of the first record against an existing database connection using the provided parameters.
    /// <summary>
    /// Execute a SqlCommand that returns the first column of the first record against an existing database connection 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="conn">an existing database connection</param>
    /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">the stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
    /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
    public static object ExecuteScalar(SqlConnection conn, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
    {

        SqlCommand cmd = new SqlCommand();

        PrepareCommand(cmd, conn, null, cmdType, cmdText, cmdParms);
        //取代可能的攻擊字眼
        ReplaceMaliciousParametersSqlCommand(ref cmd);
        object val = cmd.ExecuteScalar();

        cmd.Parameters.Clear();
        conn.Close();
        return val;
    }
    #endregion

    #region add parameter array to the cache
    /// <summary>
    /// add parameter array to the cache
    /// </summary>
    /// <param name="cacheKey">Key to the parameter cache</param>
    /// <param name="cmdParms">an array of SqlParamters to be cached</param>
    public static void CacheParameters(string cacheKey, params SqlParameter[] cmdParms)
    {
        parmCache[cacheKey] = cmdParms;
    }
    #endregion

    #region Retrieve cached parameters
    /// <summary>
    /// Retrieve cached parameters
    /// </summary>
    /// <param name="cacheKey">key used to lookup parameters</param>
    /// <returns>Cached SqlParamters array</returns>
    public static SqlParameter[] GetCachedParameters(string cacheKey)
    {
        SqlParameter[] cachedParms = (SqlParameter[])parmCache[cacheKey];

        if (cachedParms == null)
            return null;

        SqlParameter[] clonedParms = new SqlParameter[cachedParms.Length];

        for (int i = 0, j = cachedParms.Length; i < j; i++)
            clonedParms[i] = (SqlParameter)((ICloneable)cachedParms[i]).Clone();

        return clonedParms;
    }
    #endregion

    #region Prepare a command for execution
    /// <summary>
    /// Prepare a command for execution
    /// </summary>
    /// <param name="cmd">SqlCommand object</param>
    /// <param name="conn">SqlConnection object</param>
    /// <param name="trans">SqlTransaction object</param>
    /// <param name="cmdType">Cmd type e.g. stored procedure or text</param>
    /// <param name="cmdText">Command text, e.g. Select * from Products</param>
    /// <param name="cmdParms">SqlParameters to use in the command</param>
    private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
    {

        if (conn.State != ConnectionState.Open)
            conn.Open();

        cmd.Connection = conn;
        cmd.CommandText = cmdText;

        if (trans != null)
            cmd.Transaction = trans;

        cmd.CommandType = cmdType;

        if (cmdParms != null)
        {
            foreach (SqlParameter parm in cmdParms)
                cmd.Parameters.Add(parm);
        }
    }
    #endregion

    #region  SqlParam
    /// <summary>
    /// Make input param.
    /// </summary>
    /// <param name="ParamName">Name of param.</param>
    /// <param name="DbType">Param type.</param>
    /// <param name="Size">Param size.</param>
    /// <param name="Value">Param value.</param>
    /// <returns>New parameter.</returns>
    public static SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value)
    {
        return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
    }

    /// <summary>
    /// Make input param.
    /// </summary>
    /// <param name="ParamName">Name of param.</param>
    /// <param name="DbType">Param type.</param>
    /// <param name="Size">Param size.</param>
    /// <returns>New parameter.</returns>
    public static SqlParameter MakeOutParam(string ParamName, SqlDbType DbType, int Size)
    {
        return MakeParam(ParamName, DbType, Size, ParameterDirection.Output, null);
    }

    /// <summary>
    /// Make stored procedure param.
    /// </summary>
    /// <param name="ParamName">Name of param.</param>
    /// <param name="DbType">Param type.</param>
    /// <param name="Size">Param size.</param>
    /// <param name="Direction">Parm direction.</param>
    /// <param name="Value">Param value.</param>
    /// <returns>New parameter.</returns>
    public static SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size,
        ParameterDirection Direction, object Value)
    {
        SqlParameter param;

        if (Size > 0)
            param = new SqlParameter(ParamName, DbType, Size);
        else
            param = new SqlParameter(ParamName, DbType);

        param.Direction = Direction;
        if (!(Direction == ParameterDirection.Output && Value == null))
            param.Value = Value;

        return param;
    }

    #endregion

    #region ExecuteDataset

    /// <summary>
    /// Execute a SqlCommand (that returns a resultset and takes no parameters) against the database specified in 
    /// the connection string. 
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(connString, CommandType.StoredProcedure, "GetOrders");
    /// </remarks>
    /// <param name="connectionString">A valid connection string for a SqlConnection</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(string connectionString, CommandType commandType, string commandText)
    {
        // Pass through the call providing null for the set of SqlParameters
        return ExecuteDataset(connectionString, commandType, commandText, (SqlParameter[])null);
    }

    /// <summary>
    /// Execute a SqlCommand (that returns a resultset) against the database specified in the connection string 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(connString, CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="connectionString">A valid connection string for a SqlConnection</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">An array of SqlParamters used to execute the command</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
    {
        if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");

        // Create & open a SqlConnection, and dispose of it after we are done
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Call the overload that takes a connection in place of the connection string
            return ExecuteDataset(connection, commandType, commandText, commandParameters);
        }
    }

    /// <summary>
    /// Execute a stored procedure via a SqlCommand (that returns a resultset) against the database specified in 
    /// the connection string using the provided parameter values.  This method will query the database to discover the parameters for the 
    /// stored procedure (the first time each stored procedure is called), and assign the values based on parameter order.
    /// </summary>
    /// <remarks>
    /// This method provides no access to output parameters or the stored procedure's return value parameter.
    /// 
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(connString, "GetOrders", 24, 36);
    /// </remarks>
    /// <param name="connectionString">A valid connection string for a SqlConnection</param>
    /// <param name="spName">The name of the stored procedure</param>
    /// <param name="parameterValues">An array of objects to be assigned as the input values of the stored procedure</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(string connectionString, string spName, params object[] parameterValues)
    {
        if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");
        if (spName == null || spName.Length == 0) throw new ArgumentNullException("spName");

        // If we receive parameter values, we need to figure out where they go
        if ((parameterValues != null) && (parameterValues.Length > 0))
        {
            // Pull the parameters for this stored procedure from the parameter cache (or discover them & populate the cache)
            SqlParameter[] commandParameters = SqlHelperParameterCache.GetSpParameterSet(connectionString, spName);

            // Assign the provided values to these parameters based on parameter order
            AssignParameterValues(commandParameters, parameterValues);

            // Call the overload that takes an array of SqlParameters
            return ExecuteDataset(connectionString, CommandType.StoredProcedure, spName, commandParameters);
        }
        else
        {
            // Otherwise we can just call the SP without params
            return ExecuteDataset(connectionString, CommandType.StoredProcedure, spName);
        }
    }

    /// <summary>
    /// Execute a SqlCommand (that returns a resultset and takes no parameters) against the provided SqlConnection. 
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(conn, CommandType.StoredProcedure, "GetOrders");
    /// </remarks>
    /// <param name="connection">A valid SqlConnection</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(SqlConnection connection, CommandType commandType, string commandText)
    {
        // Pass through the call providing null for the set of SqlParameters
        return ExecuteDataset(connection, commandType, commandText, (SqlParameter[])null);
    }

    /// <summary>
    /// Execute a SqlCommand (that returns a resultset) against the specified SqlConnection 
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(conn, CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="connection">A valid SqlConnection</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">An array of SqlParamters used to execute the command</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
    {
        if (connection == null) throw new ArgumentNullException("connection");

        // Create a command and prepare it for execution
        SqlCommand cmd = new SqlCommand();
        bool mustCloseConnection = false;
        PrepareCommand(cmd, connection, (SqlTransaction)null, commandType, commandText, commandParameters, out mustCloseConnection);

        // Create the DataAdapter & DataSet
        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            DataSet ds = new DataSet();

            // Fill the DataSet using default values for DataTable names, etc
            da.Fill(ds);

            // Detach the SqlParameters from the command object, so they can be used again
            cmd.Parameters.Clear();

            if (mustCloseConnection)
                connection.Close();

            da.Dispose();
            // Return the dataset
            return ds;
        }
    }

    /// <summary>
    /// Execute a stored procedure via a SqlCommand (that returns a resultset) against the specified SqlConnection 
    /// using the provided parameter values.  This method will query the database to discover the parameters for the 
    /// stored procedure (the first time each stored procedure is called), and assign the values based on parameter order.
    /// </summary>
    /// <remarks>
    /// This method provides no access to output parameters or the stored procedure's return value parameter.
    /// 
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(conn, "GetOrders", 24, 36);
    /// </remarks>
    /// <param name="connection">A valid SqlConnection</param>
    /// <param name="spName">The name of the stored procedure</param>
    /// <param name="parameterValues">An array of objects to be assigned as the input values of the stored procedure</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(SqlConnection connection, string spName, params object[] parameterValues)
    {
        if (connection == null) throw new ArgumentNullException("connection");
        if (spName == null || spName.Length == 0) throw new ArgumentNullException("spName");

        // If we receive parameter values, we need to figure out where they go
        if ((parameterValues != null) && (parameterValues.Length > 0))
        {
            // Pull the parameters for this stored procedure from the parameter cache (or discover them & populate the cache)
            SqlParameter[] commandParameters = SqlHelperParameterCache.GetSpParameterSet(connection, spName);

            // Assign the provided values to these parameters based on parameter order
            AssignParameterValues(commandParameters, parameterValues);

            // Call the overload that takes an array of SqlParameters
            return ExecuteDataset(connection, CommandType.StoredProcedure, spName, commandParameters);
        }
        else
        {
            // Otherwise we can just call the SP without params
            return ExecuteDataset(connection, CommandType.StoredProcedure, spName);
        }
    }

    /// <summary>
    /// Execute a SqlCommand (that returns a resultset and takes no parameters) against the provided SqlTransaction. 
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(trans, CommandType.StoredProcedure, "GetOrders");
    /// </remarks>
    /// <param name="transaction">A valid SqlTransaction</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(SqlTransaction transaction, CommandType commandType, string commandText)
    {
        // Pass through the call providing null for the set of SqlParameters
        return ExecuteDataset(transaction, commandType, commandText, (SqlParameter[])null);
    }

    /// <summary>
    /// Execute a SqlCommand (that returns a resultset) against the specified SqlTransaction
    /// using the provided parameters.
    /// </summary>
    /// <remarks>
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(trans, CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24));
    /// </remarks>
    /// <param name="transaction">A valid SqlTransaction</param>
    /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
    /// <param name="commandText">The stored procedure name or T-SQL command</param>
    /// <param name="commandParameters">An array of SqlParamters used to execute the command</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(SqlTransaction transaction, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
    {
        if (transaction == null) throw new ArgumentNullException("transaction");
        if (transaction != null && transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");

        // Create a command and prepare it for execution
        SqlCommand cmd = new SqlCommand();
        bool mustCloseConnection = false;
        PrepareCommand(cmd, transaction.Connection, transaction, commandType, commandText, commandParameters, out mustCloseConnection);

        // Create the DataAdapter & DataSet
        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            DataSet ds = new DataSet();

            // Fill the DataSet using default values for DataTable names, etc
            da.Fill(ds);

            // Detach the SqlParameters from the command object, so they can be used again
            cmd.Parameters.Clear();

            // Return the dataset
            return ds;
        }
    }

    /// <summary>
    /// Execute a stored procedure via a SqlCommand (that returns a resultset) against the specified 
    /// SqlTransaction using the provided parameter values.  This method will query the database to discover the parameters for the 
    /// stored procedure (the first time each stored procedure is called), and assign the values based on parameter order.
    /// </summary>
    /// <remarks>
    /// This method provides no access to output parameters or the stored procedure's return value parameter.
    /// 
    /// e.g.:  
    ///  DataSet ds = ExecuteDataset(trans, "GetOrders", 24, 36);
    /// </remarks>
    /// <param name="transaction">A valid SqlTransaction</param>
    /// <param name="spName">The name of the stored procedure</param>
    /// <param name="parameterValues">An array of objects to be assigned as the input values of the stored procedure</param>
    /// <returns>A dataset containing the resultset generated by the command</returns>
    public static DataSet ExecuteDataset(SqlTransaction transaction, string spName, params object[] parameterValues)
    {
        if (transaction == null) throw new ArgumentNullException("transaction");
        if (transaction != null && transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");
        if (spName == null || spName.Length == 0) throw new ArgumentNullException("spName");

        // If we receive parameter values, we need to figure out where they go
        if ((parameterValues != null) && (parameterValues.Length > 0))
        {
            // Pull the parameters for this stored procedure from the parameter cache (or discover them & populate the cache)
            SqlParameter[] commandParameters = SqlHelperParameterCache.GetSpParameterSet(transaction.Connection, spName);

            // Assign the provided values to these parameters based on parameter order
            AssignParameterValues(commandParameters, parameterValues);

            // Call the overload that takes an array of SqlParameters
            return ExecuteDataset(transaction, CommandType.StoredProcedure, spName, commandParameters);
        }
        else
        {
            // Otherwise we can just call the SP without params
            return ExecuteDataset(transaction, CommandType.StoredProcedure, spName);
        }
    }

    #endregion ExecuteDataset

    public sealed class SqlHelperParameterCache
    {
        #region private methods, variables, and constructors

        //Since this class provides only static methods, make the default constructor private to prevent 
        //instances from being created with "new SqlHelperParameterCache()"
        private SqlHelperParameterCache() { }

        private static Hashtable paramCache = Hashtable.Synchronized(new Hashtable());

        /// <summary>
        /// Resolve at run time the appropriate set of SqlParameters for a stored procedure
        /// </summary>
        /// <param name="connection">A valid SqlConnection object</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <param name="includeReturnValueParameter">Whether or not to include their return value parameter</param>
        /// <returns>The parameter array discovered.</returns>
        private static SqlParameter[] DiscoverSpParameterSet(SqlConnection connection, string spName, bool includeReturnValueParameter)
        {
            if (connection == null) throw new ArgumentNullException("connection");
            if (spName == null || spName.Length == 0) throw new ArgumentNullException("spName");

            SqlCommand cmd = new SqlCommand(spName, connection);
            cmd.CommandType = CommandType.StoredProcedure;

            connection.Open();
            SqlCommandBuilder.DeriveParameters(cmd);
            connection.Close();

            if (!includeReturnValueParameter)
            {
                cmd.Parameters.RemoveAt(0);
            }

            SqlParameter[] discoveredParameters = new SqlParameter[cmd.Parameters.Count];

            cmd.Parameters.CopyTo(discoveredParameters, 0);

            // Init the parameters with a DBNull value
            foreach (SqlParameter discoveredParameter in discoveredParameters)
            {
                discoveredParameter.Value = DBNull.Value;
            }
            return discoveredParameters;
        }

        /// <summary>
        /// Deep copy of cached SqlParameter array
        /// </summary>
        /// <param name="originalParameters"></param>
        /// <returns></returns>
        private static SqlParameter[] CloneParameters(SqlParameter[] originalParameters)
        {
            SqlParameter[] clonedParameters = new SqlParameter[originalParameters.Length];

            for (int i = 0, j = originalParameters.Length; i < j; i++)
            {
                clonedParameters[i] = (SqlParameter)((ICloneable)originalParameters[i]).Clone();
            }

            return clonedParameters;
        }

        #endregion private methods, variables, and constructors

        #region caching functions

        /// <summary>
        /// Add parameter array to the cache
        /// </summary>
        /// <param name="connectionString">A valid connection string for a SqlConnection</param>
        /// <param name="commandText">The stored procedure name or T-SQL command</param>
        /// <param name="commandParameters">An array of SqlParamters to be cached</param>
        public static void CacheParameterSet(string connectionString, string commandText, params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");
            if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

            string hashKey = connectionString + ":" + commandText;

            paramCache[hashKey] = commandParameters;
        }

        /// <summary>
        /// Retrieve a parameter array from the cache
        /// </summary>
        /// <param name="connectionString">A valid connection string for a SqlConnection</param>
        /// <param name="commandText">The stored procedure name or T-SQL command</param>
        /// <returns>An array of SqlParamters</returns>
        public static SqlParameter[] GetCachedParameterSet(string connectionString, string commandText)
        {
            if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");
            if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

            string hashKey = connectionString + ":" + commandText;

            SqlParameter[] cachedParameters = paramCache[hashKey] as SqlParameter[];
            if (cachedParameters == null)
            {
                return null;
            }
            else
            {
                return CloneParameters(cachedParameters);
            }
        }

        #endregion caching functions

        #region Parameter Discovery Functions

        /// <summary>
        /// Retrieves the set of SqlParameters appropriate for the stored procedure
        /// </summary>
        /// <remarks>
        /// This method will query the database for this information, and then store it in a cache for future requests.
        /// </remarks>
        /// <param name="connectionString">A valid connection string for a SqlConnection</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <returns>An array of SqlParameters</returns>
        public static SqlParameter[] GetSpParameterSet(string connectionString, string spName)
        {
            return GetSpParameterSet(connectionString, spName, false);
        }

        /// <summary>
        /// Retrieves the set of SqlParameters appropriate for the stored procedure
        /// </summary>
        /// <remarks>
        /// This method will query the database for this information, and then store it in a cache for future requests.
        /// </remarks>
        /// <param name="connectionString">A valid connection string for a SqlConnection</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <param name="includeReturnValueParameter">A bool value indicating whether the return value parameter should be included in the results</param>
        /// <returns>An array of SqlParameters</returns>
        public static SqlParameter[] GetSpParameterSet(string connectionString, string spName, bool includeReturnValueParameter)
        {
            if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");
            if (spName == null || spName.Length == 0) throw new ArgumentNullException("spName");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                return GetSpParameterSetInternal(connection, spName, includeReturnValueParameter);
            }
        }

        /// <summary>
        /// Retrieves the set of SqlParameters appropriate for the stored procedure
        /// </summary>
        /// <remarks>
        /// This method will query the database for this information, and then store it in a cache for future requests.
        /// </remarks>
        /// <param name="connection">A valid SqlConnection object</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <returns>An array of SqlParameters</returns>
        internal static SqlParameter[] GetSpParameterSet(SqlConnection connection, string spName)
        {
            return GetSpParameterSet(connection, spName, false);
        }

        /// <summary>
        /// Retrieves the set of SqlParameters appropriate for the stored procedure
        /// </summary>
        /// <remarks>
        /// This method will query the database for this information, and then store it in a cache for future requests.
        /// </remarks>
        /// <param name="connection">A valid SqlConnection object</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <param name="includeReturnValueParameter">A bool value indicating whether the return value parameter should be included in the results</param>
        /// <returns>An array of SqlParameters</returns>
        internal static SqlParameter[] GetSpParameterSet(SqlConnection connection, string spName, bool includeReturnValueParameter)
        {
            if (connection == null) throw new ArgumentNullException("connection");
            using (SqlConnection clonedConnection = (SqlConnection)((ICloneable)connection).Clone())
            {
                return GetSpParameterSetInternal(clonedConnection, spName, includeReturnValueParameter);
            }
        }

        /// <summary>
        /// Retrieves the set of SqlParameters appropriate for the stored procedure
        /// </summary>
        /// <param name="connection">A valid SqlConnection object</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <param name="includeReturnValueParameter">A bool value indicating whether the return value parameter should be included in the results</param>
        /// <returns>An array of SqlParameters</returns>
        private static SqlParameter[] GetSpParameterSetInternal(SqlConnection connection, string spName, bool includeReturnValueParameter)
        {
            if (connection == null) throw new ArgumentNullException("connection");
            if (spName == null || spName.Length == 0) throw new ArgumentNullException("spName");

            string hashKey = connection.ConnectionString + ":" + spName + (includeReturnValueParameter ? ":include ReturnValue Parameter" : "");

            SqlParameter[] cachedParameters;

            cachedParameters = paramCache[hashKey] as SqlParameter[];
            if (cachedParameters == null)
            {
                SqlParameter[] spParameters = DiscoverSpParameterSet(connection, spName, includeReturnValueParameter);
                paramCache[hashKey] = spParameters;
                cachedParameters = spParameters;
            }

            return CloneParameters(cachedParameters);
        }

        #endregion Parameter Discovery Functions
    }
    #endregion

    #region 處理 SqlCommand 惡意攻擊符號
    /// <summary>
    /// 處理 SqlCommand 惡意攻擊符號
    /// </summary>
    /// <param name="sc"></param>
    private static void ReplaceMaliciousParametersSqlCommand(ref SqlCommand sc)
    {
        foreach (System.Data.SqlClient.SqlParameter p in sc.Parameters)
        {
            if (p.Value != null)
            {
                p.Value = RemoveHTMLTags(DoReplace(p.Value.ToString()));
            }
        }
    }
    /// <summary>
    /// 目前可通過掃描的項目
    /// </summary>
    /// <param name="strOri">參數</param>
    /// <returns></returns>
    private static string DoReplace(string strOri)
    {
        if (strOri.Length > 0)
        {
            strOri = strOri.Replace("|", "︱");
            strOri = strOri.Replace("&", "＆");
            //strOri = strOri.Replace(";", "；");
            strOri = strOri.Replace("$", "＄");
            strOri = strOri.Replace("%", "％");
            strOri = strOri.Replace("@", "＠");
            strOri = strOri.Replace("'", "’");
            strOri = strOri.Replace("<", "＜");
            //strOri = strOri.Replace("(", "（");
            //strOri = strOri.Replace("\"", "＂");
            strOri = strOri.Replace(">", "＞");
            //strOri = strOri.Replace(")", "）");
            strOri = strOri.Replace("+", "＋");
            strOri = strOri.Replace("#", "＃");
            //strOri = strOri.Replace(" CR ", "ＣＲ");
            // strOri = strOri.Replace(" LF ", "ＬＦ");
            //strOri = strOri.Replace("\\", "＼");
            //strOri = strOri.Replace("&lt", "＆lt");
            // strOri = strOri.Replace("&gt", "＆gt");

            //如果有連續兩個以上的"-"，則將所有的"-"變成全型"－"
            if (strOri.IndexOf("--") > -1)
                strOri = strOri.Replace("-", "－");
        }

        return strOri;
    }
    #endregion
}