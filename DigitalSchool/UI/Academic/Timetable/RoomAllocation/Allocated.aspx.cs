using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DS.BLL.Timetable;
using DS.PropertyEntities.Model;
using DS.PropertyEntities.Model.Timetable;
using DS.SysErrMsgHandler;
using DS.BLL.ControlPanel;
using DS.DAL;

namespace DS.UI.Academic.Timetable.RoomAllocation
{
    public partial class Allocated : System.Web.UI.Page
    {
        RoomEntry rmEntry;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.InnerText = string.Empty;
            if (!Page.IsPostBack)
            {
                if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "Allocated.aspx", btnSubmit)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                GetBuildName();
                DataBindToTableView(null);
            }
        }

        private void GetBuildName()
        {            
            BuildingNameEntry buildingName = new BuildingNameEntry();
            List<BuildingNameEntities> buildingNameList = buildingName.GetEntitiesData();
            drpBuildingName.DataTextField = "BuildingName";
            drpBuildingName.DataValueField = "BuildingId";
            drpBuildingName.DataSource = buildingNameList;
            drpBuildingName.DataBind();
            drpBuildingName.Items.Insert(0, new ListItem("...Select Building Name...", "0"));
        }

        private RoomEntities GetFormData()
        {
            RoomEntities rmEntities = new RoomEntities();
            if (btnSubmit.Text == "Update") 
            {
                rmEntities.RoomId = int.Parse(ViewState["--roomId"].ToString());
            }
           
            rmEntities.RoomName = TxtRName.Text.Trim();
            rmEntities.RoomCapacity = int.Parse(TxtRCapacity.Text.Trim());
            rmEntities.BuildingId = int.Parse(drpBuildingName.SelectedValue);
            return rmEntities;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (btnSubmit.Text == "Save") 
            {
                if (lblRmId.Value.ToString() == string.Empty)
                {
                    if (Session["__Save__"].ToString().Equals("false")) { lblMessage.InnerText = "warning-> You don't have permission to save!"; DataBindToTableView(int.Parse(drpBuildingName.SelectedValue)); return; }
                    lblRmId.Value = "0";
                    if (SaveName() == true)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "SavedSuccess();", true);
                    }
                }
            }
           
            else
               {
                if (UpdateName() == true)
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "updateSuccess();", true);
                  btnSubmit.Text = "Save";
               }            
        } 

        private Boolean SaveName()
        {
            try
            {
                using (RoomEntities entities = GetFormData())
                {                
                    if (rmEntry == null)
                    {
                        rmEntry = new RoomEntry();
                    }
                    rmEntry.AddEntities = entities;
                    bool result = rmEntry.Insert();
                    lblRmId.Value = string.Empty;
                    DataBindToTableView(entities.BuildingId);
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

        private Boolean UpdateName()
        {
            try
            {
                using (RoomEntities entities = GetFormData())
                {
                    if (rmEntry == null)
                    {
                        rmEntry = new RoomEntry();
                    }
                    rmEntry.AddEntities = entities;
                    bool result = rmEntry.Update();
                    lblRmId.Value = string.Empty;
                    btnSubmit.Text = "Save";
                    DataBindToTableView(entities.BuildingId);
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
        

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        private void ClearFields()
        {
            drpBuildingName.SelectedValue = "0";
            TxtRName.Text = string.Empty;
            TxtRCapacity.Text = string.Empty;
        }

        protected void drpBuildingName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lblBuidlingId.Value == string.Empty)
            {
                int? id = (int.Parse(drpBuildingName.SelectedValue));
                DataBindToTableView(id = (id == 0) ? null : id);
                TxtRName.Text = string.Empty;
                TxtRCapacity.Text = string.Empty;                
            }                      
        }

        private void DataBindToTableView(int? buildingId)
        {
            string divInfo = string.Empty;
            if (rmEntry == null)
            {
                rmEntry = new RoomEntry();
            }
            List<RoomEntities> RMList = rmEntry.GetEntitiesData(buildingId);
            gvRoomList.DataSource= RMList;
            gvRoomList.DataBind();
        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {
          GridViewRow row =(GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int roomId = Convert.ToInt32(gvRoomList.DataKeys[row.RowIndex].Values["RoomId"]);
            string query = "update [Tbl_BuildingWith_Room]  set Status='" + (isChecked ? 1 : 0) + "' where RoomId=" + roomId;
            CRUD.ExecuteNonQuery(query);

        }

        protected void gvRoomList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter") 
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string roomId = gvRoomList.DataKeys[rowIndex].Values[0].ToString();
                string buildingId = gvRoomList.DataKeys[rowIndex].Values[1].ToString();
                 ViewState["--roomId"] = roomId;
                 drpBuildingName.SelectedValue = buildingId;
                TxtRName.Text = ((Label)gvRoomList.Rows[rowIndex].FindControl("lblRoomName")).Text;
                TxtRCapacity.Text = ((Label)gvRoomList.Rows[rowIndex].FindControl("lblCapacity")).Text;
                btnSubmit.Text = "Update";
            }
        }
    }
}