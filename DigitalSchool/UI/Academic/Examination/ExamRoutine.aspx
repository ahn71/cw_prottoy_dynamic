<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ExamRoutine.aspx.cs" Inherits="DS.UI.Academic.Examination.ExamRoutine" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   

    <style>
       
        th {
            background: #ddd !important;
        }

        td, th {
           /* text-align: center;*/
            border: 1px solid #ddd !important;
        }

        .table {
            border: 0 !important;
            margin: 10px 0;
        }
        .border-1{
            border:1px solid #ddd;
        }


span#MainContent_lblType {
    font-weight: 700;
    display: block;
    margin-top: -2px;
}
.table-wrapper tbody tr td label{
    padding:0 10px;
    display:inline-block;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:UpdatePanel ID="uplMessage" runat="server">
        <ContentTemplate>
            <p class="message" id="lblMessage" clientidmode="Static" runat="server"></p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-md-12">
            <!--breadcrumbs start -->
            <ul class="breadcrumb">
                <li>
                   <%-- <a runat="server" href="~/Dashboard.aspx">--%>
                    <a runat="server" id="aDashboard">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>                
                 <%--<li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>--%>                
                <%--<li><a runat="server" href="~/UI/Academic/Examination/ExamHome.aspx">Examination Module</a></li>--%>
                 <li>  <a runat="server" id="aAcademicHome" >Academic Module</a></li>
                <li><a runat="server" id="aExamHome">Examination Module</a></li> 
                <li class="active">Exam Routine</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
    <div class="row" id="divSearchPanel" runat="server">
        
            <div class="tgPanel">
                <div class="tgPanelHead">
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlBatch" />
                        <asp:AsyncPostBackTrigger ControlID="ddlGroup" />
                        <asp:AsyncPostBackTrigger ControlID="ddlExamId" />                        
                        <asp:AsyncPostBackTrigger ControlID="gvExamRoutine" />                        
                    </Triggers>
                    <ContentTemplate>
                       <%-- <div class="row tbl-controlPanel" >
                            <div class="col-sm-8 col-sm-offset-2" runat="server" id="tblOp">--%>

                                <div class="row">
                             <div class="col-lg-3">
                                        
                                         <label>Shift</label>
                                      <asp:DropDownList ID="ddlShift" runat="server" CssClass="input  controlLengthMin form-control" ClientIDMode="Static">                                    
                                  </asp:DropDownList>
                                                           
                               </div>
                               
                              <div class="col-lg-3">
                                   
                                    <label>Batch</label>    
                                  <asp:DropDownList ID="ddlBatch" runat="server" ClientIDMode="Static" CssClass="input controlLengthMin form-control" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                  
                               </div>
                                 <div class="col-lg-3">
                                   
                                    <labe>Group</labe>
                                   <asp:DropDownList ID="ddlGroup" runat="server" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged" CssClass="input controlLengthMin form-control" Enabled="false" >
                                    </asp:DropDownList>
                                
                                 </div>  
                                  <div class="col-lg-3">
                                 
                                    <label>Exam Id</label>
                                   
                                        <asp:DropDownList ID="ddlExamId" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control"
                                         AutoPostBack="True" OnSelectedIndexChanged="ddlExamId_SelectedIndexChanged">
                                        <asp:ListItem Value="0">...Select Exam Id...</asp:ListItem>
                                    </asp:DropDownList>
                              
                               
                                  </div>
                                 <div class="col-lg-3">
                                       
                                    <label>Subject</label>
                                   
                                        <asp:DropDownList ID="ddlSubject" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control">         
                                    </asp:DropDownList>
                                  
                                   </div>

                                    <div class="col-lg-3">
                                
                                    <label>Date</label>
                                 
                                        <asp:TextBox ID="txtDate" runat="server" ClientIDMode="Static" AutoComplete="off" CssClass="input form-control"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtDate" Format="dd-MM-yyyy" runat="server"></asp:CalendarExtender>                                           
                                  
                                 </div>

                                    <div class="col-lg-3">
                                         
                                    <label>Start Time</label>
                                     <br />
                                   <asp:TextBox runat="server" ID="txtStartime"   type="time" CssClass="timepicker  input form-control"></asp:TextBox>
                                 
                                     </div>

                                    <div class="col-lg-3">
                                       
                                    <label>End Time</label>
                                      <br />

                                    <asp:TextBox runat="server" ID="txtEndTime" type="time"  CssClass="timepicker input form-control" ></asp:TextBox>                                        
                                   
                                    </div>

                                    <div class="col-lg-3 mt-2 d-flex gap-3">
                                  <asp:CheckBox Visible="false" runat="server"  ID="chkForCoutAsFinalResult" />
                                    
                                        <asp:Button ID="btnSave" Text="Save" ClientIDMode="Static" runat="server" 
                                          OnClick="btnSave_Click" CssClass="btn btn-primary" OnClientClick="return validateInputs();"/>  

                       <asp:Button ID="btnPrintPreview" runat="server" Text="Print" CssClass="btn btn-primary mr5"  ClientIDMode="Static" OnClick="btnPrintPreview_Click" />                             
                                   </div>

                                    <div class="col-sm-12 col-sm-offset-2">
                             <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>                           
                                    <span style="font-family: 'Times New Roman'; font-size: 1.2em; padding:5px; color: #1fb5ad; font-weight: bold; float: left">
                                        <p>Wait please,It's working...</p>
                                    </span>
                                    <img class="LoadingImg_" src="../../../../../AssetsNew/images/input-spinner.gif" />
                                    <div class="clearfix"></div>
                                </ProgressTemplate>                        
                            </asp:UpdateProgress>
                                    </div>                                    
                                </div>     
                                    </div>
                               </div>
                          <%--  </div>
                        </div>--%>
                                                                      
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>



            <div class="tgPanel">
                 <asp:UpdatePanel ID="up2" runat="server" UpdateMode="Conditional">
         <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlExamId" />
                <asp:AsyncPostBackTrigger ControlID="btnSave" />
            </Triggers>
            <ContentTemplate>
                 <asp:GridView ID="gvExamRoutine" runat="server" AutoGenerateColumns="false" DataKeyNames="ExamRoutineID,SubID,CourseID,ExamID,ClsGrpID,BatchID,ShiftID" 
                     CssClass="table table-bordered" BackColor="White" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" OnRowCommand="gvExamRoutine_RowCommand" Width="103%">
                     <%--<PagerStyle CssClass="gridview" />--%>
            <Columns>
                  <asp:TemplateField HeaderText="SL"> 
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
                <asp:BoundField DataField="Subject" HeaderText="Subject" />
               <asp:BoundField DataField="ExamDate" HeaderText="Date" />
                <asp:BoundField DataField="ExamDay" HeaderText="Day" />               
                <asp:BoundField DataField="ExamStartTime" HeaderText="Start Time" />                
                <asp:BoundField DataField="ExamEndTime" HeaderText="EndTime" />                                 
                 <asp:TemplateField HeaderText="Edit" >
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" CommandName="Change" CommandArgument="<%#((GridViewRow)Container).RowIndex%>" Text="Edit" CssClass="btn btn-primary" />

                                </ItemTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Remove" >
                                <ItemTemplate>
                                    <asp:Button ID="btnRemove" runat="server" CommandName="Remove" CommandArgument="<%#((GridViewRow)Container).RowIndex%>" Text="Remove" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure to remove?');" />    </ItemTemplate>
                            </asp:TemplateField>
            </Columns>
        </asp:GridView>
                </ContentTemplate>
                </asp:UpdatePanel>                
                    </div>
        </div>
       
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
   
</asp:Content>
