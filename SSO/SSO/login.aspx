<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="webpage_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="content-language" content="zh-TW" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="keywords" content="關鍵字內容" />
    <meta name="description" content="描述" /><!--告訴搜尋引擎這篇網頁的內容或摘要。-->
    <meta name="generator" content="Notepad" /><!--告訴搜尋引擎這篇網頁是用什麼軟體製作的。-->
    <meta name="author" content="ochison" /><!--告訴搜尋引擎這篇網頁是由誰製作的。-->
    <meta name="copyright" content="本網頁著作權所有" /><!--告訴搜尋引擎這篇網頁是...... -->
    <meta name="revisit-after" content="3 days" /><!--告訴搜尋引擎3天之後再來一次這篇網頁，也許要重新登錄。-->
    <title>森霸電力營運管理系統</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" /><!-- bootstrap -->
    <link rel="stylesheet" href="css/mdb.free.css" /><!-- bootstrap mdb5 -->
    <link rel="stylesheet" href="css/fontawesome-all.min.css" /><!-- css icon fontawesome 5 -->
    <link rel="stylesheet" href="css/login.css" /><!-- 本系統專用 -->

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script><!-- bootstrap 5.2 -->

    <script>
        function check() {
            var acc = document.getElementById("loginacc");
            var pw = document.getElementById("loginpw");

            if (acc.value.trim() == "" || pw.value.trim() == "") {
                alert("帳號及密碼必填。");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <section class="intro">
        <div class="bg-image h-100">
            <div class="mask d-flex align-items-center h-100 bodygbg">
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-12 col-lg-9 col-xl-8">
                            <div class="card" style="border-radius: 1rem;">
                                <div class="row g-0">
                                    <div class="col-md-4 d-none d-md-block">
                                        <img
                                            src="images/logoimg.jpg"
                                            alt="login form"
                                            class="img-fluid" style="border-top-left-radius: 1rem; border-bottom-left-radius: 1rem;" />
                                    </div>
                                    <div class="col-md-8 d-flex align-items-center">
                                        <div class="card-body py-5 px-4 p-md-5">

                                            <form id="form1" runat="server">
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                                <div class="mb-3 d-flex align-items-center">
                                                    <img src="images/logo.svg" height="35">
                                                    <span class="fs-3 fw-bold">森霸電力營運管理系統</span>
                                                </div>

                                                <%--<div class="form-outline mb-4">
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SUNBA_Common_CS %>" SelectCommand="SELECT [EMPLOYEE_CNAME], [EMPLOYEE_NO], [dept_code], [DEPARTMENT_CNAME] FROM [V_員工資料] order by [EMPLOYEE_CNAME]"></asp:SqlDataSource>
            
                                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_CNAME" DataValueField="EMPLOYEE_NO" OnDataBound="DropDownList1_DataBound" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SUNBA_Common_CS %>" SelectCommand="SELECT [EMPLOYEE_NO], [EMPLOYEE_CNAME], [dept_code], [DEPARTMENT_CNAME] FROM [V_員工資料] WHERE ([EMPLOYEE_NO] = @EMPLOYEE_CNAME)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList1" Name="EMPLOYEE_CNAME" PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>                               
                                                </div>--%>

                                                <div class="form-outline mb-4">
                                                    <asp:TextBox ID="loginacc" runat="server" CssClass="form-control"></asp:TextBox>                                     
                                                    <label class="form-label" for="loginacc">帳號</label>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <asp:TextBox ID="loginpw" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                    <label class="form-label" for="loginpw">密碼</label>
                                                </div>

                                                <div class="d-flex justify-content-end pt-1 mb-4">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="Button1" runat="server" Text="登入" CssClass="btn btn-primary" OnClientClick="return check();" OnClick="Button1_Click" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>                                          
                                                </div>
                                                <hr>
                                                <a class="link float-end" href="forget.aspx">忘記密碼</a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/mdb.min.js"></script>
    <!-- bootstrap mdb5 -->
</body>
</html>
