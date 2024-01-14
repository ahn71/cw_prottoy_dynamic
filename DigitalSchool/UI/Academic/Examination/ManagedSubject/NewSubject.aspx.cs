using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DS.DAL.AdviitDAL;
using System.Data.SqlClient;
using System.Data;
using DS.PropertyEntities.Model.ManagedSubject;
using DS.BLL.ManagedSubject;
using DS.BLL.Examinition;
using DS.PropertyEntities.Model.Examinition;
using DS.BLL.ControlPanel;
using DS.DAL;

namespace DS.UI.Academic.Examination.ManagedSubject
{
    public partial class NewSubject : System.Web.UI.Page
    {
        SubjectEntry subject_entry;
        bool result;

        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!IsPostBack)
                {
                  BindData();
                }
        }       




        protected void gvSubjectList_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Alter")
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);


                int did = Convert.ToInt32(gvSubjectList.DataKeys[rowIndex].Value);
                ViewState["--Did--"] = did;

                txtSubName.Text = ((Label)gvSubjectList.Rows[rowIndex].FindControl("lblDname")).Text;
                txtOrdering.Text = ((Label)gvSubjectList.Rows[rowIndex].FindControl("lblOrder")).Text; btnSave.Text = "Update";
                  BindData();
            }

        }


        private void BindData() 
        {
           
            List<SubjectEntities> GetCompolsorySubjectList = SubjectEntry.GetEntitiesData;
            gvSubjectList.DataSource = GetCompolsorySubjectList;
            gvSubjectList.DataBind();

        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {

            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer; 
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int SubId = Convert.ToInt32(gvSubjectList.DataKeys[row.RowIndex].Value);
            string query = "update newsubject set IsActive =" + (isChecked ? "1" : "0") + " where SubId=" + SubId;
            CRUD.ExecuteNonQuery(query);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
               string insertQuery = "INSERT INTO newsubject (subName,Ordering,IsActive) VALUES ('" + txtSubName.Text.ToString().Trim() + "','"+txtOrdering.Text.ToString().Trim()+"','" + 1  + "')";
                CRUD.ExecuteNonQuery(insertQuery);
                BindData();
                ClearField();
            }
            else if (btnSave.Text == "Update")
            {
               

                string insertQuery = "Update  newsubject set subName='" + txtSubName.Text.ToString().Trim() + "',Ordering='" + txtOrdering.Text.ToString().Trim()+ "' where SubId=" + ViewState["--Did--"];
                CRUD.ExecuteNonQuery(insertQuery);
                BindData();
                btnSave.Text = "Save";
                ClearField();

            }

        }


        private void ClearField() 
        {
            txtSubName.Text = "";
            txtOrdering.Text = "";
           
        }

        protected void gvSubjectList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubjectList.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}