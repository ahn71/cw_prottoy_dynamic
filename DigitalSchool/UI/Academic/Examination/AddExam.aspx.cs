using DS.DAL.AdviitDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DS.PropertyEntities.Model.Examinition;
using DS.BLL.Examinition;
using DS.BLL.ControlPanel;
using DS.DAL;
using CrystalDecisions.Shared.Json;

namespace DS.UI.Academics.Examination
{
    public partial class AddExam : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindData();
            }

        }


        private void BindData()
        {
            string query = "Select ExId,ExName,SemesterExam,Ordering,ISNULL(IsActive,1) as IsActive from ExamType Order by Ordering";
            DataTable dt = CRUD.ReturnTableNull(query);
            gvExamList.DataSource = dt;
            gvExamList.DataBind();
        }



        protected void btnSave_Click1(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
              if(txtExamName.Text != "") 
                {
                    if (rdoQuiz.Checked == true || rdoOthers.Checked == true || rdoSemesterExam.Checked == true)
                    {
                        string query = $"INSERT INTO ExamType(ExName, SemesterExam, IsActive) VALUES('{txtExamName.Text}', {(rdoSemesterExam.Checked ? "1" : (rdoOthers.Checked ? "0" : "NULL"))}, '1')";
                        CRUD.ExecuteNonQuery(query);
                        lblMessage.InnerText = "Data saved successfully";
                        BindData();
                        ClearField();
                    }
                    else
                        lblMessage.InnerText = "Must be select any type";
                }
                else
                {
                    lblMessage.InnerText = "Exam Name is empty";
                }
                    



                
            }
            else 
            {
                string query = $"Update ExamType set ExName='{txtExamName.Text}',SemesterExam={(rdoSemesterExam.Checked ? "1" : (rdoOthers.Checked ? "0" : "NULL"))} where ExId=" + ViewState["--ExamId"];
                CRUD.ExecuteNonQuery(query);
                btnSave.Text = "";
                lblMessage.InnerText = "Data updated successfully";
                BindData();
                ClearField();

            }

        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int ExamID = Convert.ToInt32(gvExamList.DataKeys[row.RowIndex].Value);
            string query = "update ExamType set IsActive =" + (isChecked ? "1" : "0") + " where ExId=" + ExamID;
            CRUD.ExecuteNonQuery(query);
        }

        protected void gvExamList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblType = e.Row.FindControl("lblType") as Label;
                if (lblType != null && lblType.Text!="")
                {
                    bool semesterE = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "SemesterExam"));

                    if (!semesterE)
                    {
                        lblType.Text = "Other";
                    }
                    else if (semesterE)
                    {
                        lblType.Text = "Semester";
                    }
                }
                else
                {
  
                    lblType.Text = "Quiz";
                }

            }
        }

        protected void gvExamList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Alter") 
             {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int examId = Convert.ToInt32(gvExamList.DataKeys[rowIndex].Value);
                ViewState["--ExamId"] = examId;
                txtExamName.Text = ((Label)gvExamList.Rows[rowIndex].FindControl("lblExamName")).Text;
                string radioButtonValue = ((Label)gvExamList.Rows[rowIndex].FindControl("lblType")).Text;
                if (radioButtonValue == "Semester")
                {
                    rdoSemesterExam.Checked = true;
                }
                else if (radioButtonValue == "Other")
                {
                    rdoOthers.Checked = true;
                }
                else 
                {
                    rdoQuiz.Checked = true;
                }
                btnSave.Text = "Update";

            }
        }


        private void ClearField() 
        {
            txtExamName.Text = "";
            rdoQuiz.Checked = false;
            rdoOthers.Checked = false;
            rdoSemesterExam.Checked= false;
        }
    }

}