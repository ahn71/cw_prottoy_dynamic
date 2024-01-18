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

namespace DS.UI.Academics.Examination
{
    public partial class Grading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                //---url bind---
                aDashboard.HRef = "~/" + Classes.Routing.DashboardRouteUrl;
                aAcademicHome.HRef = "~/" + Classes.Routing.AcademicRouteUrl;
                aExamHome.HRef = "~/" + Classes.Routing.ExaminationHomeRouteUrl;
                //---url bind end---
                if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "Grading.aspx", btnSave)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                    LoadGrading();
                }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save") 
            {
                if (lblGId.Value.ToString().Length == 0)
                {
                    if (Session["__Save__"].ToString().Equals("false")) { lblMessage.InnerText = "warning-> You don't have permission to save!"; LoadGrading(); return; }
                    if (saveGrading() == true)
                    {
                        LoadGrading();
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "SaveSuccess();", true);
                    }
                }
                else
                {
                    if (updateGrading() == true)
                    {
                        LoadGrading();
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "updateSuccess();", true);
                        btnSave.Text = "Save";
                    }
                }
            }
           
        }
        private Boolean saveGrading()
        {
            try
            {

                SqlCommand cmd = new SqlCommand("Insert into  Grading (GName, GMarkMin, GMarkMax, GPointMin,GPointMax,Comment)  values (@GName, @GMarkMin, @GMarkMax, @GPointMin,@GPointMax,@Comment) ", DbConnection.Connection);
                cmd.Parameters.AddWithValue("@GName", txtGrade.Text.Trim());
                cmd.Parameters.AddWithValue("@GMarkMin", txtGradeMin.Text.Trim());
                cmd.Parameters.AddWithValue("@GMarkMax", txtGradeMax.Text.Trim());
                cmd.Parameters.AddWithValue("@GPointMin", txtGPointMin.Text.Trim());
               cmd.Parameters.AddWithValue("@GPointMax", txtGPointMax.Text.Trim());
                cmd.Parameters.AddWithValue("@Comment", txtComment.Text.Trim());

                int result = (int)cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }
        }
        private Boolean updateGrading()
        {
            try
            {
                SqlCommand cmd = new SqlCommand(" update Grading  Set GName=@GName, GMarkMin=@GMarkMin, GMarkMax=@GMarkMax, GPointMin=@GPointMin,GPointMax=@GPointMax,Comment=@Comment where GId=@GId ", DbConnection.Connection);
                cmd.Parameters.AddWithValue("@GId", lblGId.Value.ToString());
                cmd.Parameters.AddWithValue("@GName", txtGrade.Text.Trim());
                cmd.Parameters.AddWithValue("@GMarkMin", txtGradeMin.Text.Trim());
                cmd.Parameters.AddWithValue("@GMarkMax", txtGradeMax.Text.Trim());
                cmd.Parameters.AddWithValue("@GPointMin", txtGPointMin.Text.Trim());
               cmd.Parameters.AddWithValue("@GPointMax", txtGPointMax.Text.Trim());
                cmd.Parameters.AddWithValue("@Comment",txtComment.Text.Trim());
                cmd.ExecuteNonQuery();

                return true;

            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }
        }
        private void LoadGrading()
        {
            try
            {
               string query="Select GId, GName, GMarkMin, GMarkMax, GPointMin,GPointMax,Comment from Grading Order by GId ASC";
                DataTable dt = CRUD.ReturnTableNull(query);
                gvGradeList.DataSource= dt;
                gvGradeList.DataBind();



            }
            catch { }
        }

        protected void gvGradeList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter") 
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                txtGrade.Text = ((Label)gvGradeList.Rows[rowIndex].FindControl("lblGrade")).Text;
                txtGradeMin.Text = ((Label)gvGradeList.Rows[rowIndex].FindControl("lblMarkMin")).Text;
                txtGradeMax.Text = ((Label)gvGradeList.Rows[rowIndex].FindControl("lblmarkMax")).Text;
                txtGPointMin.Text = ((Label)gvGradeList.Rows[rowIndex].FindControl("lblPointMin")).Text;
                txtGPointMax.Text = ((Label)gvGradeList.Rows[rowIndex].FindControl("lblGpointMax")).Text;
                txtComment.Text = ((Label)gvGradeList.Rows[rowIndex].FindControl("lblComment")).Text;

                btnSave.Text = "Update";
            }
        }
    }
}