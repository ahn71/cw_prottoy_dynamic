using DS.BLL.Finance;
using DS.DAL;
using DS.PropertyEntities.Model.Finance;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DS.UI.Administration.Finance.Accounts
{
    public partial class AddTitle : System.Web.UI.Page
    {
        TitleEntry TleEntry;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTitle();
            }
        }
        private void LoadTitle()
        {
            try
            {
                string divInfo = string.Empty;
                if (TleEntry == null)
                {
                    TleEntry = new TitleEntry();
                }
                List<TitleEntities> TitleList = TleEntry.GetEntitiesData();
                gvTittleList.DataSource = TitleList;
                gvTittleList.DataBind();


            }
            catch { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (lblTitleID.Value == "0")
            {
                if (SaveName() == true)
                {
                    LoadTitle();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "SavedSuccess();", true);
                }
            }
            else
            {
                if (UpdateName() == true)
                {
                    LoadTitle();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "updateSuccess();", true);
                }
            }
        }
        private Boolean SaveName()
        {
            try
            {
                using (TitleEntities entities = GetFormData())
                {
                    if (TleEntry == null)
                    {
                        TleEntry = new TitleEntry();
                    }
                    TleEntry.AddEntities = entities;
                    bool result = TleEntry.Insert();
                    lblTitleID.Value = "0";
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
        private TitleEntities GetFormData()
        {
            TitleEntities tleEntities = new TitleEntities();
            tleEntities.ID = int.Parse(lblTitleID.Value);
            tleEntities.Title = txtTitle.Text.Trim();
            if (rdoIncome.Checked)
            {
                tleEntities.Type = false;
            }
            else if (rdExapanse.Checked) 
             {
              tleEntities.Type = true;
             }
            return tleEntities;
        }
        private Boolean UpdateName()
        {
            try
            {
                using (TitleEntities entities = GetFormData())
                {
                    if (TleEntry == null)
                    {
                        TleEntry = new TitleEntry();
                    }
                    TleEntry.AddEntities = entities;
                    bool result = TleEntry.Update();
                    lblTitleID.Value = "0";
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

        protected void gvTittleList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alter") 
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int Id = Convert.ToInt32(gvTittleList.DataKeys[rowIndex].Value);
                ViewState["__Id__"] = Id;

                txtTitle.Text = ((Label)gvTittleList.Rows[rowIndex].FindControl("lblTitle")).Text;
                btnSave.Text = "Update";
            }
        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            bool isChecked = ((CheckBox)row.FindControl("chkSwitchStatus")).Checked;
            int Id = Convert.ToInt32(gvTittleList.DataKeys[row.RowIndex].Value);
            string query = "update Accounts_Title  set Status='"+(isChecked?1:0)+"' where TitleID="+ Id;
            CRUD.ExecuteNonQuery(query);
            if (!isChecked)
            {
                lblMessage.InnerText = "DeActivated successfully";
            }
            else
                lblMessage.InnerText = "Activated succesfully";
        }
    }
}