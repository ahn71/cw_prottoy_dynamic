<%@ Page Title="Grading" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Grading.aspx.cs" Inherits="DS.UI.Academics.Examination.Grading" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tgPanel {
            width:100%;
        }
        .dataTables_length, .dataTables_filter {
          display: none;
          
        }
        #tblClassList_info {
             display: none;
           
        }
        #tblClassList_paginate {
            display: none;
           
        }
        .no-footer {
           border-bottom: 1px solid #ecedee !important;
        }
        #tblClassList {
        margin-top:0px!important;
        margin-bottom:0px!important;
        
        }

        
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

        .update-icon{
    display:inline-block;
    padding: 0 6px;
    height: 30px;
    width: 30px;
    line-height:30px;
    text-align:center;
    border-radius: 50%;
    background:#99dde7;
    color:#1e1e1e;
    font-size:12px;
    opacity:0;
    transition:0.1s all ease;
}
  td:hover .update-icon{
    opacity:1;
  }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="uplMessage" runat="server">
        <ContentTemplate>
            <p class="message" id="lblMessage" clientidmode="Static" runat="server"></p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="lblGId" ClientIDMode="Static" runat="server" />
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
                <li class="active">Grading</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
 
            <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-4">
                <h4 class="text-right" style="float: left;">Grading Details</h4>
            </div>
            <div class="col-md-6"></div>
        </div>
           
    
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
              <Triggers>
                  <asp:AsyncPostBackTrigger ControlID="btnSave" />
              </Triggers>
              <ContentTemplate>
          <div class="tgPanel">
                    <div class="tgPanelHead">Add Grading</div>
                    <div class="row">
                       
                            <div class="col-lg-3">
                              
                                <label>Grade</label>
                                   <asp:TextBox ID="txtGrade" runat="server" ClientIDMode="Static"
                                     CssClass="input form-control"></asp:TextBox>
                                </div>
                            <div class="col-lg-3">
                                <label>Mark Min</label>
                               
                                    <asp:TextBox ID="txtGradeMin" runat="server" ClientIDMode="Static"
                                     CssClass="input form-control"></asp:TextBox>
                                </div>

                           <div class="col-lg-3">
                                <label>Mark Max</label>
                               
                                    <asp:TextBox ID="txtGradeMax" runat="server"
                                    ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>
                                </div>
                           
                           <div class="col-lg-3">
                              
                                <label>Point Min</label>
                                
                                    <asp:TextBox ID="txtGPointMin" runat="server" ClientIDMode="Static"
                                     CssClass="input form-control"></asp:TextBox>
                           </div>
                           <div class="col-lg-3">
                             <label>Point Max</label>
                                  <asp:TextBox ID="txtGPointMax" runat="server" ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>
                        </div>
                          
                           <div class="col-lg-3">
                                <label>Comment</label>
                                <asp:TextBox ID="txtComment" runat="server" ClientIDMode="Static"
                                     CssClass="input form-control"></asp:TextBox>
                                </div>
                           
                          <div class="col-lg-3 mt-3">
                                    <asp:Button ID="btnSave" ClientIDMode="Static" CssClass="btn btn-primary" OnClientClick="return validateInputs();"
                                    runat="server" Text="Save" OnClick="btnSave_Click" /> 
                           </div>
                           
                        </div>
                  
                                      
                </div>
         
        

 
                  <div class="gvTable">
                      <asp:GridView runat="server" ID="gvGradeList" AutoGenerateColumns="False" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" GridLines="Vertical" DataKeyNames="GId" PagerStyle-CssClass="pgr"  Width="100%"
                          OnRowCommand="gvGradeList_RowCommand">

                          <Columns>
                         <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                 <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Grade">
                        <ItemTemplate>
                            <asp:Label ID="lblGrade" runat="server" Text='<%# Eval("GName") %>'></asp:Label>
                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
                             <span class="update-icon" ><i class="fas fa-edit"></i></span>
                               </asp:LinkButton>
                        </ItemTemplate>          
                    </asp:TemplateField>   
 
                           <asp:TemplateField HeaderText="Mark min">
                                <ItemTemplate>
                              <asp:Label ID="lblMarkMin" runat="server" Text='<%# Eval("GMarkMin") %>'></asp:Label>       
                          </ItemTemplate>          
                      </asp:TemplateField>  

                          <asp:TemplateField HeaderText="Mark max">
                            <ItemTemplate>
                          <asp:Label ID="lblmarkMax" runat="server" Text='<%# Eval("GMarkMax") %>'></asp:Label>       
                      </ItemTemplate>          
                </asp:TemplateField>  

                           <asp:TemplateField HeaderText="Point min">
                        <ItemTemplate>
                      <asp:Label ID="lblPointMin" runat="server" Text='<%# Eval("GPointMin") %>'></asp:Label>       
                  </ItemTemplate>          
                    </asp:TemplateField>  


                           <asp:TemplateField HeaderText="Point Max">
            <ItemTemplate>
          <asp:Label ID="lblGpointMax" runat="server" Text='<%# Eval("GPointMax") %>'></asp:Label>       
      </ItemTemplate>          
  </asp:TemplateField>  


                           <asp:TemplateField HeaderText="Comment">
                                <ItemTemplate>
                            <asp:Label ID="lblComment" runat="server" Text='<%# Eval("Comment") %>'>
                              </asp:Label>       
                        </ItemTemplate>          
                        </asp:TemplateField>  


                   </Columns>
               </asp:GridView>

                  </div>
              </ContentTemplate>
          </asp:UpdatePanel>
  

 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
       <script type="text/javascript">
           //$(document).ready(function () {
           //    $('#tblClassList').dataTable({
           //        "iDisplayLength": 10,
           //        "lengthMenu": [10, 20, 30, 40, 50, 100]
           //    });         
           //});
           //function loaddatatable() {
           //    $('#tblClassList').dataTable({
           //        "iDisplayLength": 10,
           //        "lengthMenu": [10, 20, 30, 40, 50, 100]
           //    });
           //}
           function validateInputs() {
               if (validateText('txtGrade', 1, 15, 'Enter Grade Name') == false) return false;
               if (validateText('txtGradeMin', 1, 15, 'Enter Grade Minimum Range') == false) return false;
               if (validateText('txtGradeMax', 1, 15, 'Enter Grade Maximum Range') == false) return false;
               if (validateText('txtGPointMin', 1, 15, 'Enter Grade Point Min') == false) return false;
               if (validateText('txtGPointMax', 1, 15, 'Enter Grade Point Max') == false) return false;
               return true;
           }
          

       </script>
</asp:Content>
