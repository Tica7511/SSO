<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_set.aspx.cs" Inherits="login_set" %>
<%@ Register Assembly="SmartGridView" Namespace="GridView3Probe" TagPrefix="cc1" %>
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
 

</head>
<body>
  <form id="form1" runat="server">

        <div id="page-content-body">
          <div class="container-ochi" style="max-width: 1600px;">

            <div class="d-flex align-items-center justify-content-between mt-4">
              <div>
                <a href='https://powersunba.com.tw/sso/enter.aspx'>首頁</a> / 
                <div class="fs-3 fw-bold">權限設定</div>
              </div>
              <div>

              </div>
            </div><!-- d-flex -->

            <div class="bg-light p-3 shadow-sm rounded-2 my-3">
              <div class="ochiform TitleLength08">

                <div class="row gy-2 align-items-center OchiRow">
                  <div class="col-md-6">
                    <!-- form item start -->
                    <div class="row flex-md-nowrap align-items-center">
                      <div class="col-md-auto TitleSetWidth text-md-end"><label class="form-label" >單位</label></div>
                      <div class="col-md-auto flex-grow-1">
                                  <asp:DropDownList ID="ddl_dep" runat="server" Width="165px" DataTextField="Text" DataValueField="Value"   class="form-select">
                                     <asp:ListItem Value="">   --請選擇--  </asp:ListItem>
                                 </asp:DropDownList>
                      </div>
                    </div><!-- row -->
                    <!-- form item end -->
                  </div><!-- col -->
                  <div class="col-md-6">
                    <!-- form item start -->
                    <div class="row flex-md-nowrap align-items-center">
                      <div class="col-md-auto TitleSetWidth text-md-end"><label class="form-label" >關鍵字</label></div>
                      <div class="col-md-auto flex-grow-1">
                        <asp:TextBox ID="TB_kw" runat="server" class="form-control"></asp:TextBox>
                      </div>
                    </div><!-- row -->
                    <!-- form item end -->
                  </div><!-- col -->

                </div><!-- row -->

               
              </div><!-- ochiform -->

              <div class="text-end mt-2">
              
                  <asp:Button ID="Button1" runat="server" Text="查詢" class="btn btn-primary" OnClick="Button1_Click"/>
              </div>

            </div><!-- bg-light -->

            <div  style="max-width: 1600px;">



<cc1:SmartGridView ID="sgvList" BorderWidth="0px" CellPadding="0" AllowPaging="True" runat="server" AutoGenerateColumns="False" Width="1600px" 
    OnPageIndexChanging="sgvList_PageIndexChanging" 
    OnRowDataBound="sgvList_RowDataBound" 
    OnRowCommand="sgvList_RowCommand" AllowSorting="True" 
    OnSorting="sgvList_Sorting" OnSelectedIndexChanged="sgvList_SelectedIndexChanged"  class="table table-bordered table-striped">
                        <Columns>

                             <asp:TemplateField HeaderText="所屬單位">
                                <ItemTemplate><%#Eval("GROUP_NAME")%>
                                </ItemTemplate>
                                <HeaderStyle Width="80px"></HeaderStyle>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="員工編號">
                                <ItemTemplate><%#Eval("帳號")%><br> <%#Eval("姓名")%><%--                                    
                                    <asp:ImageButton ID="IB_del" runat="server" Height="20px" Width="20px" ImageUrl="~/images/icon-delete.png" CommandName="Del" CommandArgument='<%# Eval("tip_id") %>' />
                                    <asp:ImageButton ID="IB_mod" runat="server" Height="20px" Width="20px" ImageUrl="~/images/icon-edit.png" class="ajax-addMore" />--%>
                                    <asp:Literal ID="LT_view" runat="server" />
                                </ItemTemplate>
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </asp:TemplateField>
                            
                              <asp:TemplateField HeaderText="功能">
                                <ItemTemplate><%#Eval("重設密碼")%><br />
                                    <asp:LinkButton ID="LB_del" runat="server" CommandName="xDelete" CommandArgument='<%# Eval("編號") %>' OnClientClick="return confirm('確定修改?');">密碼改回工號</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="80px"></HeaderStyle>
                            </asp:TemplateField>  

                            <asp:TemplateField HeaderText="人資管理">
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>  
                                    <asp:DropDownList ID="DDL_人資管理" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="人資"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_人資" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="請採購"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>  
                                    <asp:DropDownList ID="DDL_請採購" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="驗收"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_驗收" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="固定資產"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_固定資產" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="庶務"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_庶務" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="承攬商"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_承攬商" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="請修"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_請修" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="預防保養"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_預防保養" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="巡檢"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate> 
                                    <asp:DropDownList ID="DDL_巡檢" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="聯絡掛卡"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDL_聯絡掛卡" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="工作日誌"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDL_工作日誌" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="營運效率"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDL_營運效率" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="權限設定"  >
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDL_權限設定" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HecUpdate" >
                                         <asp:ListItem Value=""> </asp:ListItem>
                                         <asp:ListItem Value="True">V</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
   			</asp:TemplateField>

                        </Columns>
                        <CustomPagerSettings PagingMode="Webabcd" TextFormat="<span style='color:#578c27'>每頁</span><span style='color:#ffa500'>{0}</span><span style='color:#578c27'>筆/共</span><span style='color:#ffa500'>{1}</span><span style='color:#578c27'>筆</span>&#160;&#160;&#160;&#160;<span style='color:#578c27'>第</span><span style='color:#ffa500'>{2}</span><span style='color:#578c27'>頁/共</span><span style='color:#ffa500'>{3}</span><span style='color:#578c27'>頁</span>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;" />
                        <PagerStyle VerticalAlign="Middle" BorderStyle="None" BorderWidth="0px" HorizontalAlign="Left" CssClass="PagerStyle" />
                        <PagerSettings Mode="NumericFirstLast" FirstPageImageUrl="~/images/first.gif" FirstPageText="第一頁"
                            LastPageImageUrl="~/images/last.gif" LastPageText="最後一頁" NextPageImageUrl="~/images/next.gif"
                            NextPageText="下一頁" PreviousPageImageUrl="~/images/previous.gif" PreviousPageText="上一頁" />
                        <EmptyDataTemplate>
                            <div style="text-align: center;">無符合資料</div>
                        </EmptyDataTemplate>
                    </cc1:SmartGridView>








          </div><!-- container-xxl -->
        </div><!-- page-content-body -->
      </div><!-- flex-grow-1 -->
    <div id="page-content-footer" class="border-top w-100 text-center p-2 small footerbgcolor">
      版權所有© 2023 ITRI. 工業技術研究院著作
    </div><!-- page-content-footer -->
 
					</form>
 

</body>
<script src="js/mdb.min.js"></script><!-- bootstrap mdb5 -->
<script src="js/unitcommon.js"></script><!-- page common -->
</html>

