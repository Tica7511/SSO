<%@ Page Language="C#" AutoEventWireup="true" CodeFile="enter.aspx.cs" Inherits="webpage_enter" %>

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
    <link rel="stylesheet" href="css/fontawesome-all.min.css" /><!-- css icon fontawesome 6 -->
    <link rel="stylesheet" href="css/enter.css" /><!-- 本系統專用 -->

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script><!-- bootstrap 5.2 -->
    <script>
        function open104() {
            document.getElementById("a1").click();
        }
		
		function opentest(url){
		var h = document.documentElement.clientHeight;
		var w =document.documentElement.clientWidth;
			window.open(url,'_blank', 'width='+w+',height='+h+'');
		}
    </script>
</head>
<body class="bodygbg">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <%--<div class="mt-5 d-flex justify-content-center align-items-center">
                <img src="images/logo.svg" height="35">
                <span class="fs-3 fw-bold">森霸電力營運管理系統</span>
            </div>--%>

            <div class="row mt-5">
                <div class="col"></div>
                <div class="col text-center">
                    <img src="images/logo.svg" height="35">
                    <span class="fs-3 fw-bold">森霸電力營運管理系統</span>
                </div>
                <div class="col text-end">
					<asp:Label ID="Label1" runat="server" Text=""></asp:Label>, 您好
					<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-success fs-5" OnClick="LinkButton2_Click">登出</asp:LinkButton>
                    <a href="changePassword.aspx" class="btn btn-danger fs-5">重設密碼</a>
                </div>
            </div>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-5 mt-3">
                <asp:HiddenField ID="hfcompno" runat="server" />
                <asp:HiddenField ID="hfempno" runat="server" />
                <div id="sys1" runat="server" class="col mb-5">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:70783499_CS %>" 
                            SelectCommand="spZZ_COMMON_GETKEY" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter Name="COMPANY_SNO" ControlID="hfcompno" Type="String" />
                            <asp:ControlParameter Name="EMPLOYEE_NO" ControlID="hfempno" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:LinkButton ID="lb104" runat="server" CssClass="card1 h-100" OnClick="lb104_Click">
                        <h3 class="text-center"><i class="fa-solid fa-user-group"></i></h3>
                        <p class="text-center fs-5 fw-bold">人資系統</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                        <a id="a1" runat="server" target="_blank"></a>
                    </asp:LinkButton>
                </div>
                <!-- col -->

                <div id="sys2" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/Sunba_Erp/Purchasinglist" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-comments-dollar"></i></h3>
                        <p class="text-center fs-5 fw-bold">請購/服務/維修/採購電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys3" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="#">
                        <h3 class="text-center"><i class="fa-solid fa-clipboard-list-check"></i></h3>
                        <p class="text-center fs-5 fw-bold">驗收作業電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys4" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="#">
                        <h3 class="text-center"><i class="fa-solid fa-warehouse-full"></i></h3>
                        <p class="text-center fs-5 fw-bold">倉管作業電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys5" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="#">
                        <h3 class="text-center"><i class="fa-solid fa-sack-dollar"></i></h3>
                        <p class="text-center fs-5 fw-bold">固定資產作業電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys6" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/SunBa_Affairs/WebPage/Default.aspx" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-mug-saucer"></i></h3>
                        <p class="text-center fs-5 fw-bold">庶務管理電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col --> 

                <div id="sys7" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/sunbaSecurity/MS/login.aspx" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-hand-holding-dollar"></i></h3>
                        <p class="text-center fs-5 fw-bold">承攬商管理系統</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys8" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/revise/webpage/index.aspx" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-engine-warning"></i></h3>
                        <p class="text-center fs-5 fw-bold">工作請修/銷單電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys9" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/PM/PMExecution/PMExeList" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-vest"></i></h3>
                        <p class="text-center fs-5 fw-bold">預防保養單電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys10" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/Inspection/Index.aspx" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-user-helmet-safety"></i></h3>
                        <p class="text-center fs-5 fw-bold">運轉現場人員巡檢電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys11" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/Communication/Issue/CommunicationLists.aspx" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-phone-volume"></i></h3>
                        <p class="text-center fs-5 fw-bold">工作聯絡/掛卡電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys12" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/DailyRecord" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-money-check-pen"></i></h3>
                        <p class="text-center fs-5 fw-bold">工作日誌電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div id="sys13" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="#">
                        <h3 class="text-center"><i class="fa-solid fa-chart-user"></i></h3>
                        <p class="text-center fs-5 fw-bold">營運報告&效率計算電子化管理</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->
				
                <div id="sys14" runat="server" class="col mb-5">
                    <a class="card1 h-100" href="https://powersunba.com.tw/sso/login_set.aspx" target="_blank">
                        <h3 class="text-center"><i class="fa-solid fa-id-badge"></i></h3>
                        <p class="text-center fs-5 fw-bold">權限設定</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </a>
                </div>
                <!-- col -->

                <div class="col mb-5">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="card1 h-100" OnClick="LinkButton1_Click" >
                        <h3 class="text-center"><i class="fa-solid fa-money-check-pen"></i></h3>
                        <p class="text-center fs-5 fw-bold">電子簽核</p>
                        <div class="go-corner" href="#">
                            <div class="go-arrow">
                                →
                            </div>
                        </div>
                    </asp:LinkButton>
                </div>
                <!-- col -->

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SUNBA_Common_CS %>" 
                        SelectCommand="SELECT * FROM [人員資料表] WHERE ([帳號] = @EMPLOYEE_NO)">
                    <SelectParameters>
                        <asp:ControlParameter Name="EMPLOYEE_NO" ControlID="hfempno" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <!-- row -->
        </div>
    </form>
</body>
</html>
