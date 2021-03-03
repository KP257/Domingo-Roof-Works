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
    public partial class Invoices : System.Web.UI.Page
    {
        //Connection string
        string conString = "Data Source=sebastiansdatabase.database.windows.net;Initial Catalog=Domingo_Roof_Works;User ID=admin57340;Password=kPD57340;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Redirects to different page
        protected void BtnFetchInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllInvoices.aspx");
        }

        //Creates the invoice
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
                    cmd.Parameters.AddWithValue("@FindTotal", txtCardCreate.Text);
                    cmd.ExecuteNonQuery();
                }
                con.Close();

                //error message
                lblMessageInvoice.Text = "Invoice was created and saved!";
            }
            catch (Exception)
            {
                lblMessageInvoice.Text = "Job Card number does not exist!";
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
                        lblMessageInvoice1.Text = "Invoice for this Job card does not exist!";
                    }
                    else
                    {
                        lblMessageInvoice1.Text = "Found!";
                    }

                }
                con.Close();

            }
            catch (Exception)
            {
                lblMessageInvoice1.Text = "Job card number does not exist";
            }
        }

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}