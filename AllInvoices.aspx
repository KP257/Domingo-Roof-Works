<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllInvoices.aspx.cs" Inherits="Domingo_Roof_Works.AllInvoices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Invoices</title>
    <link href="stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <p>

        <asp:Button class="button" style="position:absolute; top: 20px; left: 13px; height: 40px; width: 118px;" Text="Home" runat="server" ID="Button1" OnClick="btnHome" />
        
        </p>
        
        <div style="position:absolute; top: 89px; left: 31px;"> <asp:ListView  ID="ListView1" runat="server" DataSourceID="RetrieveAllInvoices">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="JOB_CARD_NOLabel" runat="server" Text='<%# Eval("JOB_CARD_NO") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CUSTOMERLabel" runat="server" Text='<%# Eval("CUSTOMER") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Eval("ADDRESS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="JOB_TYPELabel" runat="server" Text='<%# Eval("JOB_TYPE") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EMPLOYEES_ALLOCATEDLabel" runat="server" Text='<%# Eval("EMPLOYEES_ALLOCATED") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DAILY_RATELabel" runat="server" Text='<%# Eval("DAILY_RATE") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Eval("SUBTOTAL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="VATLabel" runat="server" Text='<%# Eval("VAT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TOTALLabel" runat="server" Text='<%# Eval("TOTAL") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="JOB_CARD_NOTextBox" runat="server" Text='<%# Bind("JOB_CARD_NO") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CUSTOMERTextBox" runat="server" Text='<%# Bind("CUSTOMER") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="JOB_TYPETextBox" runat="server" Text='<%# Bind("JOB_TYPE") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EMPLOYEES_ALLOCATEDTextBox" runat="server" Text='<%# Bind("EMPLOYEES_ALLOCATED") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MATERIALS_USEDTextBox" runat="server" Text='<%# Bind("MATERIALS_USED") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DAILY_RATETextBox" runat="server" Text='<%# Bind("DAILY_RATE") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NO_OF_DAYSTextBox" runat="server" Text='<%# Bind("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SUBTOTALTextBox" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="VATTextBox" runat="server" Text='<%# Bind("VAT") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TOTALTextBox" runat="server" Text='<%# Bind("TOTAL") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="JOB_CARD_NOTextBox" runat="server" Text='<%# Bind("JOB_CARD_NO") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CUSTOMERTextBox" runat="server" Text='<%# Bind("CUSTOMER") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="JOB_TYPETextBox" runat="server" Text='<%# Bind("JOB_TYPE") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EMPLOYEES_ALLOCATEDTextBox" runat="server" Text='<%# Bind("EMPLOYEES_ALLOCATED") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MATERIALS_USEDTextBox" runat="server" Text='<%# Bind("MATERIALS_USED") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DAILY_RATETextBox" runat="server" Text='<%# Bind("DAILY_RATE") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NO_OF_DAYSTextBox" runat="server" Text='<%# Bind("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SUBTOTALTextBox" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="VATTextBox" runat="server" Text='<%# Bind("VAT") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TOTALTextBox" runat="server" Text='<%# Bind("TOTAL") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="JOB_CARD_NOLabel" runat="server" Text='<%# Eval("JOB_CARD_NO") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CUSTOMERLabel" runat="server" Text='<%# Eval("CUSTOMER") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Eval("ADDRESS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="JOB_TYPELabel" runat="server" Text='<%# Eval("JOB_TYPE") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EMPLOYEES_ALLOCATEDLabel" runat="server" Text='<%# Eval("EMPLOYEES_ALLOCATED") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DAILY_RATELabel" runat="server" Text='<%# Eval("DAILY_RATE") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Eval("SUBTOTAL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="VATLabel" runat="server" Text='<%# Eval("VAT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TOTALLabel" runat="server" Text='<%# Eval("TOTAL") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">JOB_CARD_NO</th>
                                        <th runat="server">CUSTOMER</th>
                                        <th runat="server">ADDRESS</th>
                                        <th runat="server">JOB_TYPE</th>
                                        <th runat="server">EMPLOYEES_ALLOCATED</th>
                                        <th runat="server">MATERIALS_USED</th>
                                        <th runat="server">DAILY_RATE</th>
                                        <th runat="server">NO_OF_DAYS</th>
                                        <th runat="server">SUBTOTAL</th>
                                        <th runat="server">VAT</th>
                                        <th runat="server">TOTAL</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                        <td>
                            <asp:Label ID="JOB_CARD_NOLabel" runat="server" Text='<%# Eval("JOB_CARD_NO") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CUSTOMERLabel" runat="server" Text='<%# Eval("CUSTOMER") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Eval("ADDRESS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="JOB_TYPELabel" runat="server" Text='<%# Eval("JOB_TYPE") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EMPLOYEES_ALLOCATEDLabel" runat="server" Text='<%# Eval("EMPLOYEES_ALLOCATED") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DAILY_RATELabel" runat="server" Text='<%# Eval("DAILY_RATE") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Eval("SUBTOTAL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="VATLabel" runat="server" Text='<%# Eval("VAT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TOTALLabel" runat="server" Text='<%# Eval("TOTAL") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
             </asp:ListView>
                <asp:SqlDataSource ID="RetrieveAllInvoices" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT * FROM [INVOICE]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="RetrieveAllJobCards" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT * FROM [JOB_CARDS]"></asp:SqlDataSource>
             </div>
        <p>

        <asp:Label Text="Domingo Roof Works Invoices:" runat="server" style="position:absolute; top: 17px; left: 191px; width: 668px;" Font-Size="50px" ID="Label17"></asp:Label>

        </p>
        
    </form>
</body>
</html>
