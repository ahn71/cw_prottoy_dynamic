﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DS.DAL;
using System.Data;
namespace DS
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //---url bind---
            aDashboard.HRef = "~/"+Classes.Routing.DashboardRouteUrl;            
            aAcademicHome.HRef = "~/"+Classes.Routing.AcademicRouteUrl;
            aAdministrationHome.HRef = "~/"+Classes.Routing.AdministrationRouteUrl;

            aStudent.HRef = "~/" + Classes.Routing.StudentHomeRouteUrl;
            aExamHome.HRef = "~/" + Classes.Routing.ExaminationHomeRouteUrl;

            aWebsite.HRef = "~/" + Classes.Routing.WSHomeRouteUrl;

            //---url bind end---
            HttpCookie getCookies = Request.Cookies["userInfoSchool"];
            if (getCookies == null || getCookies.Value == "")
            {
                Response.Redirect("~/UserLogin.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    
                    Session["__UserTypeId__"] = getCookies["__UserTypeId__"].ToString();                                
                    if (Session["__UserTypeId__"].ToString() != null)
                    {
                        DataTable dt = CRUD.ReturnTableNull("select AcademicModule,AdministrationModule,NotificationModule,ReportsModule from UserTypeInfo_ModulePrivilege where UserTypeId=" + Session["__UserTypeId__"].ToString().ToString() + "");
                        if (dt!=null && dt.Rows.Count > 0)
                        {
                            if (bool.Parse(dt.Rows[0]["AcademicModule"].ToString()).Equals(false)) AcademicModuleDB.Visible = false;
                            if (bool.Parse(dt.Rows[0]["AdministrationModule"].ToString()).Equals(false)) AdministrationModuleDB.Visible = false;
                            if (bool.Parse(dt.Rows[0]["NotificationModule"].ToString()).Equals(false)) NotificationModuleDB.Visible = false;
                            if (bool.Parse(dt.Rows[0]["ReportsModule"].ToString()).Equals(false)) ReportsModuleDB.Visible = false;
                        }
                        
                    }
                    else { }
                }
            }
        }

        private void BindTimeDayMonthYear()
        {
            
        }       
    }
}