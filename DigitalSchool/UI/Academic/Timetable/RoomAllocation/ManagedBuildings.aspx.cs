using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DS.BLL.Timetable;
using DS.PropertyEntities.Model;
using DS.PropertyEntities.Model.Timetable;
using DS.BLL.ControlPanel;
using DS.DAL;

namespace DS.UI.Academic.Timetable.RoomAllocation
{
    public partial class ManagedBuildings : System.Web.UI.Page
    {
        BuildingNameEntry buildingNameEntry;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.InnerText = string.Empty;
            if (!Page.IsPostBack)
            {
                if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "ManagedBuildings.aspx", btnSubmit)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                loadBuildingName();
            } 
        }

        private void loadBuildingName()
        {
            string divInfo = string.Empty;
            if (buildingNameEntry == null)
            {
                buildingNameEntry = new BuildingNameEntry();
            }
            List<BuildingNameEntities> BuildingList = buildingNameEntry.GetEntitiesData();
            gvBuldingList.DataSource= BuildingList;
            gvBuldingList.DataBind();

        }
        
        private BuildingNameEntities GetFormData()
        {
            BuildingNameEntities buildingNameEntities = new BuildingNameEntities();
            if (btnSubmit.Text.Trim() == "Update") 
            {
                buildingNameEntities.BuildingId = int.Parse(ViewState["__buidingId__"].ToString());
            }
             buildingNameEntities.BuildingName = txtBuildingName.Text.Trim();            
            return buildingNameEntities;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Save") 
            {
                if (lblBuidlingId.Value.ToString() == string.Empty)
                {
                    if (Session["__Save__"].ToString().Equals("false")) { lblMessage.InnerText = "warning-> You don't have permission to save!"; loadBuildingName(); return; }
                    lblBuidlingId.Value = "0";
                    if (SaveBuildingName() == true)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "SavedSuccess();", true);
                    }
                }
            }
            else
                {
                    if (UpdateBuildingName() == true)
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "updateSuccess();", true);
                     btnSubmit.Text = "Save";
                }
           
          
        }

        private Boolean SaveBuildingName()
        {
            try
            {
                using (BuildingNameEntities entities = GetFormData())
                {
                    if (buildingNameEntry == null)
                    {
                        buildingNameEntry = new BuildingNameEntry();
                    }
                    buildingNameEntry.AddEntities = entities;
                    bool result = buildingNameEntry.Insert();                    
                    btnSubmit.Text = "Save";
                    lblBuidlingId.Value = string.Empty;
                    loadBuildingName();
                    if (!result)
                    {
                        lblMessage.InnerText = "error-> Unable to save";
                        return false;
                    }                    
                    return true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }           
        }

        private Boolean UpdateBuildingName()
        {
            try
            {
                using (BuildingNameEntities entities = GetFormData())
                {
                    if (buildingNameEntry == null)
                    {
                        buildingNameEntry = new BuildingNameEntry();
                    }
                    buildingNameEntry.AddEntities = entities;
                    bool result = buildingNameEntry.Update();                    
                    loadBuildingName();
                    lblBuidlingId.Value = string.Empty;
                    if (!result)
                    {
                        lblMessage.InnerText = "error-> Unable to update";
                        return false;
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }            
        }        

        private void ClearField()
        {
            txtBuildingName.Text = string.Empty;
        }

        protected void gvBuldingList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter") 
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int buidingId = Convert.ToInt32(gvBuldingList.DataKeys[rowIndex].Value);
                ViewState["__buidingId__"] = buidingId;
                txtBuildingName.Text = ((Label)gvBuldingList.Rows[rowIndex].FindControl("lblBuldingName")).Text;
                btnSubmit.Text = "Update";
            }
        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int ExamID = Convert.ToInt32(gvBuldingList.DataKeys[row.RowIndex].Value);
            string query = "update Tbl_Bu‎ilding_Name set Status='" + (isChecked ? 1 : 0) + "' where BuildingId=" + ExamID;
            CRUD.ExecuteNonQuery(query);
        }
    }
}