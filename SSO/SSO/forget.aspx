<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forget.aspx.cs" Inherits="webpage_forget" %>

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
        function ValidateEmail() { //電子郵件檢查
            var regex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
            var mail = document.getElementById("mail").value;

            if (!regex.test(mail)) {
                alert("信箱錯誤。");
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
                                                    <span class="ps-2 text-primary fw-bold">忘記密碼</span>
                                                </div>

                                                <div>請輸入您的公司信箱，系統會寄送重設密碼連結給您。</div>

                                                <div class="form-outline mb-4">
                                                    <asp:TextBox ID="mail" runat="server" CssClass="form-control"></asp:TextBox>                                     
                                                    <label class="form-label" for="mail">公司信箱</label>
                                                </div>

                                                <div class="d-flex justify-content-end pt-1 mb-4">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="Button1" runat="server" Text="送出" CssClass="btn btn-primary" OnClientClick="return ValidateEmail();" OnClick="Button1_Click" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>                                          
                                                </div>
                                                <hr>
                                                <a class="link float-end" href="login.aspx">回登入畫面</a>
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
