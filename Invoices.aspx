<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoices.aspx.cs" Inherits="Domingo_Roof_Works.Invoices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoices</title>
    <link href="stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button class="button" ID="BtnHome" runat="server" OnClick="BtnHome_Click" Text="Home" style="position:absolute; top: 21px; left: 47px;"/>
       <div style="position:absolute; top: 101px; left: 34px; width: 526px; height: 258px;" class="JobBorder">
             <asp:Label Text="Create Invoice:" style="position:absolute; top: 32px; left: 166px;" runat="server" Font-Size="20pt" ID="Label14" />
        <asp:Label ID="Label" runat="server" Text="Job Card Number: " style="position:absolute; top: 95px; left: 110px;"></asp:Label>
            <asp:TextBox ID="txtCardCreate" runat="server" style="position:absolute; top: 92px; left: 268px;" TextMode="Number" min="1"
      max="99999" onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;"></asp:TextBox>
        <asp:Label ID="lblMessageInvoice" runat="server" style="position:absolute; top: 140px; left: 149px;"></asp:Label>
            <asp:Button class="button" ID="BtnCreateInvoice" runat="server" OnClick="BtnCreateInvoice_Click" Text="Create Invoice" style="position:absolute; top: 187px; left: 154px; right: 175px;"/>
            <asp:Button class="button" ID="BtnFetchInvoices" runat="server" OnClick="BtnFetchInvoice_Click" Text="Retrieve All Invoices" style="position:absolute; top: 334px; left: 108px; right: 147px;"/>
            
        </div>

       <div style="position:absolute; top: 102px; left: 592px; width: 526px; height: 452px;" class="JobBorder">
           <asp:Button class="button" ID="BtnFetchInvoices0" runat="server" OnClick="BtnRetrieveInvoice_Click" Text="Retrieve Invoice:" style="position:absolute; top: 177px; left: 154px; right: 146px;"/>  
           <asp:Label Text="Retrieve An Invoice:" style="position:absolute; top: 35px; left: 166px;" runat="server" Font-Size="20pt" ID="Label15" />
        <asp:Label ID="Label16" runat="server" Text="Job Card Number: " style="position:absolute; top: 95px; left: 110px;"></asp:Label>
            <asp:TextBox ID="txtCardSearch" runat="server" style="position:absolute; top: 95px; left: 268px;" TextMode="Number" min="1"
      max="99999" onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;"></asp:TextBox>
        <asp:Label ID="lblMessageInvoice1" runat="server" style="position:absolute; top: 138px; left: 149px;"></asp:Label>
        <asp:ListBox runat="server" style="position:absolute; top: 227px; left: 11px; height: 212px; width: 492px;" ID="InvoiceList">
        </asp:ListBox>
        
        </div>
        <p>

        <asp:Label Text="Domingo Roof Works Invoices:" runat="server" style="position:absolute; top: 17px; left: 191px; width: 668px;" Font-Size="50px" ID="Label17"></asp:Label>

        </p>
    </form>
</body>
</html>
