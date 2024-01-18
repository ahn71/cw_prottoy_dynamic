﻿using System;
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
    public partial class AddDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          if (!IsPostBack)
           {
                lblMessage.InnerText = "";
                bindData();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                //bool statusChecked = (chkStatus != null) ? chkStatus.Checked : false;

                string insertQuery = "INSERT INTO Departments_HR (DName, DStatus, IsTeacher) VALUES ('" + txtDepartment.Text.ToString().Trim() + "','" +  1  + "','" +  1  + "')";
                CRUD.ExecuteNonQuery(insertQuery);
                CleanField();
                lblMessage.InnerText = "Data saved successfuly";
            }
            else if (btnSave.Text == "Update")
            {
              //  bool statusChecked = (chkStatus != null) ? chkStatus.Checked : false;

                string insertQuery = "Update  Departments_HR set DName='" + txtDepartment.Text.ToString().Trim() + "',DStatus='" + 1 + "',IsTeacher='" +  1  + "' where Did=" + ViewState["--Did--"];
                CRUD.ExecuteNonQuery(insertQuery);
                CleanField();
                lblMessage.InnerText = "Data Updated successfuly";
            }

        }
        private void bindData()
        {
            string query = "select * from Departments_HR order by Did";
            DataTable dt = CRUD.ReturnTableNull(query);
            gvDepartment.DataSource = dt;
            gvDepartment.DataBind();
        }


        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {

            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int Did = Convert.ToInt32(gvDepartment.DataKeys[row.RowIndex].Value);
            string query = "update Departments_HR set DStatus =" + (isChecked ? "1" : "0") + " where Did=" + Did;
            CRUD.ExecuteNonQuery(query);
           
        }

        protected void chkSwitchIsTeacher_CheckedChanged(object sender, EventArgs e)
        {

            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchIsTeacher")).Checked;
            int did = Convert.ToInt32(gvDepartment.DataKeys[row.RowIndex].Value);
            string query = "update departments_hr set IsTeacher =" + (isChecked ? "1" : "0") + " where did=" + did;
            CRUD.ExecuteNonQuery(query);
            if (!isChecked)
            {
                lblMessage.InnerText = "Teacher InActived successfuly";
               
            }
            else
                lblMessage.InnerText = "Teacher activated successfuly";
               

        }

        protected void gvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter")
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);


                int did = Convert.ToInt32(gvDepartment.DataKeys[rowIndex].Value);
                ViewState["--Did--"] = did;

                txtDepartment.Text = ((Label)gvDepartment.Rows[rowIndex].FindControl("lblDname")).Text;
                btnSave.Text = "Update";
                bindData();
            }
        }

        private void CleanField()
        {
            txtDepartment.Text = "";
           
        }
    }
}