<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyRate.aspx.cs" Inherits="Domingo_Roof_Works.DailyRate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Daily Rate Update</title>
    <link href="stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="position:absolute; top: 95px; left: 359px; height: 445px; width: 458px;" class="JobBorder">
            <asp:Label Text="Update Daily Rate:" style="position:absolute; top: 46px; left: 111px; width: 268px;" runat="server" Font-Size="20pt" ID="Label9" />
            <asp:TextBox ID="txtDailyRate" runat="server" style="position:absolute; top: 147px; left: 259px; right: 417px;"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Job Type:" style="position:absolute; top: 106px; left: 86px; right: 268px;"></asp:Label>
        <asp:Label ID="lblMessage" runat="server" style="position:absolute; top: 195px; left: 178px;"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="Daily Rate Change:" style="position:absolute; top: 149px; left: 62px;"></asp:Label>
        <asp:DropDownList ID="DropDownListJobType" runat="server" style="position:absolute; top: 110px; left: 260px; height: 17px; width: 137px; right: 61px;" DataSourceID="Job_Type_Populate" DataTextField="JOB_TYPE" DataValueField="JOB_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Job_Type_Populate" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [JOB_TYPE] FROM [JOB_TYPES]"></asp:SqlDataSource>
        <asp:Button class="button" ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="Update Daily Rate" style="position:absolute; top: 242px; left: 137px;"/>
        
            
        <asp:Button class="button" ID="BtnHome" runat="server" OnClick="BtnHome_Click" Text="Home" style="position:absolute; top: -74px; left: -335px; width: 141px;"/>
        
            
            <asp:ListBox runat="server" style="position:absolute; top: 300px; left: 20px; height: 123px; width: 405px;" ID="JobTypeList">
        </asp:ListBox>
        </div>
        <p>

        <asp:Label Text="Domingo Roof Works Daily Rate:" runat="server" style="position:absolute; top: 18px; left: 230px; width: 690px;" Font-Size="50px" ID="Label10"></asp:Label>

        </p>
    </form>
</body>
</html>
