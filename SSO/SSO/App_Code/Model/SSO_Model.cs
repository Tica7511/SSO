using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SSO_Model
/// </summary>
public class SSO_Model
{
    public SSO_Model()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// 登入帳號
    /// </summary>
    public string account { set; get; }

    /// <summary>
    /// GUID
    /// </summary>
    public string guid { set; get; }

    /// <summary>
    /// 電子郵件
    /// </summary>
    public string email { set; get; }

    /// <summary>
    /// URL
    /// </summary>
    public string url { set; get; }

    /// <summary>
    /// 密碼
    /// </summary>
    public string password { set; get; }

    /// <summary>
    /// Hash密碼
    /// </summary>
    public string hashPassword { set; get; }

    /// <summary>
    /// Hash密碼2
    /// </summary>
    public string hashPassword2 { set; get; }
     
}