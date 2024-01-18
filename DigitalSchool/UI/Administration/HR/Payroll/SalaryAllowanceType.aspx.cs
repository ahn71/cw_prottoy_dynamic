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

namespace DS.UI.Administration.HR.Payroll
{
    public partial class SalaryAllowanceType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                lblMessage.InnerText = "";
                if (!IsPostBack)
                {
                    if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "SalaryAllowanceType.aspx",btnSave)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                   BindData();
                }
        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save") 
            {
                string query = "Insert Into AllowanceType (Atype,APercentage,AStatus) Values('" + txtAllowence.Text + "','" + txtPersantece.Text + "','" + 1 + "')";
                CRUD.ExecuteQuery(query);
                lblMessage.InnerText = "Data saved successfully";
                BindData();
            }
            else 
            {
                string Query = "Update AllowanceType set Atype='" + txtAllowence.Text + "',set APercentage ='" + txtPersantece.Text + "' where Aid=" + ViewState["--Aid--"];
                CRUD.ExecuteQuery(Query);
                btnSave.Text = "Save";
                lblMessage.InnerText = "Data updated successfully";
                BindData();
            }
        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int Aid = Convert.ToInt32(gvAllowenceList.DataKeys[row.RowIndex].Value);
            string query = "Update AllowanceType set AStatus='"+(isChecked?1:0) +"'";
            CRUD.ExecuteQuery(query);
            if(isChecked) 
             {
                lblMessage.InnerText = "Activated successfully";
             }
            else
              {
                lblMessage.InnerText = "InActivated successfully";
              }
        }

        protected void gvAllowenceList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int Aid = Convert.ToInt32(gvAllowenceList.DataKeys[rowIndex].Value);
                ViewState["--Aid--"] = Aid;
                txtAllowence.Text = ((Label)gvAllowenceList.Rows[rowIndex].FindControl("lblAllowence")).Text;
                txtPersantece.Text = ((Label)gvAllowenceList.Rows[rowIndex].FindControl("lblPercentance")).Text;
                btnSave.Text = "Update";
            }

        }

        protected void gvAllowenceList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAllowenceList.PageIndex = e.NewPageIndex;
            BindData();
        }


        private void BindData() 
        {
            string Query = "Select *  from AllowanceType  Order by AId ";
            DataTable dt = CRUD.ReturnTableNull(Query);
            gvAllowenceList.DataSource = dt;
            gvAllowenceList.DataBind();
        }
    }
}