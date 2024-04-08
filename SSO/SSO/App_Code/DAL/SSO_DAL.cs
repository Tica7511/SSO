using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SSO_DAL
/// </summary>
public class SSO_DAL : common
{
    public SSO_DAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// 登入驗證
    /// </summary>
    /// <param name="帳號"></param>
    /// <returns></returns>
    public DataView CheckAuth(SSO_Model sm)
    {
        try
        {
            SqlCommand sqlCmd = new SqlCommand("sp_登入驗證");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandTimeout = 0;
            sqlCmd.Parameters.Add(new SqlParameter("@帳號", sm.account));
            return runParaCmd(sqlCmd);
        }
        catch (Exception ex)
        {
            throw new Exception(string.Format("登入驗證，錯誤訊息:{0}", ex.Message));
        }
    }

    /// <summary>
    /// 取得USER GUID
    /// </summary>
    /// <param name="email"></param>
    /// <param name="url"></param>
    /// <returns></returns>
    public DataView GetUserGuid(SSO_Model sm)
    {
        try
        {
            SqlCommand sqlCmd = new SqlCommand("sp_GetUserGuid");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandTimeout = 0;
            sqlCmd.Parameters.Add(new SqlParameter("@email", sm.email));
            sqlCmd.Parameters.Add(new SqlParameter("@url", sm.url));
            return runParaCmd(sqlCmd);
        }
        catch (Exception ex)
        {
            throw new Exception(string.Format("取得USER GUID，錯誤訊息:{0}", ex.Message));
        }
    }

    /// <summary>
    /// 密碼重設
    /// </summary>
    /// <param name="guid"></param>
    /// <param name="pw"></param>
    /// <returns></returns>
    public DataView ChangePassword(SSO_Model sm)
    {
        try
        {
            SqlCommand sqlCmd = new SqlCommand("sp_密碼重設");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandTimeout = 0;
            sqlCmd.Parameters.Add(new SqlParameter("@guid", sm.guid));
            sqlCmd.Parameters.Add(new SqlParameter("@pw", sm.password));
            return runParaCmd(sqlCmd);
        }
        catch (Exception ex)
        {
            throw new Exception(string.Format("密碼重設，錯誤訊息:{0}", ex.Message));
        }
    }

    /// <summary>
    /// 修改密碼
    /// </summary>
    /// <param name="account"></param>
    /// <param name="password"></param>
    /// <param name="hashpassword"></param>
    /// <param name="hashpassword2"></param>
    /// <returns></returns>
    public DataView ChangePassword2(SSO_Model sm)
    {
        try
        {
            SqlCommand sqlCmd = new SqlCommand("sp_修改密碼");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandTimeout = 0;
            sqlCmd.Parameters.Add(new SqlParameter("@account", sm.account));
            sqlCmd.Parameters.Add(new SqlParameter("@password", sm.password));
            sqlCmd.Parameters.Add(new SqlParameter("@hashpassword", sm.hashPassword));
            sqlCmd.Parameters.Add(new SqlParameter("@hashpassword2", sm.hashPassword2));
            return runParaCmd(sqlCmd);
        }
        catch (Exception ex)
        {
            throw new Exception(string.Format("修改密碼，錯誤訊息:{0}", ex.Message));
        }
    }

}