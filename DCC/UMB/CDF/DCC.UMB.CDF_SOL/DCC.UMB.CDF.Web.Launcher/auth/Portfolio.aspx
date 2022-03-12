<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="DCC.UMB.CDF.Web.Launcher.auth.Portfolio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left:100px; margin-top:100px ">
   
    <asp:GridView ID="grdPortfolio" runat="server" BackColor="White" BorderColor="#E7E7FF"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="false"
        OnRowCommand="grdPortfolio_RowCommand">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:TemplateField HeaderText="Package" ControlStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblPackageId" runat="server" Text='<%# GetPackageId(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Application" ControlStyle-Width="300" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblApplicationNm" runat="server" Text='<%# GetApplicationName(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role" ControlStyle-Width="150" ItemStyle-HorizontalAlign="Center" >
                <ItemTemplate>
                    <asp:Label ID="lblRole" runat="server" Text='<%# GetApplicationRole(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Launch" ControlStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkApp" runat="server" Text="Launch" CommandName="Launch App"
                        CommandArgument="<%# CreateCommandArgument(Container.DataItem) %>"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
     </div>
    </form>
</body>
</html>
