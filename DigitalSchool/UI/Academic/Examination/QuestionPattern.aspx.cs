using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DS.DAL.AdviitDAL;
using System.Data.SqlClient;
using System.Data;
using DS.BLL.ControlPanel;
using DS.DAL;

namespace DS.UI.Academic.Examination
{
    public partial class QuestionPattern : System.Web.UI.Page
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
                //if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "QuestionPattern.aspx", btnSave)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                BindData();
                }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (btnSave.Text == "Save") 
            {
                saveQuestionPattern();
                clearField();


            }
            else 
            {
              updateQuestionPattern();
                clearField();
              btnSave.Text = "Save";
                
            }
            //if (lblQPId.Value.ToString().Length == 0)
            //{
            //    //if (Session["__Save__"].ToString().Equals("false")) { lblMessage.InnerText = "warning-> You don't have permission to save!"; loadQuestionPattern(""); return; }
            //    if (saveQuestionPattern() == true)
            //        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "SaveSuccess();", true);
            //}
            //else
            //{
            //    if (updateQuestionPattern() == true)
            //        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "updateSuccess();", true);
            //}
        }
        private Boolean saveQuestionPattern()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Insert into  QuestionPattern values (@QPName,@IsActive) ", DbConnection.Connection);
                cmd.Parameters.AddWithValue("@QPName", txtQPName.Text.Trim());
                cmd.Parameters.AddWithValue("@IsActive", 1);
                int result = (int)cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMessage.InnerText = "success->Successfully saved";
                    //loadQuestionPattern("");
                    return true;
                }
                else
                {
                    lblMessage.InnerText = "error->Unable to save";
                    return false;
                }
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }
        }
        private Boolean updateQuestionPattern()
        {
            try
            {

                SqlCommand cmd = new SqlCommand(" update QuestionPattern  Set QPName=@QPName where QPId=@QPId ", DbConnection.Connection);
                cmd.Parameters.AddWithValue("@QPId", lblQPId.Value.ToString());
                cmd.Parameters.AddWithValue("@QPName", txtQPName.Text.Trim());
                
                int result = (int)cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMessage.InnerText = "success->Successfully Updated";
                    //loadQuestionPattern("");
                    return true;
                }
                else
                {
                    lblMessage.InnerText = "error->Unable to Update";
                    return false;
                }

            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }
        }

        protected void gvQuestionMarks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Alter") 
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);


                    string QpId = gvQuestionMarks.DataKeys[rowIndex].Values[0].ToString();

                    ViewState["--QpId--"] = QpId;

                    txtQPName.Text = ((Label)gvQuestionMarks.Rows[rowIndex].FindControl("lblQuestionPname")).Text.Trim();
                    btnSave.Text = "Update";
                    BindData();
                }
                catch (Exception ex)
                {
                    
                    
                }
               
            }

        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {

            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool IsChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int QpId = Convert.ToInt32(gvQuestionMarks.DataKeys[row.RowIndex].Values["QpId"]);

            string query = "update QuestionPattern set IsActive='" + (IsChecked ? 1 : 0) + "' where CourseId=" + QpId;
            CRUD.ExecuteNonQuerys(query);
         


        }


        private void BindData() 
        {
            string Query = "select QPId,QPName,ISNULL(IsActive,1) as IsActive from QuestionPattern  Order by QPId";
            DataTable dt = CRUD.ReturnTableNull(Query);
            gvQuestionMarks.DataSource = dt;
            gvQuestionMarks.DataBind();
        }
        
       private void clearField() 
        {
            txtQPName.Text = "";
        
        }
    }
}