using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DS.DAL.AdviitDAL;
using DS.BLL.ControlPanel;
using DS.DAL;

namespace DS.UI.Administration.HR.Employee
{
    public partial class AddDesignation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                 {
                  BindData();
                 }
        }



        protected void btnSave_Click1(object sender, EventArgs e)
        {
           
                if (btnSave.Text == "Save")
                {
                    

                    string insertQuery = "INSERT INTO Designations (DesName,Status) VALUES ('" + txtDesName.Text.ToString().Trim() + "','" +  1  + "')";
                    CRUD.ExecuteNonQuery(insertQuery);
                     BindData();
                    CleanField();
                }
                if (btnSave.Text == "Update") 
                {
                  

                    string insertQuery = "Update  Designations set DesName='" + txtDesName.Text.ToString().Trim() + "' where DesId=" + ViewState["--Desgd--"];
                    CRUD.ExecuteNonQuery(insertQuery);
                    BindData();
                    CleanField();
                }
               
           
        }
        private void BindData() 
        {
            string query = "Select * from Designations  Order by DesId";
            DataTable dt = CRUD.ReturnTableNull(query);
            gvDesgtionlist.DataSource = dt;
            gvDesgtionlist.DataBind();

        }

        protected void gvDesgtionlist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           if((e.CommandName == "Alter")) 
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);


                int desgId = Convert.ToInt32(gvDesgtionlist.DataKeys[rowIndex].Value);
                ViewState["--Desgd--"] = desgId;

                txtDesName.Text = ((Label)gvDesgtionlist.Rows[rowIndex].FindControl("lblDesname")).Text;
                 BindData();

                btnSave.Text = "Update";
            
            }
        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {

            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int Did = Convert.ToInt32(gvDesgtionlist.DataKeys[row.RowIndex].Value);
            string query = "update Designations set Status =" + (isChecked ? "1" : "0") + " where DesId=" + Did;
            CRUD.ExecuteNonQuery(query);
        }

        private void CleanField()
        {
            txtDesName.Text = "";
        }
    }
}