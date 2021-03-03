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
    public partial class JobCard1 : System.Web.UI.Page
    {
        // declared string of the connection string
        string conString = "Data Source=sebastiansdatabase.database.windows.net;Initial Catalog=Domingo_Roof_Works;User ID=admin57340;Password=kPD57340;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Retrieves all Job cards
        protected void BtnAllRetrieveCard_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllJobCards.aspx");
        }

        // Retrieves a Job card
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

        //Saves a Job card
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();

            try
            {
                string empName = EmployeeList.SelectedItem.ToString();
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

        //Navigation
        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}
