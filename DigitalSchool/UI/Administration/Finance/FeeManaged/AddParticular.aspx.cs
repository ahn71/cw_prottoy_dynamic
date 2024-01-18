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

namespace DS.UI.Administration.Finance.FeeManaged
{
    public partial class AddParticular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                //{
                //    if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "AddParticular.aspx", btnSave)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                BindData();
            }

        }



        private void BindData()
        {
            string Query = "Select *  from ParticularsInfo  Order by PId";
            DataTable dt = CRUD.ReturnTableNull(Query);
            gv_particularList.DataSource = dt;
            gv_particularList.DataBind();
        }

        protected void gv_particularList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                int rIndex = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "Alter")
                {
                    int  PId = Convert.ToInt32(gv_particularList.DataKeys[rIndex].Value);
                    ViewState["--PId--"] = PId;
                    txtParticulerName.Text = ((Label)gv_particularList.Rows[rIndex].FindControl("lblName")).Text;
                    btnSave.Text = "Update";
                }


            }
            catch { }
        }

        protected void chkStatus_CheckedChanged(object sender, EventArgs e)
        {
            
            GridViewRow row=(GridViewRow)((CheckBox)sender).NamingContainer;
            bool IsChecked = ((CheckBox)row.FindControl("chkStatus")).Checked;
            int Pid = Convert.ToInt32(gv_particularList.DataKeys[row.RowIndex].Value);
            
            string query = "Update ParticularsInfo set Pstatus='" + (IsChecked ? 1 : 0) + "' where PId="+ Pid;
            CRUD.ExecuteNonQuery(query);
            if(IsChecked)
                lblMessage.InnerText = "error->Particular Activation successful ";
            else
                lblMessage.InnerText = "error->Particular Inactive successful ";

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {


            if (btnSave.Text == "Save")
            {

                string query = " Insert into  ParticularsInfo(PName,PStatus) Values ('" + txtParticulerName.Text + "',1 )";
                CRUD.ExecuteNonQuery(query);
                BindData();
                ClearField();
                lblMessage.InnerText = "error->Particular Save successful ";

            }
            else
            {
                string query = "Update ParticularsInfo set PName='"+ txtParticulerName.Text+ "' where PId=" + ViewState["--PId--"];
                CRUD.ExecuteNonQuery(query);
             
                BindData();
                btnSave.Text = "Save";
                ClearField();
                lblMessage.InnerText = "error->Particular update successful ";

            }
        }

        private void ClearField()
        {
            txtParticulerName.Text = "";
        }
    }  

}
        

