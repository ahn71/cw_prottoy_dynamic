using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DS.PropertyEntities.Model.Examinition;
using DS.BLL.ManagedSubject;
using DS.PropertyEntities.Model.ManagedSubject;
using DS.BLL.ControlPanel;
using DS.DAL;
using System.Data;

namespace DS.UI.Academic.Examination.ManagedSubject
{
    public partial class AddCourseWithSubject : System.Web.UI.Page
    {
        CourseEntry course_entry;
        bool result;
        protected void Page_Load(object sender, EventArgs e)
        {  
          
            if (!IsPostBack)
            {
                BindData();
                BindDropDownData();
            }
        }

     
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save") 
            {
                bool statusChecked = (chkStauts != null) ? chkStauts.Checked : false;
                string query = "Insert Into AddCourseWithSubject(SubId,CourseName,Ordering,isActive) values('"+ddlSubjectList.SelectedItem.Value+"','"+txtCourseName.Text.Trim().ToString()+"','"+txtOrdering.Text.Trim().ToString()+"','"+(statusChecked?1:0) +"')";
            }
            if (btnSave.Text == "Update") 
            {
                bool statusChecked = (chkStauts != null) ? chkStauts.Checked : false;

              //  int courseId = Convert.ToInt32(gvCourseSubList.DataKeys[1].Values["CourseId"]);
            

                string query = "Update AddCourseWithSubject set SubId='"+ddlSubjectList.SelectedValue.ToString()+"',CourseName='"+txtCourseName.Text.Trim()+"',Ordering='"+txtOrdering.Text.Trim().ToString()+"',isActive='"+ (statusChecked ? 1 : 0) + "' where CourseId=" + ViewState["--Id--"];
                CRUD.ExecuteNonQuerys(query);
                btnSave.Text = "Save";
                BindData();
                
            }
        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void gvCourseSubList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter") 
            {
                int rowIndex=Convert.ToInt32(e.CommandArgument);
                string CourseId =gvCourseSubList.DataKeys[rowIndex].Values[0].ToString();
                string SubId =gvCourseSubList.DataKeys[rowIndex].Values[1].ToString();
                ViewState["--Id--"] = CourseId;
                ddlSubjectList.SelectedValue = SubId;
                txtCourseName.Text = ((Label)gvCourseSubList.Rows[rowIndex].FindControl("lblCourse")).Text.Trim();
                txtOrdering.Text = ((Label)gvCourseSubList.Rows[rowIndex].FindControl("lblOrder")).Text.Trim();
                chkStauts.Checked = ((CheckBox)gvCourseSubList.Rows[rowIndex].FindControl("chkSwitchStatus")).Checked;
                btnSave.Text = "Update";
                BindData();

            }
        }

        private void BindData() 
        {
            string query = "select c.CourseId,c.CourseName,c.Ordering,c.SubId,s.SubName,isnull( c.IsActive,1) as IsActive from AddCourseWithSubject as c  inner join NewSubject as s on c.SubId=s.SubId";
            DataTable dt = CRUD.ReturnTableNull(query);
            gvCourseSubList.DataSource = dt;
            gvCourseSubList.DataBind();
        }

        private void BindDropDownData() 
        {
          string query = "SELECT SubId, SubName FROM newsubject WHERE IsActive = 1";
           DataTable dt = CRUD.ReturnTableNull(query);
            ddlSubjectList.DataSource = dt;
            ddlSubjectList.DataTextField = "SubName";
            ddlSubjectList.DataValueField = "SubId";
            ddlSubjectList.DataBind();
            ddlSubjectList.Items.Insert(0, new ListItem("-- Select Subject --", ""));
        }

        protected void gvCourseSubList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCourseSubList.PageIndex= e.NewPageIndex;
            BindData();
        }
    }
}