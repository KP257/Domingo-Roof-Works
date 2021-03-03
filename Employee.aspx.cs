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
    public partial class Employee : System.Web.UI.Page
    {
        //Connection string
        string conString = "Data Source=sebastiansdatabase.database.windows.net;Initial Catalog=Domingo_Roof_Works;User ID=admin57340;Password=kPD57340;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Delete Employee
        protected void BtnDeleteEmpName_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();

            try
            {
                //updates employee details
                using (var command = new SqlCommand(@"DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = @EMPLOYEE_ID", con))
                {
                    command.Parameters.AddWithValue("@EMPLOYEE_ID", "EMP" + txtEmpIDDelete.Text);
                    command.ExecuteNonQuery();
                }
                lblEmpMessage2.Text = "Deleted!";
                con.Close();
            }
            catch (Exception)
            {
                lblEmpMessage2.Text = "Not UPDATED! Does not exist or please check for empty text boxes";
            }
        }
        
        //Create Employee
        protected void BtnCreateEmp_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            try
            {
                //inserts employee details in employee table 
                using (var cmd = new SqlCommand(@"INSERT INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_NAME) VALUES (@EMPLOYEE_ID, @EMPLOYEE_NAME)", connection))
                {
                    cmd.Parameters.Add("@EMPLOYEE_ID", SqlDbType.VarChar).Value = "EMP" + txtEmpID.Text;
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

        //Update Employees name 
        protected void BtnUpdateEmpName_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();

            try
            {
                //updates employee details
                using (var command = new SqlCommand(@"UPDATE EMPLOYEES SET EMPLOYEE_NAME = @EMPLOYEE_NAME WHERE EMPLOYEE_ID = @EMPLOYEE_ID", con))
                {
                    command.Parameters.AddWithValue("@EMPLOYEE_ID", "EMP" + txtEmpIDUpdate.Text);

                    command.Parameters.Add("@EMPLOYEE_NAME", SqlDbType.VarChar).Value = txtEmpNewName.Text;
                    command.ExecuteNonQuery();
                }
                lblEmpMessage1.Text = "UPDATED!";
                con.Close();
            }
            catch (Exception)
            {
                lblEmpMessage.Text = "Not UPDATED! Does not exist or please check for empty text boxes";
            }
        }
        //Search for employee
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

        //Navigation
        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}