using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Domingo_Roof_Works
{
    // Most buttons below either create,retrieve or update tables on the Azure storage database
    // Some buttons may fetch and compare data then update or retrieve, others may just create
    // All buttons have an exception handler incase an unknowen error is thrown
    // Connectionstring is decared at the beginning
    // Retrieved values are recieved into listboxes
    // If no values are returned or a success or error message is not shown then the value does not exist


    public partial class JobCard : System.Web.UI.Page
    {
        //Connection string
        string conString = "Data Source=sebastiansdatabase.database.windows.net;Initial Catalog=Domingo_Roof_Works;User ID=admin57340;Password=kPD57340;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        // create and retrieve Job card
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string empName = EmployeeList.SelectedItem.ToString();

            SqlConnection connection = new SqlConnection(conString);
            connection.Open();

            try
            {
                //inserts new job card details into job card table
                using (var command = new SqlCommand(@"INSERT INTO JOB_CARDS (JOB_CARD_NO, CUSTOMER, ADDRESS, JOB_TYPE, NO_OF_DAYS, MATERIALS_USED) VALUES (@JOB_CARD_NO, @CUSTOMER, @ADDRESS, @JOB_TYPE, @NO_OF_DAYS, @MATERIALS_USED)", connection))
                {
                    command.Parameters.Add("@JOB_CARD_NO", SqlDbType.Int).Value = txtJobCardNo.Text;
                    command.Parameters.Add("@CUSTOMER", SqlDbType.VarChar).Value = txtCustomerName.Text;
                    command.Parameters.Add("@ADDRESS", SqlDbType.VarChar).Value = txtAddress.Text;
                    command.Parameters.Add("@JOB_TYPE", SqlDbType.VarChar).Value = DropJobType.Text;
                    command.Parameters.Add("@NO_OF_DAYS", SqlDbType.Int).Value = txtNumDays.Text;
                    command.Parameters.Add("@MATERIALS_USED", SqlDbType.VarChar).Value = txtMaterials.Text;
                    command.ExecuteNonQuery();
                }
                using (var cmd = new SqlCommand(@"INSERT INTO JOB_CARD_ASSIGNED VALUES(@JOB_CARD_NO, @EMPLOYEE_ID)", connection))
                {

                    cmd.Parameters.Add("@JOB_CARD_NO", SqlDbType.Int).Value = txtJobCardNo.Text;
                    cmd.Parameters.Add("@EMPLOYEE_ID", SqlDbType.VarChar).Value = empName;
                    cmd.ExecuteNonQuery();

                }
                lblMessageOne.Text = "Job Card Created!";
                connection.Close();

                //clears textboxes
                txtJobCardNo.Text = string.Empty;
                txtCustomerName.Text = string.Empty;
                txtAddress.Text = string.Empty;
                txtMaterials.Text = string.Empty;
                txtNumDays.Text = string.Empty;
            }
            //catch any exceptions
            catch (Exception)
            {
                lblMessageOne.Text = "Please check that all the textboxes are not empty";
            }
        }

        protected void BtnRetrieveCard_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(conString);
            //Clears invoice box to allow for new entry
            JobCardList.Items.Clear();

            connection.Open();
            try
            {
                using (var cmd = new SqlCommand(@"SELECT * FROM JOB_CARDS WHERE JOB_CARD_NO = @JOB_CARD_NO", connection))
                {
                    cmd.Parameters.AddWithValue("@JOB_CARD_NO", txtJobCardSearch.Text);

                    DataTable dataTable = new DataTable();
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                    dataAdapter.Fill(dataTable);
                        
                    //populates rows into a listbox
                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        // writes all to listbox
                        JobCardList.Items.Add("Job Card Number: " + dataRow["JOB_CARD_NO"].ToString());
                        JobCardList.Items.Add("Customer: " + dataRow["CUSTOMER"].ToString());
                        JobCardList.Items.Add("Address: " + dataRow["ADDRESS"].ToString());
                        JobCardList.Items.Add("Job Type: " + dataRow["JOB_TYPE"].ToString());
                        JobCardList.Items.Add("Days: " + dataRow["NO_OF_DAYS"].ToString());
                        JobCardList.Items.Add("Materials: " + dataRow["MATERIALS_USED"].ToString());
                    }
                    if (JobCardList.Items.Count == 0)
                    {
                        lblJobCardMessage.Text = "Job card number does not exist!";
                    }
                    else
                    {
                        lblJobCardMessage.Text = "FOUND!";
                    }
                   
                }
                connection.Close();

            }
            catch (Exception)
            {
                lblJobCardMessage.Text = "Job card number does not exist";
            }
        }





        // Create, update and retrieve employee
        protected void BtnCreateEmp_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            try
            {
                //inserts employee details in employee table 
                using (var cmd = new SqlCommand(@"INSERT INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_NAME) VALUES (@EMPLOYEE_ID, @EMPLOYEE_NAME)", connection))
                {
                    cmd.Parameters.Add("@EMPLOYEE_ID", SqlDbType.VarChar).Value = "EMP"+ txtEmpID.Text;
                    cmd.Parameters.Add("@EMPLOYEE_NAME", SqlDbType.VarChar).Value = txtEmpName.Text;
                    
                    cmd.ExecuteNonQuery();
                }
                lblEmpMessage.Text = "New Employee has been created";
                connection.Close();
            }
            catch (Exception)
            {
                lblEmpMessage.Text = "Please check that all the textboxes are not empty";
            }
        }
        protected void BtnUpdateEmpName_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();

            try
            {
                //updates employee details
                using (var command = new SqlCommand(@"UPDATE EMPLOYEES SET EMPLOYEE_NAME = @EMPLOYEE_NAME WHERE EMPLOYEE_ID = @EMPLOYEE_ID", con))
                {
                    command.Parameters.AddWithValue("@EMPLOYEE_ID", "EMP" + txtEmpID.Text);

                    command.Parameters.Add("@EMPLOYEE_NAME", SqlDbType.VarChar).Value =  txtEmpName.Text;
                    command.ExecuteNonQuery();
                }
                lblEmpMessage.Text = "UPDATED!";
                con.Close();
            }
            catch (Exception)
            {
                lblEmpMessage.Text = "Not UPDATED! Does not exist or please check for empty text boxes";
            }
        }
        protected void BtnSearchEmp_Click(object sender, EventArgs e)
        {
            //Clears invoice box to allow for new entry
            EmpList.Items.Clear();

            SqlConnection con = new SqlConnection(conString);
            con.Open();

            try
            {
                using (var cmd = new SqlCommand(@"SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = @EMPLOYEE_ID", con))
                {
                    cmd.Parameters.AddWithValue("@EMPLOYEE_ID", "EMP" + txtEmpSearch.Text);

                    DataTable dt = new DataTable();
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(dt);

                    //populates rows into a listbox
                    foreach (DataRow dr in dt.Rows)
                    {
                        // writes all to listbox
                        EmpList.Items.Add("EMPLOYEE_ID: " + dr["EMPLOYEE_ID"].ToString());
                        EmpList.Items.Add("EMPLOYEE_NAME: " + dr["EMPLOYEE_NAME"].ToString());
                    }
                    if (EmpList.Items.Count == 0)
                    {
                        lblEmpSearchMess.Text = "Not FOUND!";
                    }
                    else
                    {
                        lblEmpSearchMess.Text = "Found!";
                    }
                    con.Close();
                }
            }
            catch (Exception)
            {
                lblEmpSearchMess.Text = "Not FOUND, Employee ID does not exist or the textbox is empty";
            }    
                
        }

        // Create and Retrieve invoice
        protected void BtnCreateInvoice_Click(object sender, EventArgs e)
        {
            //Clears invoice box to allow for new entry
            InvoiceList.Items.Clear();

            SqlConnection con = new SqlConnection(conString);
            con.Open();
            try
            {
                using (var cmd = new SqlCommand(@"insert into INVOICE(JOB_CARD_NO, J.CUSTOMER, J.[ADDRESS],EMPLOYEES_ALLOCATED, J.MATERIALS_USED, JOB_TYPE,DAILY_RATE,NO_OF_DAYS,SUBTOTAL,VAT,TOTAL) SELECT J.JOB_CARD_NO,J.CUSTOMER,J.[ADDRESS], EMPLOYEES_ALLOCATED=STUFF((SELECT distinct CONCAT(' ',E.EMPLOYEE_ID,' ', E.EMPLOYEE_NAME, ', ')FROM JOB_CARD_ASSIGNED J, EMPLOYEES E WHERE J.EMPLOYEE_ID = E.EMPLOYEE_ID AND J.JOB_CARD_NO = @FindTotal FOR XMl PATH('')),1,1,''), J.MATERIALS_USED, JT.JOB_TYPE AS JOB_TYPE,CONCAT('R',JT.DAILY_RATE) AS DAILY_RATE, J.NO_OF_DAYS, CONCAT('R',(J.NO_OF_DAYS * JT.DAILY_RATE)) AS SUBTOTAL, CONCAT('R',(0.14) * (J.NO_OF_DAYS * JT.DAILY_RATE)) AS VAT, CONCAT('R',(0.14) * (J.NO_OF_DAYS * JT.DAILY_RATE) + (J.NO_OF_DAYS * JT.DAILY_RATE)) AS TOTAL FROM JOB_TYPES JT, JOB_CARDS J WHERE JT.JOB_TYPE = J.JOB_TYPE AND J.JOB_CARD_NO = @FindTotal;", con))
                {
                    cmd.Parameters.AddWithValue("@FindTotal", txtCardSearch.Text);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
                lblMessageInvoice.Text = "Invoice was created and saved!";
            }
            catch (Exception)
            {
                lblMessageInvoice.Text = "Job Card does not exist!";
            }
               

        }
        protected void BtnRetrieveInvoice_Click(object sender, EventArgs e)
        {
            //Clears invoice box to allow for new entry
            InvoiceList.Items.Clear();
            //Message
            lblMessageInvoice.Visible = false;
            InvoiceList.Visible = true;
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            try
            {
                using (var cmd = new SqlCommand(@"SELECT * FROM INVOICE WHERE JOB_CARD_NO = @JOB_CARD_NO", con))
                {
                    cmd.Parameters.AddWithValue("@JOB_CARD_NO", txtCardSearch.Text);

                    DataTable dataTables = new DataTable();
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(dataTables);

                    //populates rows into a listbox
                    foreach (DataRow dataRow in dataTables.Rows)
                    {
                        // writes all to listbox
                        InvoiceList.Items.Add("INVOICE COSTS:");

                        InvoiceList.Items.Add("Job Card Number: " + dataRow["JOB_CARD_NO"].ToString());
                        InvoiceList.Items.Add("Customer: " + dataRow["CUSTOMER"].ToString());
                        InvoiceList.Items.Add("Address: " + dataRow["ADDRESS"].ToString());
                        InvoiceList.Items.Add("Job Type: " + dataRow["JOB_TYPE"].ToString());
                        InvoiceList.Items.Add("Employees Allocated: " + dataRow["EMPLOYEES_ALLOCATED"].ToString());
                        InvoiceList.Items.Add("Materials_Used: " + dataRow["MATERIALS_USED"].ToString());
                        InvoiceList.Items.Add("Rate: " + dataRow["DAILY_RATE"].ToString());
                        InvoiceList.Items.Add("No.of days: " + dataRow["NO_OF_DAYS"].ToString());
                        InvoiceList.Items.Add("Subtotal: " + dataRow["SUBTOTAL"].ToString());
                        InvoiceList.Items.Add("Vat: " + dataRow["VAT"].ToString());
                        InvoiceList.Items.Add("Total: " + dataRow["TOTAL"].ToString());

                        InvoiceList.Items.Add("\n");
                    }
                    if (InvoiceList.Items.Count == 0)
                    {
                        lblMessageInvoice.Text = "Invoice for this Job card does not exist!";
                    }
                    else
                    {
                        lblMessageInvoice.Text = "Found!";
                    }
                   
                }
                con.Close();

            }
            catch (Exception)
            {
                lblMessageInvoice.Text = "Job card number does not exist";
            }
        }

        //Update job Daily
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();

            try
            {
                using (var cmd = new SqlCommand(@"UPDATE JOB_TYPES SET DAILY_RATE = @DAILY_RATE WHERE JOB_TYPE = @JOB_TYPE", con))
                {
                    cmd.Parameters.AddWithValue("@JOB_TYPE", DropDownListJobType.Text);

                    cmd.Parameters.Add("@DAILY_RATE", SqlDbType.Int).Value = txtDailyRate.Text;
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "UPDATED!";

                //Clears invoice box to allow for new entry
                JobTypeList.Items.Clear();
                con.Close();

                con.Open();
                using (var cmd = new SqlCommand(@"SELECT * FROM JOB_TYPES", con))
                {

                    DataTable dataTables = new DataTable();
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(dataTables);

                    //populates rows into a listbox
                    foreach (DataRow dataRow in dataTables.Rows)
                    {
                        // writes all to listbox
                        JobTypeList.Items.Add("JOB_TYPE: " + dataRow["JOB_TYPE"].ToString());
                        JobTypeList.Items.Add("DAILY_RATE: " + dataRow["DAILY_RATE"].ToString());
                        JobTypeList.Items.Add("\n");
                    }
                   

                }
               
                con.Close();
            }
            catch (Exception)
            {
                lblMessage.Text = "Not UPDATED! Does not exist or please check for empty text boxes";
            }
        }

        protected void BtnCloseJobCards_Click(object sender, EventArgs e)
        {
            ListView1.Visible = false;
            BtnCloseJobCards.Visible = false;
        }

        protected void BtnAllRetrieveCard_Click(object sender, EventArgs e)
        {
            ListView1.Visible = true;
            BtnCloseJobCards.Visible = true;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}