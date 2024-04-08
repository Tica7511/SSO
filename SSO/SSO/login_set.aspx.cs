using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_set : System.Web.UI.Page
{
    internal RemoveCheckMax oRCM = new RemoveCheckMax();

    public bool IsDangerWord(string str)
    {
        //if( str.ToUpper().IndexOf("-") >=0 ) return true ;
        if (str.ToUpper().IndexOf("%") >= 0) return true;
        if (str.ToUpper().IndexOf("\"") >= 0) return true;
        if (str.ToUpper().IndexOf("'") >= 0) return true;
        if (str.ToUpper().IndexOf("$") >= 0) return true;
        if (str.ToUpper().IndexOf("{") >= 0) return true;
        return false;

    }

    public bool IsNatural_Number(string str)
    {
        System.Text.RegularExpressions.Regex reg1 = new System.Text.RegularExpressions.Regex(@"^[A-Za-z0-9]+$");
        return reg1.IsMatch(str);
    }
    private void ConvertSqlParametersEmptyStringToNull(SqlDataSource dataSource, bool isNull)
    {
        foreach (Parameter parameter in dataSource.SelectParameters)
            parameter.ConvertEmptyStringToNull = isNull;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Session["登入工號"] != null)
                && (Session["登入工號"].ToString() == "E1005" ||
                   Session["登入工號"].ToString() == "E1003" ||
                   Session["登入工號"].ToString() == "robit" ||
                   Session["登入工號"].ToString() == "laputa"

                ))
            {



                Binddep();
                Binddata();

            }
            else
            {
                Response.Redirect("login.aspx");
            }


        }
    }

    private void Binddep()
    {

        ddl_dep.Items.Clear();
 
        DataTable dt = new DataTable();
        #region --- query ---

        using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SUNBA_Common_CS"].ConnectionString))
        {
            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = @"esp_login_set";
            // --- 避免匯出查詢過久而當掉 --- //
            sqlCmd.CommandTimeout = 0;
            sqlCmd.Parameters.Clear();
            sqlCmd.Parameters.AddWithValue("@mode", oRCM.SQLInjectionReplaceAll("List_dep"));
            try
            {
                sqlConn.Open();

                SqlDataAdapter sqlDA = new SqlDataAdapter(sqlCmd);
                dt = new DataTable();
                sqlDA.Fill(dt);

            }
            catch (Exception ex)
            {

                // --- 執行異常通報 --- //
                RemoveCheckMax.ErrorLogMail logMail = new RemoveCheckMax.ErrorLogMail(
                    ConfigurationManager.ConnectionStrings["CS_Contract"].ConnectionString,
                    Request,
                    Response,
                    ex
                    );

                oRCM.ErrorExceptionDataToDB(logMail);

            }
            finally
            {
                sqlConn.Close();
            }
        }

        #endregion
        ddl_dep.DataSource = dt;
        ddl_dep.DataBind();
        ddl_dep.Items.Insert(0, new ListItem("", ""));

    }

    private void Binddata()
    {
        
       
        SqlDataSource SDS_search = new SqlDataSource();
       // sgvList.PageIndex = 0;
        SDS_search.ID = "SDS_xx";
        SDS_search.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SUNBA_Common_CS"].ConnectionString;
        SDS_search.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SDS_search.SelectParameters.Clear();
        SDS_search.SelectCommand = "esp_login_set";
        SDS_search.SelectParameters.Add("deptid", oRCM.SQLInjectionReplaceAll(ddl_dep.SelectedValue));
        SDS_search.SelectParameters.Add("kw", oRCM.SQLInjectionReplaceAll(TB_kw.Text));

        SDS_search.SelectParameters.Add("mode", oRCM.SQLInjectionReplaceAll("List_view"));
        ConvertSqlParametersEmptyStringToNull(SDS_search, false);

        SDS_search.DataBind();
        sgvList.DataSource = SDS_search;
        sgvList.DataBind();
        SDS_search.Dispose();
    }

    protected void sgvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
      sgvList.PageIndex = e.NewPageIndex;
      Binddata();
    }
    protected void sgvList_SelectedIndexChanged(object sender, EventArgs e)
    {
        sgvList.DataBind();
    }
    protected void sgvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "xDelete")
        {
             DataTable dt = new DataTable();
            #region --- query ---
            using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SUNBA_Common_CS"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand();
                sqlCmd.Connection = sqlConn;
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.CommandText = @"esp_login_set";

                // --- 避免匯出查詢過久而當掉 --- //
                sqlCmd.CommandTimeout = 0;

                sqlCmd.Parameters.Clear();
                sqlCmd.Parameters.AddWithValue("編號", oRCM.SQLInjectionReplaceAll(e.CommandArgument.ToString()));
                sqlCmd.Parameters.AddWithValue("mode", oRCM.SQLInjectionReplaceAll("retset_pwd"));

                try
                {
                    sqlConn.Open();

                    SqlDataAdapter sqlDA = new SqlDataAdapter(sqlCmd);
                    dt = new DataTable();
                    sqlDA.Fill(dt);

                }
                catch (Exception ex)
                {

                    // --- 執行異常通報 --- //
                    RemoveCheckMax.ErrorLogMail logMail = new RemoveCheckMax.ErrorLogMail(
                        ConfigurationManager.ConnectionStrings["CS_Contract"].ConnectionString,
                        Request,
                        Response,
                        ex
                        );

                    oRCM.ErrorExceptionDataToDB(logMail);

                }
                finally
                {
                    sqlConn.Close();
                }
            }
            #endregion
            Binddata();
        }
    }

    protected void sgvList_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void sgvList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddl_營運效率 = (DropDownList)e.Row.FindControl("DDL_營運效率");
            DropDownList ddl_工作日誌 = (DropDownList)e.Row.FindControl("DDL_工作日誌");
            DropDownList ddl_聯絡掛卡 = (DropDownList)e.Row.FindControl("DDL_聯絡掛卡");
            DropDownList ddl_巡檢 = (DropDownList)e.Row.FindControl("DDL_巡檢");
            DropDownList ddl_預防保養 = (DropDownList)e.Row.FindControl("DDL_預防保養");
            DropDownList ddl_請修 = (DropDownList)e.Row.FindControl("DDL_請修");
            DropDownList ddl_承攬商 = (DropDownList)e.Row.FindControl("DDL_承攬商");
            DropDownList ddl_庶務 = (DropDownList)e.Row.FindControl("DDL_庶務");
            DropDownList ddl_固定資產 = (DropDownList)e.Row.FindControl("DDL_固定資產");
            DropDownList ddl_驗收 = (DropDownList)e.Row.FindControl("DDL_驗收");
            DropDownList ddl_請採購 = (DropDownList)e.Row.FindControl("DDL_請採購");
            DropDownList ddl_人資 = (DropDownList)e.Row.FindControl("DDL_人資");
            DropDownList ddl_人資管理 = (DropDownList)e.Row.FindControl("DDL_人資管理");
            DropDownList ddl_權限設定 = (DropDownList)e.Row.FindControl("DDL_權限設定");
 

            if (ddl_營運效率 != null) 
            {
                ddl_人資管理.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@人資管理";
                ddl_人資管理.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "人資管理"));

                ddl_人資.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@人資";
                ddl_人資.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "人資"));
                ddl_請採購.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@請採購";
                ddl_請採購.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "請採購"));
                ddl_驗收.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@驗收";
                ddl_驗收.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "驗收"));
                ddl_固定資產.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@固定資產";
                ddl_固定資產.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "固定資產"));


                ddl_庶務.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@庶務";
                ddl_庶務.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "庶務"));
                ddl_承攬商.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@承攬商";
                ddl_承攬商.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "承攬商"));
                ddl_請修.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@請修";
                ddl_請修.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "請修"));
                ddl_預防保養.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@預防保養";
                ddl_預防保養.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "預防保養"));
                ddl_巡檢.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@巡檢";
                ddl_巡檢.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "巡檢"));
                ddl_聯絡掛卡.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@聯絡掛卡";
                ddl_聯絡掛卡.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "聯絡掛卡"));
                ddl_工作日誌.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@工作日誌";
                ddl_工作日誌.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "工作日誌"));
                ddl_營運效率.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim()+ "@營運效率";
                ddl_營運效率.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "營運效率"));
                ddl_權限設定.Attributes["caseno"] = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "編號")).Trim() + "@權限設定";
                ddl_權限設定.SelectedValue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "權限設定"));
            }




            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#d5eefc'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
            }
        }
    }


    protected void HecUpdate(object sender, System.EventArgs e)
    {
        string 編號 = ((DropDownList)sender).Attributes["caseno"].ToString().Split('@')[0];
        string 設定 = ((DropDownList)sender).SelectedValue;
        string field=((DropDownList) sender).Attributes["caseno"].ToString().Split('@')[1];
        if (IsDangerWord(設定)) Response.Redirect("../danger.aspx");
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SUNBA_Common_CS"].ConnectionString);
        oCmd.CommandText = "esp_login_set";
        oCmd.CommandType = CommandType.StoredProcedure;
        oCmd.Parameters.AddWithValue("@編號", oRCM.SQLInjectionReplaceAll(編號));
        oCmd.Parameters.AddWithValue("@set", oRCM.SQLInjectionReplaceAll(設定));
        oCmd.Parameters.AddWithValue("field", oRCM.SQLInjectionReplaceAll(field));
        oCmd.Parameters.AddWithValue("mode", oRCM.SQLInjectionReplaceAll("upd_set"));
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataSet ds = new DataSet();
        oda.Fill(ds, "myTable");
        oCmd.Dispose();
        oda.Dispose();
        Binddata();
    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        Binddata();
    }
}