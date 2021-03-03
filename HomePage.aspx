<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Domingo_Roof_Works.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div  style="position:absolute; top: 187px; left: 389px; width: 510px; height: 325px;">
        
        <nav>
  <ul>
    <li>
      <a href="JobCard.aspx" style="text-decoration:none;">Create or Retrieve a Job Card </a>
      <span></span><span></span><span></span><span></span>
    </li>
    <li>
        <a href="Employee.aspx" style="text-decoration:none;">Create, update or retrieve employee details </a>
      <span></span><span></span><span></span><span></span>
    </li>
    <li>
      <a href="Invoices.aspx" style="text-decoration:none;">Create or retrieve an invoice </a>
      <span></span><span></span><span></span><span></span>
    </li>
    <li>
      <a href="DailyRate.aspx" style="text-decoration:none;">Update the daily Rate </a>
      <span></span><span></span><span></span><span></span>
    </li>
  </ul>
</nav>

        </div>
        <p>

        <asp:Label Text="Domingo Roof Works" runat="server" style="position:absolute; top: 45px; left: 430px; width: 492px;"  Font-Size="50px" ID="Label1" ForeColor="#0000CC"></asp:Label>

        </p>
    </form>
</body>
</html>
