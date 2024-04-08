<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="changePassword" %>

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
    <link rel="stylesheet" href="css/fontawesome-all.min.css"><!-- css icon fontawesome 5 -->
    <link rel="stylesheet" href="css/login.css" /><!-- 本系統專用 -->

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script><!-- bootstrap 5.2 -->

    <script>
        function check() {
            var pwo = document.getElementById("loginpwo");
            var pw = document.getElementById("loginpw");
            var pw2 = document.getElementById("loginpw2");

            if (pwo.value.trim() == "" || pw.value.trim() == "" || pw2.value.trim() == "") {
                alert("各欄位皆必填。");
                return false;
            }

            if (pw.value.trim() != pw2.value.trim()) {
                alert("新密碼 及 再次輸入新密碼 必須相同。");
                return false;
            }

            return true;
        }

        function goto(msg) {
            alert(msg);
            location.href = "enter.aspx";
        }
    </script>
</head>
<body class="bodygbg">
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col"></div>
            <div class="col text-center">
                <img src="images/logo.svg" height="35">
                <span class="fs-3 fw-bold">森霸電力營運管理系統</span>
            </div>
            <div class="col">
            </div>
        </div>

        <div class="container mt-3">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-12 col-lg-9 col-xl-8">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col d-flex align-items-center">
                                <div class="card-body py-5 px-4 p-md-5">
                                    <h3 class="fw-bold">修改密碼</h3>
                                    <form id="form1" runat="server">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="loginpwo" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <label class="form-label" for="loginpwo">原密碼</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="loginpw" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <label class="form-label" for="loginpw">新密碼</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="loginpw2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <label class="form-label" for="loginpw2">再次輸入新密碼</label>
                                        </div>

                                        <div class="d-flex justify-content-end pt-1 mb-4">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="Button1" runat="server" Text="送出" CssClass="btn btn-primary" OnClientClick="return check();" OnClick="Button1_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>   
                                        </div>
                                        <hr>
                                        <a class="link float-end" href="enter.aspx">回首頁</a>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/mdb.min.js"></script>
    <!-- bootstrap mdb5 -->
</body>
</html>
