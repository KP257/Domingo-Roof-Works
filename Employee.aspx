<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Domingo_Roof_Works.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Details</title>
     <link href="stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label Text="Domingo Roof Works Employees" runat="server" style="position:absolute; top: 17px; left: 161px; width: 698px;" Font-Size="50px"></asp:Label>
       
        <!--Create Employee HTML -->
        <div style="position:absolute; top: 100px; left: 26px; width: 529px; height: 281px;" class="JobBorder">
            <asp:Label Text="Create Employee:" style="position:absolute; top: 25px; left: 114px; width: 233px;" runat="server" Font-Size="20pt" ID="Label13" />
        <asp:Label ID="lblEmpAdd" runat="server" Text="Employee ID: Max 3 Numbers" style="position:absolute; top: 96px; left: 9px; height: 22px; right: 294px;"></asp:Label>
        <asp:Label ID="Label12" runat="server" Text="Employee Full Name:" style="position:absolute; top: 134px; left: 27px;"></asp:Label>
            
            

            

            <asp:TextBox ID="txtEmpID" runat="server" style="position:absolute; top: 96px; left: 221px;" TextMode="Number"  min="1"
      max="99999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>

            <asp:TextBox ID="txtEmpName" runat="server" style="position:absolute; top: 132px; left: 220px;"></asp:TextBox>
        <asp:Label ID="lblEmpMessage" runat="server" style="position:absolute; top: 169px; left: 189px; bottom: 264px;"></asp:Label>
            <asp:Button class="button" ID="BtnCreateEmp" runat="server" OnClick="BtnHome_Click" Text="Home" style="position:absolute; top: -78px; left: 8px; right: 438px; height: 29px;"/>
            <asp:Button class="button" ID="BtnCreateEmp0" runat="server" OnClick="BtnCreateEmp_Click" Text="Create Employee" style="position:absolute; top: 218px; left: 106px; right: 186px; height: 33px;"/>
            
            
            </div>

        <!--Update and Delete Employee HTML -->
        <div style="position:absolute; top: 100px; left: 578px; width: 722px; height: 281px;" class="JobBorder">
            <asp:Label Text="Update Employee Name:" style="position:absolute; top: 22px; left: 137px; width: 300px;" runat="server" Font-Size="20pt" ID="Label14" />
        <asp:Label ID="lblEmpAdd0" runat="server" Text="Employee ID:" style="position:absolute; top: 96px; left: 37px; height: 22px; "></asp:Label>
        <asp:Label ID="lblEmpAdd1" runat="server" Text="Employee ID:" style="position:absolute; top: 116px; left: 373px; height: 22px; right: 242px;"></asp:Label>
        <asp:Label ID="Label15" runat="server" Text="Change Name to:" style="position:absolute; top: 134px; left: 27px;"></asp:Label>
           
            <asp:TextBox ID="txtEmpIDUpdate" runat="server" style="position:absolute; top: 92px; left: 164px;" TextMode="Number"  min="1"
      max="99999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>
           
            <asp:TextBox ID="txtEmpNewName" runat="server" style="position:absolute; top: 132px; left: 164px;"></asp:TextBox>
            <asp:TextBox ID="txtEmpIDDelete" runat="server" style="position:absolute; top: 116px; left: 490px;" TextMode="Number"  min="1"
      max="99999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>
        <asp:Label ID="lblEmpMessage1" runat="server" style="position:absolute; top: 169px; left: 189px; bottom: 264px;"></asp:Label>
            <asp:Button class="button" ID="BtnUpdateEmpName" runat="server" OnClick="BtnUpdateEmpName_Click" Text="Update Employee Name" style="position:absolute; top: 214px; left: 27px;"/>
        <asp:Button class="button" ID="BtnUpdateEmpName1" runat="server" OnClick="BtnDeleteEmpName_Click" Text="Delete Employee" style="position:absolute; top: 215px; left: 386px;"/>
            <asp:Label style="position:absolute; top: 170px; left: 435px;" ID="lblEmpMessage2" s Text="" runat="server" />
        </div>

        <!--Search for Employee HTML -->
        <div style="position:absolute; top: 420px; left: 382px; width: 453px; height: 321px;" class="JobBorder">
        <asp:Label Text="Search for Employee:" style="position:absolute; top: 36px; left: 82px;" runat="server" Font-Size="20pt" />
        <asp:Label ID="Label1" runat="server" Text="Employee ID: Max 3 Numbers" style="position:absolute; top: 97px; left: 31px;"></asp:Label>
            <asp:TextBox ID="txtEmpSearch" runat="server" style="position:absolute; top: 96px; left: 233px;" TextMode="Number"  min="1"
    max="99999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>
        <asp:Label ID="lblEmpSearchMess" runat="server" style="position:absolute; top: 135px; left: 139px;"></asp:Label>
            <asp:Button Class="button" ID="BtnSearchEmp" runat="server" OnClick="BtnSearchEmp_Click" Text="Search for Employee" style="position:absolute; top: 172px; left: 90px; height: 30px; width: 235px;"/>
        <asp:ListBox runat="server" style="position:absolute; top: 226px; left: 30px; height: 71px; width: 382px;" ID="EmpList">
        </asp:ListBox>
        </div>

    </form>
</body>
</html>
