        <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DomingoRoof.aspx.cs" Inherits="Domingo_Roof_Works.JobCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Domingo Roof Works</title>
    <link href="stylesheet.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <asp:Button Text="Click here" runat="server" OnClick="Unnamed_Click"  />
        <asp:SqlDataSource ID="Job_Type_Selection" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [JOB_TYPE] FROM [JOB_TYPES]" ></asp:SqlDataSource>

        <asp:Label Text="Domingo Roof Works" runat="server" style="position:absolute; top: 17px; left: 367px; width: 492px;" Font-Size="50px"></asp:Label>

        <div style="position:absolute; top: 105px; left: 10px; height: 574px; width: 441px;" class="JobBorder">

            <asp:Label Text="Create New Job Card:" style="position:absolute; top: 29px; left: 110px;" runat="server" Font-Size="20pt" />
        <asp:TextBox ID="txtCustomerName" runat="server" style="position:absolute; top: 147px; left: 222px;"></asp:TextBox>
        <asp:TextBox ID="txtJobCardNo" runat="server" style="position:absolute; top: 102px; left: 223px;" MaxLength="5" TextMode="Number"></asp:TextBox>
        <asp:TextBox ID="txtNumDays" runat="server" TextMode="Number" style="position:absolute; top: 328px; left: 219px;"></asp:TextBox>
        <asp:TextBox ID="txtMaterials" runat="server" style="position:absolute; top: 276px; left: 218px;"></asp:TextBox>
        
            <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Add Job Card" style="position:absolute; left: 305px; top: 511px;"/>
        
            <asp:Button ID="BtnCloseJobCards" runat="server" OnClick="BtnCloseJobCards_Click" Text="CLOSE TABLE" style="position:absolute; left: 1016px; top: -53px;" Visible="False"/>
        
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

        <asp:Label ID="Label1" runat="server" Text="Assign Employee:" style="position:absolute; top: 420px; left: 47px; width: 127px; right: 267px;"></asp:Label>
            <asp:ListBox runat="server" style="position:absolute; top: 402px; left: 226px; width: 122px;" ID="EmployeeList" DataSourceID="EmployeeID" DataTextField="EMPLOYEE_ID" DataValueField="EMPLOYEE_ID">
               
            </asp:ListBox>
            <asp:SqlDataSource ID="EmployeeID" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [EMPLOYEE_ID] FROM [EMPLOYEES]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="AssignEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [EMPLOYEE_ID] FROM [EMPLOYEES]"></asp:SqlDataSource>
        </div>

        <div style="position:absolute; top: 1029px; left: 11px; width: 526px; height: 452px;" class="JobBorder">
             <asp:Label Text="Create and Retrieve Invoice:" style="position:absolute; top: 32px; left: 89px;" runat="server" Font-Size="20pt" ID="Label14" />
        <asp:Label ID="Label" runat="server" Text="Job Card Number: " style="position:absolute; top: 95px; left: 110px;"></asp:Label>
            <asp:TextBox ID="txtCardSearch" runat="server" style="position:absolute; top: 98px; left: 268px;" TextMode="Number" min="1"
      max="99999" onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;"></asp:TextBox>
        <asp:Label ID="lblMessageInvoice" runat="server" style="position:absolute; top: 138px; left: 149px;"></asp:Label>
            <asp:Button ID="BtnCreateInvoice" runat="server" OnClick="BtnCreateInvoice_Click" Text="Create Invoice" style="position:absolute; top: 192px; left: 107px; right: 292px;"/>
            <asp:Button ID="BtnRetrieveInvoice" runat="server" OnClick="BtnRetrieveInvoice_Click" Text="Retrieve Invoice" style="position:absolute; top: 193px; left: 261px;"/>
        <asp:ListBox runat="server" style="position:absolute; top: 235px; left: 11px; height: 212px; width: 473px;" ID="InvoiceList" Visible="False">
        </asp:ListBox>
        
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [MATERIALS_USED], [NO_OF_DAYS], [JOB_TYPE], [ADDRESS], [CUSTOMER], [JOB_CARD_NO] FROM [JOB_CARDS]"></asp:SqlDataSource>
        </div>



        <div style="position:absolute; top: 106px; left: 466px; width: 760px; height: 572px;" class="JobBorder">
             <asp:Label Text="Retrieve All Job Card:" style="position:absolute; top: 376px; left: 230px;" runat="server" Font-Size="20pt" ID="Label15" />
             <asp:Label Text="Retrieve Job Card:" style="position:absolute; top: 30px; left: 140px;" runat="server" Font-Size="20pt" ID="Label17" />
        <asp:Label ID="Label16" runat="server" Text="Job Card Number: " style="position:absolute; top: 95px; left: 110px;"></asp:Label>
            <asp:TextBox ID="txtJobCardSearch" runat="server" style="position:absolute; top: 98px; left: 268px;" TextMode="Number"></asp:TextBox>
        <asp:Label ID="lblJobCardMessage" runat="server" style="position:absolute; top: 151px; left: 266px;"></asp:Label>
            <asp:Button ID="BtnRetrieveCard" runat="server" OnClick="BtnRetrieveCard_Click" Text="Retrieve Invoice" style="position:absolute; top: 200px; left: 258px; height: 26px; width: 155px;"/>
            <asp:Button ID="BtnRetrieveAllCard" runat="server" OnClick="BtnAllRetrieveCard_Click" Text="Retrieve All Job cards" style="position:absolute; top: 460px; left: 292px; height: 26px; width: 155px;"/>
        <asp:ListBox runat="server" style="position:absolute; top: 240px; left: 33px; height: 113px; width: 715px;" ID="JobCardList">
        </asp:ListBox>
            <div style="position:absolute; top: 8px; left: 696px;"> <asp:ListView  ID="ListView1" runat="server" DataKeyNames="JOB_CARD_NO" DataSourceID="RetrieveAllJobCards" Visible="False">
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
                            <asp:Label ID="NO_OF_DAYSLabel" runat="server" Text='<%# Eval("NO_OF_DAYS") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MATERIALS_USEDLabel" runat="server" Text='<%# Eval("MATERIALS_USED") %>' />
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
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">JOB_CARD_NO</th>
                                        <th runat="server">CUSTOMER</th>
                                        <th runat="server">ADDRESS</th>
                                        <th runat="server">JOB_TYPE</th>
                                        <th runat="server">NO_OF_DAYS</th>
                                        <th runat="server">MATERIALS_USED</th>
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
            
        </div>


        <div style="position:absolute; top: 705px; left: 585px; width: 453px; height: 287px;" class="JobBorder">
        <asp:Label Text="Search for Employee:" style="position:absolute; top: 36px; left: 82px;" runat="server" Font-Size="20pt" />
        <asp:Label ID="Label13" runat="server" Text="Employee ID: Max 3 Numbers" style="position:absolute; top: 97px; left: 31px;"></asp:Label>
            <asp:TextBox ID="txtEmpSearch" runat="server" style="position:absolute; top: 96px; left: 233px;" TextMode="Number"  min="1"
    max="99999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>
        <asp:Label ID="lblEmpSearchMess" runat="server" style="position:absolute; top: 138px; left: 221px;"></asp:Label>
            <asp:Button ID="BtnSearchEmp" runat="server" OnClick="BtnSearchEmp_Click" Text="Search for Employee" style="position:absolute; top: 166px; left: 202px;"/>
        <asp:ListBox runat="server" style="position:absolute; top: 207px; left: 20px; height: 71px; width: 382px;" ID="EmpList">
        </asp:ListBox>
        </div>


        <div style="position:absolute; top: 707px; left: 13px; width: 529px; height: 281px;" class="JobBorder">
            <asp:Label Text="Create Employee ID/Update Employee Name:" style="position:absolute; top: 12px; left: 9px; width: 530px;" runat="server" Font-Size="20pt" />
        <asp:Label ID="lblEmpAdd" runat="server" Text="Employee ID: Max 3 Numbers" style="position:absolute; top: 96px; left: 9px; height: 22px; right: 294px;"></asp:Label>
        <asp:Label ID="Label12" runat="server" Text="Employee Full Name:" style="position:absolute; top: 134px; left: 27px;"></asp:Label>
            
            <asp:TextBox ID="txtEmpID" runat="server" style="position:absolute; top: 96px; left: 221px;" TextMode="Number"  min="1"
      max="99999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>

            <asp:TextBox ID="txtEmpName" runat="server" style="position:absolute; top: 132px; left: 220px;"></asp:TextBox>
        <asp:Label ID="lblEmpMessage" runat="server" style="position:absolute; top: 169px; left: 189px; bottom: 264px;"></asp:Label>
            <asp:Button ID="BtnCreateEmp" runat="server" OnClick="BtnCreateEmp_Click" Text="Create Employee" style="position:absolute; top: 220px; left: 41px;"/>
            <asp:Button ID="BtnUpdateEmpName" runat="server" OnClick="BtnUpdateEmpName_Click" Text="Update Employee Name" style="position:absolute; top: 217px; left: 295px; width: 159px;"/>
            </div>

        <div style="position:absolute; top: 1024px; left: 570px; height: 445px; width: 458px;" class="JobBorder">
            <asp:Label Text="Update Daily Rate:" style="position:absolute; top: 46px; left: 111px; width: 268px;" runat="server" Font-Size="20pt" ID="Label9" />
            <asp:TextBox ID="txtDailyRate" runat="server" style="position:absolute; top: 147px; left: 259px; right: 417px;"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Job Type:" style="position:absolute; top: 106px; left: 86px; right: 268px;"></asp:Label>
        <asp:Label ID="lblMessage" runat="server" style="position:absolute; top: 195px; left: 178px;"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="Daily Rate Change:" style="position:absolute; top: 149px; left: 62px;"></asp:Label>
        <asp:DropDownList ID="DropDownListJobType" runat="server" style="position:absolute; top: 110px; left: 260px; height: 17px; width: 137px; right: 61px;" DataSourceID="Job_Type_Populate" DataTextField="JOB_TYPE" DataValueField="JOB_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Job_Type_Populate" runat="server" ConnectionString="<%$ ConnectionStrings:Domingo_Roof_WorksConnectionString %>" SelectCommand="SELECT [JOB_TYPE] FROM [JOB_TYPES]"></asp:SqlDataSource>
        <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="Update Daily Rate" style="position:absolute; top: 242px; left: 135px;"/>
        
            
            <asp:ListBox runat="server" style="position:absolute; top: 300px; left: 20px; height: 123px; width: 405px;" ID="JobTypeList">
        </asp:ListBox>
        </div>


    </form>
</body>
</html>
