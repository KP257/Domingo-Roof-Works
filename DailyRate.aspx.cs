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
    public partial class DailyRate : System.Web.UI.Page
    {
        //Connection string
        string conString = "Data Source=sebastiansdatabase.database.windows.net;Initial Catalog=Domingo_Roof_Works;User ID=admin57340;Password=kPD57340;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Updates Daily Rate
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

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}