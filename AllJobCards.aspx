<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllJobCards.aspx.cs" Inherits="Domingo_Roof_Works.AllJobCards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="stylesheet.css" rel="stylesheet" />
    <title> All Job Cards</title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="position:absolute; top: 99px; left: 10px;"> 
            <asp:ListView  ID="ListView1" runat="server" DataKeyNames="JOB_CARD_NO" DataSourceID="RetrieveAllJobCards">
            
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFF8DC;">
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
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #008A8C; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="JOB_CARD_NOLabel1" runat="server" Text='<%# Eval("JOB_CARD_NO") %>' />
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
                            <asp:TextBox ID="NO_OF_DAYSTextBox" runat="server" Text='<%# Bind("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MATERIALS_USEDTextBox" runat="server" Text='<%# Bind("MATERIALS_USED") %>' />
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
                            <asp:TextBox ID="NO_OF_DAYSTextBox" runat="server" Text='<%# Bind("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MATERIALS_USEDTextBox" runat="server" Text='<%# Bind("MATERIALS_USED") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #DCDCDC; color: #000000;">
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
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">JOB_CARD_NO</th>
                                        <th runat="server">CUSTOMER</th>
                                        <th runat="server">ADDRESS</th>
                                        <th runat="server">JOB_TYPE</th>
                                        <th runat="server">NO_OF_DAYS</th>
                                        <th runat="server">MATERIALS_USED</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">
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
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
             </asp:ListView>
                <asp:SqlDataSource ID="RetrieveAllJobCards" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT * FROM [JOB_CARDS]"></asp:SqlDataSource>
             </div>
        <asp:Label ID="Label1" runat="server" Font-Size="50px" style="position:absolute; top: 26px; left: 183px; width: 682px;" Text="All Job Cards at DomingoRoof"></asp:Label>
        
        <asp:Button class="button" ID="Button7" runat="server" OnClick="BtnHome_Click" Text="Home" style="position:absolute; top: 35px; left: 30px; width: 100px;"/>
    </form>
</body>
</html>
