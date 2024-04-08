<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfcompno" runat="server" />
            <asp:HiddenField ID="hfempno" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:70783499_CS %>" 
                    SelectCommand="spZZ_COMMON_GETKEY" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter Name="COMPANY_SNO" ControlID="hfcompno" Type="String" />
                    <asp:ControlParameter Name="EMPLOYEE_NO" ControlID="hfempno" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <iframe id="iframeEP" runat="server" width="100%"></iframe>
        </div>
    </form>
</body>
</html>
