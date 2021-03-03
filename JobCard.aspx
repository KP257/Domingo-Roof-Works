<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobCard.aspx.cs" Inherits="Domingo_Roof_Works.JobCard1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Card Details</title>
    <link href="stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="Job_Type_Selection" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [JOB_TYPE] FROM [JOB_TYPES]" ></asp:SqlDataSource>
       <div style="position:absolute; top: 109px; left: 39px; height: 574px; width: 441px;" class="JobBorder">

            <asp:Label Text="Create New Job Card:" style="position:absolute; top: 29px; left: 110px;" runat="server" Font-Size="20pt" />
        <asp:TextBox ID="txtCustomerName" runat="server" style="position:absolute; top: 147px; left: 222px;"></asp:TextBox>
        <asp:TextBox ID="txtJobCardNo" runat="server" style="position:absolute; top: 102px; left: 223px;" MaxLength="5" TextMode="Number"></asp:TextBox>
        <asp:TextBox ID="txtNumDays" runat="server" TextMode="Number" style="position:absolute; top: 328px; left: 219px;"></asp:TextBox>
        <asp:TextBox ID="txtMaterials" runat="server" style="position:absolute; top: 276px; left: 218px;"></asp:TextBox>
        
            <asp:Button class="button" ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Add Job Card" style="position:absolute; left: 128px; top: 513px; height: 40px; width: 191px;"/>
        
            <asp:Button class="button" ID="BtnHome" runat="server" OnClick="BtnHome_Click" Text="Home" style="position:absolute; left: -31px; top: -77px; height: 40px; width: 121px;"/>
        
            <asp:TextBox ID="txtAddress" runat="server" style="position:absolute; top: 187px; left: 177px; height: 57px; width: 202px; bottom: 313px;" MaxLength="100"></asp:TextBox>
        
        <asp:DropDownList ID="DropJobType" runat="server" DataSourceID="Job_Type_Selection" DataTextField="JOB_TYPE" DataValueField="JOB_TYPE" style="position:absolute; top: 371px; left: 209px; height: 17px; width: 149px;">
        </asp:DropDownList>

        <asp:Label ID="Label10" runat="server" Text="Customer Full Name:" style="position:absolute; top: 149px; left: 59px;"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="Job Card Number: " style="position:absolute; top: 103px; left: 75px; right: 236px;"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Address:" style="position:absolute; top: 204px; left: 101px; bottom: 340px;"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Materials:" style="position:absolute; top: 280px; left: 102px;"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="Number Of Days:" style="position:absolute; top: 327px; left: 75px;"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text="Job Type:" style="position:absolute; top: 373px; left: 98px;"></asp:Label>
        <asp:Label ID="lblMessageOne" runat="server" style="position:absolute; top: 478px; left: 151px; width: 187px;"></asp:Label>

        <asp:Label ID="Label1" runat="server" Text="Assign Employee: Select One!" style="position:absolute; top: 424px; left: 28px; width: 191px; right: 222px;"></asp:Label>
            <asp:ListBox runat="server" style="position:absolute; top: 402px; left: 226px; width: 122px;" ID="EmployeeList" DataSourceID="EmployeeID" DataTextField="EMPLOYEE_ID" DataValueField="EMPLOYEE_ID">
               
            </asp:ListBox>
            <asp:SqlDataSource ID="EmployeeID" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [EMPLOYEE_ID] FROM [EMPLOYEES]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="AssignEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [EMPLOYEE_ID] FROM [EMPLOYEES]"></asp:SqlDataSource>
        </div>


        <div style="position:absolute; top: 108px; left: 533px; width: 760px; height: 572px;" class="JobBorder">
             <asp:Label Text="Click to Retrieve all job cards:" style="position:absolute; top: 433px; left: 36px; height: 31px; width: 331px;" runat="server" Font-Size="20pt" ID="Label15" />
             <asp:Label Text="Retrieve Job Card:" style="position:absolute; top: 45px; left: 143px;" runat="server" Font-Size="20pt" ID="Label17" />
        <asp:Label ID="Label16" runat="server" Text="Job Card Number: " style="position:absolute; top: 111px; left: 104px;"></asp:Label>
            <asp:TextBox ID="txtJobCardSearch" runat="server" style="position:absolute; top: 109px; left: 268px;" TextMode="Number"></asp:TextBox>
        <asp:Label ID="lblJobCardMessage" runat="server" style="position:absolute; top: 151px; left: 266px;"></asp:Label>
            <asp:Button Class="button" ID="BtnRetrieveCard" runat="server" OnClick="BtnRetrieveCard_Click" Text="Retrieve Invoice" style="position:absolute; top: 178px; left: 215px; height: 39px; width: 222px;"/>
            <asp:Button Class="button" ID="BtnRetrieveAllCard" runat="server" OnClick="BtnAllRetrieveCard_Click" Text="Retrieve All Job cards" style="position:absolute; top: 423px; left: 403px; height: 44px; width: 305px;"/>
        <asp:ListBox runat="server" style="position:absolute; top: 240px; left: 29px; height: 113px; width: 715px;" ID="JobCardList">
        </asp:ListBox>
            
            
        </div>

        <p>

        <asp:Label Text="Domingo Roof Works Job Cards:" runat="server" style="position:absolute; top: 28px; left: 280px; width: 690px;" Font-Size="50px" ID="Label18"></asp:Label>

        </p>

    </form>
</body>
</html>
