using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DS.DAL.AdviitDAL;
using DS.BLL.ManagedBatch;
using DS.BLL.ControlPanel;
using DS.DAL;
using ComplexScriptingSystem;
using DS.BLL.ManagedClass;
using DS.BLL.Examinition;
using DS.Classes;
using System.Globalization;

namespace DS.UI.Administration.Finance.FeeManaged
{
    public partial class FeesCategoriesInfo : System.Web.UI.Page
    {
        string sqlCmd = string.Empty;
        DataTable dt;
        private double runningTotalTP=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.InnerText = string.Empty;
            if (!IsPostBack)
            {
                if (!PrivilegeOperation.SetPrivilegeControl(int.Parse(Session["__UserTypeId__"].ToString()), "FeesCategoriesInfo.aspx", btnSave)) Response.Redirect(Request.UrlReferrer.ToString() + "?hasperm=no");
                commonTask.LoadFeesCategoryPaymentForType(ddlPaymentFor);
                commonTask.LoadParticular(ddlParticular);
                commonTask.LoadPaymentStores(ddlPaymentStore);
                BatchEntry.GetDropdownlist(dlBatchName, "True");
                ClassGroupEntry.GetDropDownWithAll(ddlGroup, -1);//-1 as All
                ExamInfoEntry.GetExamIdListWithExInSl(ddlExam, "All");
                loadFeesCategoryInfo();
                //stdtypeEntry.GetEntitiesData(ddlStudentType);

                Dataload();

                listPanel.Visible = true;
                entryPanel.Visible = false;

            }
   

        }

        private void loadFeesCategoryInfo()
        {
            try
            {
                sqlCmd = @"SELECT
                        FCI.FeeCatId,
                        BI.BatchName,
                        FCI.FeeCatName,
                        CONVERT(VARCHAR, DP.DateOfStart, 105) AS DateOfStart,
                        CONVERT(VARCHAR, DP.DateOfEnd, 105) AS DateOfEnd,
                        FCI.FeeFine,
                        SUM(PC.Amount) AS TotalAmount,
	                    PS.StoreTitle
                    FROM
                        FeesCategoryInfo AS FCI
                    INNER JOIN
                        BatchInfo AS BI ON FCI.BatchId = BI.BatchId
                    INNER JOIN
                        DateOfPayment AS DP ON FCI.FeeCatId = DP.FeeCatId
                    INNER JOIN
                        ParticularsCategory AS PC ON FCI.FeeCatId = PC.FeeCatID
                    LEFT JOIN
                        ParticularsInfo AS PTI ON PTI.Pid = PC.Pid
                    LEFT JOIN PaymentStores PS ON PS.StoreNameKey= FCI.StoreNameKey
                    WHERE
                        PTI.PStatus = 1
                    GROUP BY
                        FCI.FeeCatId,
                        BI.BatchName,
                        FCI.FeeCatName,
                        CONVERT(VARCHAR, DP.DateOfStart, 105),
                        CONVERT(VARCHAR, DP.DateOfEnd, 105),
                        FCI.FeeFine,
	                    PS.StoreTitle
                    ORDER BY
                        FCI.FeeCatId DESC

                    ";

                DataTable dt = CRUD.ReturnTableNull(sqlCmd);
                gvParticularList.DataSource = dt;
                gvParticularList.DataBind();
               


            }
            catch (Exception)
            {

                throw;
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (btnSave.Text == "Save")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "load();", true);
                if (Session["__Save__"].ToString().Equals("false"))
                {
                    lblMessage.InnerText = "warning-> You don't have permission to save!";
                    loadFeesCategoryInfo(); return;
                }
                if (!existAdmissionFee())
                {
                    saveFeesCategoryInfo();
                }
            }
            else
            {
                updateFeesCategoryInfo();
                

            }

        }

        private void ClearGridView()
        {

            ddlPaymentFor.SelectedValue = "0";
            txtFeesCatName.Text = "";
            ddlPaymentStore.SelectedValue = "0";
            dlBatchName.SelectedValue = "0";
            ddlExam.SelectedValue = "0";
            txtDateStart.Text = "";
            txtDateEnd.Text = "";
            txtFeesFine.Text = "";
            ddlGroup.SelectedValue = "0";
            Dataload();
            btnSave.Text = "Save";

        }



        private bool existAdmissionFee()
        {
            try {
                if (ddlPaymentFor.SelectedValue == "openPayment") return false;
                dt = new DataTable();
                dt = CRUD.ReturnTableNull("select FeeCatId,BatchId,DateOfCreation,FeeFine,FeeCatName,ExInSl,IsDemo,PaymentFor,ClsGrpId,StoreNameKey from FeesCategoryInfo where PaymentFor='admission' and BatchId=" + dlBatchName.SelectedValue.Split('_')[1]+" and ClsGrpId="+ddlGroup.SelectedValue);
                if (dt == null)
                {
                    lblMessage.InnerText = "error-> Technical Error!!!";
                    return true;
                }
                else if (dt.Rows.Count > 0)
                {
                    lblMessage.InnerText = "warning-> Admission Category Exist! ("+dt.Rows[0]["FeeCatName"].ToString()+")";
                    return true;
                }
                else
                    return false;
                   
            } catch(Exception ex) {
                lblMessage.InnerText = "error-> Technical Error!!! ex>"+ex.Message;
                return true;
            }
        }
        private Boolean saveFeesCategoryInfo()
        {
            int result = 0;
            try
            {
                string[] batchClsID = dlBatchName.SelectedValue.Split('_');
                SqlCommand cmd = new SqlCommand("Insert into FeesCategoryInfo( BatchId, DateOfCreation, FeeFine, FeeCatName,ExInSl,PaymentFor,ClsGrpId,StoreNameKey) values " +
                                                "(@BatchId, @DateOfCreation, @FeeFine, @FeeCatName,@ExInSl,@PaymentFor,@ClsGrpId,@StoreNameKey); SELECT SCOPE_IDENTITY();", DbConnection.Connection);
                cmd.Parameters.AddWithValue("@BatchId", batchClsID[0]);
                cmd.Parameters.AddWithValue("@DateOfCreation", DateTime.Now);
                cmd.Parameters.AddWithValue("@FeeFine", txtFeesFine.Text.Trim());
                cmd.Parameters.AddWithValue("@FeeCatName", txtFeesCatName.Text.Trim());
                cmd.Parameters.AddWithValue("@ExInSl", ddlExam.SelectedValue);
                cmd.Parameters.AddWithValue("@PaymentFor",ddlPaymentFor.SelectedValue);
                cmd.Parameters.AddWithValue("@ClsGrpId",ddlGroup.SelectedValue);
                cmd.Parameters.AddWithValue("@StoreNameKey",ddlPaymentStore.SelectedValue);
                int FeeCatId = Convert.ToInt32(cmd.ExecuteScalar()); 
                if (FeeCatId > 0)
                {
                    cmd = new SqlCommand("Insert into  DateOfPayment(FeeCatId, DateOfStart, DateOfEnd,IsActive)  values (@FeeCatId, @DateOfStart, "
                    + "@DateOfEnd,@IsActive) ", DbConnection.Connection);
                    cmd.Parameters.AddWithValue("@FeeCatId", FeeCatId.ToString());
                    cmd.Parameters.AddWithValue("@DateOfStart",Classes.commonTask.ddMMyyyyToyyyyMMdd(txtDateStart.Text));
                    cmd.Parameters.AddWithValue("@DateOfEnd", Classes.commonTask.ddMMyyyyToyyyyMMdd(txtDateEnd.Text));
                    cmd.Parameters.AddWithValue("@IsActive", "True");
                    result = (int)cmd.ExecuteNonQuery();

                    saveParticularsCategory(FeeCatId);
                }
              
                if (result > 0)
                {
                    //  saveStudentPayment(FeeCatId.ToString(), dlBatchName.SelectedValue);
                    lblMessage.InnerText = "success->Save Successfully.";
                    backToList();
                    loadFeesCategoryInfo();
                    ClearGridView();    
                   
                    
                
                }
                else lblMessage.InnerText = "error->Unable to save";

                return true;
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                loadFeesCategoryInfo();
                return false;
            }
        }
        //Save Particuller here
        private void saveParticularsCategory(int FeeCatId)
        {
            try
            {
                SqlCommand cmd;
                dt = (DataTable)ViewState["__Data__"];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    cmd = new SqlCommand("Insert into  ParticularsCategory (FeeCatId, PId, Amount)  values (@FeeCatId, @PId, @Amount) ", DbConnection.Connection);
                    cmd.Parameters.AddWithValue("@FeeCatId", FeeCatId);
                    cmd.Parameters.AddWithValue("@PId", dt.Rows[i]["PId"].ToString());
                    cmd.Parameters.AddWithValue("@Amount", dt.Rows[i]["Amount"].ToString());
                   
                    cmd.ExecuteNonQuery();
                }

                dt = new DataTable();
                ViewState["__Data__"] = dt;
            }

            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                
            }
        }
        private void deleteParticularsCategory(int FeeCatId)
        {
            try
            {
                SqlCommand cmd;

                // Create a delete command to remove existing records for the given FeeCatId
                cmd = new SqlCommand("DELETE FROM ParticularsCategory WHERE FeeCatId = @FeeCatId", DbConnection.Connection);
                cmd.Parameters.AddWithValue("@FeeCatId", FeeCatId);

                // Execute the delete command
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "Error -> " + ex.Message;
            }
        }


        private Boolean saveStudentPayment(string FeeCatId, string batchID)
        {
            try
            {
                string[] batchClsID = batchID.Split('_');
                DataTable dtst = new DataTable();
                sqlDB.fillDataTable("Select StudentId,ConfigId,ClsGrpID,ClsSecID,RollNo from CurrentStudentInfo where BatchId='" + batchClsID[0] + "' ", dtst);

                for (int i = 0; i < dtst.Rows.Count; i++)
                {
                    SqlCommand cmd = new SqlCommand("saveStudentPayment", DbConnection.Connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StudentId", dtst.Rows[i]["StudentId"].ToString());
                    cmd.Parameters.AddWithValue("@ShiftID", dtst.Rows[i]["ConfigId"].ToString());
                    cmd.Parameters.AddWithValue("@BatchId", batchClsID[0]);
                    cmd.Parameters.AddWithValue("@ClassID", batchClsID[1]);
                    cmd.Parameters.AddWithValue("@ClsGrpID", dtst.Rows[i]["ClsGrpID"].ToString());
                    cmd.Parameters.AddWithValue("@ClsSecID", dtst.Rows[i]["ClsSecID"].ToString());
                    cmd.Parameters.AddWithValue("@RollNo", dtst.Rows[i]["RollNo"].ToString());
                    cmd.Parameters.AddWithValue("@FeeCatId", FeeCatId);                       
                    cmd.Parameters.AddWithValue("@DateOfPayment", DateTime.Now);
                    cmd.Parameters.AddWithValue("@PayStatus", "0");
                    cmd.Parameters.AddWithValue("@AmountPaid", "0");
                    cmd.Parameters.AddWithValue("@FineAmount", "0");
                    cmd.Parameters.AddWithValue("@DiscountStatus", "0");
                    cmd.Parameters.AddWithValue("@DiscountTK", "0");
                    cmd.Parameters.AddWithValue("@GrandTotal", "0");
                    cmd.Parameters.AddWithValue("@DueAmount", "0");
                    cmd.Parameters.AddWithValue("@StdTypeId","0");

                    int result = (int)cmd.ExecuteScalar();
                    if (result > 0) lblMessage.InnerText = "success->Save Successfully ";
                    else lblMessage.InnerText = "error->Unable to save";
                }            
                return true;
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                return false;
            }
        }
        

        private Boolean updateFeesCategoryInfo()
        {
            try
            {
                string[] batchClsID = dlBatchName.SelectedValue.Split('_');
                int feecatId = Convert.ToInt32(ViewState["__FeeCatId"]);
                SqlCommand cmd = new SqlCommand("update FeesCategoryInfo  Set FeeFine=@FeeFine, " +
                                                                                                "FeeCatName=@FeeCatName,ExInSl=@ExInSl,PaymentFor=@PaymentFor,ClsGrpId=@ClsGrpId,StoreNameKey=@StoreNameKey where FeeCatId=@FeeCatId ", DbConnection.Connection);



                cmd.Parameters.AddWithValue("@FeeCatId", feecatId.ToString());
                cmd.Parameters.AddWithValue("@BatchId", batchClsID[0]);
                cmd.Parameters.AddWithValue("@FeeFine", txtFeesFine.Text.Trim());
                cmd.Parameters.AddWithValue("@FeeCatName", txtFeesCatName.Text.Trim());
                cmd.Parameters.AddWithValue("@PaymentFor",ddlPaymentFor.SelectedValue);
                cmd.Parameters.AddWithValue("@ClsGrpId",ddlGroup.SelectedValue);
                cmd.Parameters.AddWithValue("@ExInSl",ddlExam.SelectedValue);               
                cmd.Parameters.AddWithValue("@StoreNameKey", ddlPaymentStore .SelectedValue);             
                cmd.ExecuteNonQuery();
          
                if (feecatId > 0)
                {
                    cmd = new SqlCommand("update DateOfPayment set DateOfStart=@DateOfStart,DateOfEnd=@DateOfEnd,IsActive=@IsActive where FeeCatId=@FeeCatId", DbConnection.Connection);
                    cmd.Parameters.AddWithValue("@FeeCatId", feecatId.ToString());
                    cmd.Parameters.AddWithValue("@DateOfStart", convertDateTime.getCertainCulture(txtDateStart.Text));
                    cmd.Parameters.AddWithValue("@DateOfEnd", convertDateTime.getCertainCulture(txtDateEnd.Text));
                    cmd.Parameters.AddWithValue("@IsActive", "True");
                    cmd.ExecuteNonQuery();
                }
                deleteParticularsCategory(feecatId);
                saveParticularsCategory(feecatId);
                loadFeesCategoryInfo();
                backToList();

                ClearGridView();
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "updateSuccess();", true);
                return true;
            }
            catch (Exception ex)
            {
                lblMessage.InnerText = "error->" + ex.Message;
                loadFeesCategoryInfo();

                return false;
            }
        } 

        protected void dlBatchName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {                
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call me", "load();", true);
                if (dlBatchName.SelectedValue != "0")
                {
                    loadFeesCategoryInfo();
                    string[] batchClsID = dlBatchName.SelectedValue.Split('_');
                    ClassGroupEntry.GetDropDownWithAll(ddlGroup, int.Parse(batchClsID[1]));
                    ExamInfoEntry.GetExamIdListWithExInSl(ddlExam, batchClsID[0]);
                }                    
                else
                    loadFeesCategoryInfo();
                
            }
            catch{}
        }

        protected void ddlPaymentFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPaymentFor.SelectedValue == "openPayment")
            {
                pnlAcademicInfo.Visible = false;
                hfAcademicInfo.Value = "0";
            }
            else
            {
                pnlAcademicInfo.Visible = true;
                hfAcademicInfo.Value = "1";
            }
               
            loadFeesCategoryInfo();
        }

        private void Dataload()
        {
            dt = new DataTable();
            dt.Columns.Add("PId", typeof(int));
            dt.Columns.Add("Particular", typeof(string));
            dt.Columns.Add("Amount", typeof(string));
            ViewState["__Data__"] = dt;
            BindGridView();
        }  

        public void saveparticularOngv(string amount, string particular,string pId, DataTable dt)
        {
            if (ddlParticular.SelectedValue != "0")
            {
                if (amount != "")
                {
                    DataRow dr = dt.NewRow();

                    dr["PId"] = pId;
                    dr["Particular"] = particular;
                    dr["Amount"] = amount;
                    dt.Rows.Add(dr);
                    ViewState["__Data__"] = dt;
                    BindGridView();
                    ddlParticular.SelectedIndex = 0;
                    txtAmount.Text = "";
                }
                else
                {
                    lblMessage.InnerText = "error->Please enter particular amount";
                }
            }
            else
            {
                lblMessage.InnerText = "error->Please Select Particular";

            }
        }


        private bool IsParticularExists(string particular,DataTable dt)
        {
            // Check if the particular value already exists in the GridView
             
            
            foreach (DataRow row in dt.Rows)
            {
                if (string.Equals(particular, row["Particular"].ToString(), StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }
        private void BindGridView()
        {
            gvParticularInfo.DataSource = (DataTable)ViewState["__Data__"];
            gvParticularInfo.DataBind();
        }



        protected void btnAddParticular_Click(object sender, EventArgs e)
        {


            string particular = ddlParticular.SelectedItem.Text;
            string pId = ddlParticular.SelectedValue;
            string amount = txtAmount.Text.Trim();
            dt = (DataTable)ViewState["__Data__"];
            if (!IsParticularExists(particular,dt))
                {
                    saveparticularOngv(amount, particular, pId, dt);
                }
                else
                {
                    lblMessage.InnerText = "error->This particular is alredy exist ";
                }
            
        }

        protected void gvParticularInfo_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "Remove")
                {
                    int rIndex = Convert.ToInt32(e.CommandArgument);
                     dt = (DataTable)ViewState["__Data__"];
                
                        if (dt != null && rIndex >= 0 && rIndex < dt.Rows.Count)
                        {
                             dt.Rows[rIndex].Delete();
                             dt.AcceptChanges();
                             gvParticularInfo.DataSource = dt;
                             gvParticularInfo.DataBind();

                        }
                        else
                        {
                                     
                        }
                }

            }
            catch (Exception ex)
            {
                // Handle exceptions, log, or display an error message
            }
        }
        protected decimal totalAmount = 0;

        // Declare this variable at the class level

        protected void gvParticularInfo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Accumulate the Amount for each row
                decimal amount = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Amount"));
                totalAmount += amount;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Display the total Amount in the Footer
                Label lblTotalAmountAdded = (Label)e.Row.FindControl("lblTotalAmountAdded");
                if (lblTotalAmountAdded != null)
                {
                    lblTotalAmountAdded.Text = totalAmount.ToString("0.00");
                }
            }
        }
 

        protected void btnAddFeesCat_Click(object sender, EventArgs e)
        {

            if(btnAddFeesCat.Text== "Add New Fees Catagory +")
            {
                if (listPanel.Visible == true)
                {
                    listPanel.Visible = false;
                    entryPanel.Visible = true;
                    btnAddFeesCat.Text = "Back To LIst";


                }
            }
            else
            {
                backToList();
            }
        }
        private void backToList()
        {
            entryPanel.Visible = false;
            listPanel.Visible = true;
            btnAddFeesCat.Text = "Add New Fees Catagory +";
        }

        private void loadFeesCategoryDetailes(int feeCatId)
        {
            try
            {

                // Get other values as needed from DataKeys

                sqlCmd = @"SELECT
                        FCI.FeeCatId,
                        BI.BatchName,
                        FCI.FeeCatName,
                        CONVERT(VARCHAR, DP.DateOfStart, 105) AS DateOfStart,
                        CONVERT(VARCHAR, DP.DateOfEnd, 105) AS DateOfEnd,
                        FCI.FeeFine,
                        SUM(PC.Amount) AS TotalAmount,
	                    PS.StoreTitle,
	                    FCI.PaymentFor,
	                    TG.GroupName,
	                    EXI.ExName
                        FROM
                        FeesCategoryInfo AS FCI
                    INNER JOIN
                        BatchInfo AS BI ON FCI.BatchId = BI.BatchId
                    INNER JOIN
                        DateOfPayment AS DP ON FCI.FeeCatId = DP.FeeCatId
                    INNER JOIN
                        ParticularsCategory AS PC ON FCI.FeeCatId = PC.FeeCatID
                    INNER JOIN 
	                    Tbl_Group AS TG ON TG.GroupID =FCI.ClsGrpId
                    INNER JOIN 
	                    ExamInfo AS EXI ON FCI.ExInSl = EXI.ExInSl
                    LEFT JOIN
                        ParticularsInfo AS PTI ON PTI.Pid = PC.Pid
                    LEFT JOIN PaymentStores PS ON PS.StoreNameKey= FCI.StoreNameKey

                    WHERE
                        PTI.PStatus = 1 and 
						FCI.FeeCatId = "+ feeCatId +@"
                    GROUP BY
                        FCI.FeeCatId,
                        BI.BatchName,
                        FCI.FeeCatName,
                        CONVERT(VARCHAR, DP.DateOfStart, 105),
                        CONVERT(VARCHAR, DP.DateOfEnd, 105),
                        FCI.FeeFine,
	                    PS.StoreTitle,
	                    FCI.PaymentFor,
	                    TG.GroupName,
	                    EXI.ExName

                    ORDER BY
                        FCI.FeeCatId DESC


                    ";
                dt = CRUD.ReturnTableNull(sqlCmd);

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    //lblFeeCatId.Text = "FeeCategory: " + row["FeeCatId"].ToString();
                    lblBatchName.Text = "Batch Name : "+row["BatchName"].ToString();
                    lblFeeCatName.Text = "Fees Catagory Name : "+row["FeeCatName"].ToString();
                    lblDateOfStart.Text ="Starding Date :"+  row["DateOfStart"].ToString();
                    lblDateOfEnd.Text = "Ending Date :"+ row["DateOfEnd"].ToString();
                    lblFeeFine.Text = "Fee Fine :" + row["FeeFine"].ToString();
                    lblPaymentStore.Text = "Payment Store :" + row["StoreTitle"].ToString();
                    lblTotalAmount.Text = "Total Amount :" + row["TotalAmount"].ToString();
                    lblPaymentFor.Text = "Payment For :" + row["PaymentFor"].ToString();
                    lblGroup.Text = "Group :" + row["GroupName"].ToString();
                    lblExam.Text = "Exam :" + row["ExName"].ToString();
                    // Assume 'totalAmount' is a variable containing the total amount

                    ViewState["TotalAmount"] = row["TotalAmount"].ToString();


                }

                sqlCmd = "select pc.FeeCatId,PC.PId,pc.Amount,PSI.PName as Particular from ParticularsCategory as pc LEFT Join ParticularsInfo as psi on psi.PId=pc.PId where FeeCatId=" + feeCatId + @"";
                 dt = CRUD.ReturnTableNull(sqlCmd);
                gvParticularDetailes.DataSource = dt;
                gvParticularDetailes.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }


        private void EditloadFeesCategoryDetailes(int feeCatId)
        {
            try
            {

                // Get other values as needed from DataKeys

                sqlCmd = @"SELECT
                        FCI.FeeCatId,
                        FCI.BatchId,
                        FCI.FeeFine,
                        FCI.FeeCatName,
                        FCI.ExInSl,
                        FCI.PaymentFor,
                        FCI.ClsGrpId,
                        FCI.StoreNameKey,
	                    BTI.BatchId,
	                    BTI.ClassID,

                        CONVERT(VARCHAR, DP.DateOfStart, 105) AS DateOfStart,
                        CONVERT(VARCHAR, DP.DateOfEnd, 105) AS DateOfEnd
                    FROM
                        FeesCategoryInfo AS FCI
                    INNER JOIN
                        DateOfPayment AS DP ON FCI.FeeCatId = DP.FeeCatId
                    LEFT JOIN
                        BatchInfo AS BTI ON FCI.BatchId = BTI.BatchId
						where FCI.FeeCatId = " + feeCatId + @" ";

                dt = CRUD.ReturnTableNull(sqlCmd);

                if (dt.Rows.Count > 0) 
                {
                    DataRow row = dt.Rows[0];



                    //lblFeeCatId.Text = "FeeCategory: " + row["FeeCatId"].ToString();
                    if (dlBatchName != null && dlBatchName.Items.Count > 0)
                    {
                        string batchId = row["BatchId"].ToString();
                        string classId = row["ClassId"].ToString();
                        string BatchIdjoinClassId = batchId + "_" + classId;

                        dlBatchName.SelectedValue = BatchIdjoinClassId;
                    }
                    txtFeesFine.Text = row["FeeFine"].ToString();
                    txtFeesCatName.Text = row["FeeCatName"].ToString();
                    ddlExam.SelectedValue = row["ExInSl"].ToString();
                    ddlPaymentFor.SelectedValue = row["PaymentFor"].ToString();
                    txtDateStart.Text =  row["DateOfStart"].ToString();
                    txtDateEnd.Text =  row["DateOfEnd"].ToString();

                    ddlGroup.SelectedValue = row["ClsGrpId"].ToString();
                    ddlPaymentStore.SelectedValue = row["StoreNameKey"].ToString();
   
                }


                sqlCmd = "select pc.FeeCatId,PC.PId,pc.Amount,PSI.PName as Particular from ParticularsCategory as pc LEFT Join ParticularsInfo as psi on psi.PId=pc.PId where FeeCatId=" + feeCatId + @"";
                dt = CRUD.ReturnTableNull(sqlCmd);

                ViewState["__Data__"] = dt;

                gvParticularInfo.DataSource = dt;
                gvParticularInfo.DataBind();



                // Accessing Total Amount in Code-Behind
                // Assuming lblTotalAmount is a Label control

            }
            catch (Exception ex)
            {

                throw;
            }
        }




        protected void gvParticularList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           

            if (e.CommandName == "ShowDetailes")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument); // get the index of the row

                // Access DataKeys using the row index
                int feeCatId = Convert.ToInt32(gvParticularList.DataKeys[rowIndex]["FeeCatId"]);
                loadFeesCategoryDetailes(feeCatId);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "showModal();", true);



            }
            else if(e.CommandName == "Alter")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument); // get the index of the row

                // Access DataKeys using the row index
                int feeCatId = Convert.ToInt32(gvParticularList.DataKeys[rowIndex]["FeeCatId"]);
                ViewState["__FeeCatId"] = feeCatId;
                EditloadFeesCategoryDetailes(feeCatId);

                if (listPanel.Visible)
                {
                    listPanel.Visible = false;
                    entryPanel.Visible = true;
                    btnAddFeesCat.Text = "Back To LIst";
                    btnSave.Text = "Update";
                }

             }
        }




        protected void gvParticularList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvParticularList.PageIndex = e.NewPageIndex;
            loadFeesCategoryInfo();


        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = Convert.ToInt32(ddlPageSize.SelectedValue); 
            gvParticularList.PageSize = pageSize;
            loadFeesCategoryInfo();  
    
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "showModal();", true);
        }


        protected void btnParticularSave_Click(object sender, EventArgs e)
        {
            if (txtParticular.Text.Trim().Length >0)
            {

                string query = " Insert into  ParticularsInfo(PName,PStatus) Values ('" + txtParticular.Text + "',1 )";
                bool IsRowInsert= CRUD.ExecuteNonQuery(query);

                if (IsRowInsert){
                    lblMessage.InnerText = "success->Particular save successful ";
                    commonTask.LoadParticular(ddlParticular);
                    txtParticular.Text = "";
                }
                else
                {
                    lblMessage.InnerText = "error->This Particular is already exist!";
                    txtParticular.Text = "";

                }
            }
            else
            {
                lblMessage.InnerText = "warning->Please insert particular name";

            }
        }
    }
}