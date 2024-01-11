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
            DataTable dt=CRUD.ReturnTableNull(query);
            gvExamList.DataSource = dt;
            gvExamList.DataBind();
        }
       


        protected void btnSave_Click1(object sender, EventArgs e)
        {

        }

        protected void chkSwitchStatus_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}