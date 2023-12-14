﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="StdActivation.aspx.cs" Inherits="DS.UI.Academic.Students.StdActivation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        .tgPanel {
            width: 100%;
        }
        .controlLength {
            /*width: 150px;*/
        }
        .tbl-controlPanel td:nth-child(1),
        .tbl-controlPanel td:nth-child(3),
        .tbl-controlPanel td:nth-child(5) {
            /*padding: 0px 5px;*/
        }        
        .litleMargin {
            /*margin-left: 5px;*/
        }
        .btn {
            /*margin: 3px;*/
        }
        .tbl-controlPanel {
             /*width:872px;*/
        }
        .kk {
           width:140px;
        }
        .boX {
            text-align:center;
        }
        div.col-sm-8.col-sm-offset-2.boX div.form-inline div.form-group label{ text-align: left; }
       
        @media only screen and (min-width: 320px) and (max-width: 479px) {
            
            .select2.select2-container{
                display: block;width: 250px!important;
            }
            .pagination {
                float:left;
                
            }
           
        }
        table.dataTable.tablesorter thead th,
        table.dataTable.tablesorter tfoot th {
            background-color: #d6e9f8;
            text-align: left;
            border: 1px solid #ccc;
            font-size: 11px;
            padding: 4px;
            color: #333;
        }
        .size > img {
          height: 20px;
        }
         input.Search_New{
            float:right;

        }
         @media only screen and (max-width: 600px) {
          .kk {
                 width: 100%!important;
            }
          .Search_New{
              width:100%!important;
          }
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
                    <%--<a runat="server" href="~/Dashboard.aspx">--%>
                    <a runat="server" id="aDashboard">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li> 
                <%--<li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Students/StdHome.aspx">Student Module</a></li> --%> 
                
                <li><a runat="server" id="aAcademicHome">Academic Module</a></li>
                <li><a runat="server" id="aStudentHome">Student Module</a></li> 
                <li class="active">Students Active & Inactive</li>                              
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
    <div class="tgPanel">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />                
                <asp:AsyncPostBackTrigger ControlID="ddlClass" />
                <asp:AsyncPostBackTrigger ControlID="dlGroup" />                
            </Triggers>
            <ContentTemplate>
               
              <div class="row tbl-controlPanel"> 
		        <div class="col-xs-12 col-sm-10 col-sm-offset-1 boX">
			        <div class="form-inline">
                          <div class="form-group">
					         <label for="exampleInputName2"></label>
					            <asp:RadioButtonList runat="server" ID="rblActiveInActive" ClientIDMode="Static" RepeatDirection="Horizontal" >
                                    <asp:ListItem Value="1" Selected="True">Active</asp:ListItem>
                                    <asp:ListItem Value="0">Inactive</asp:ListItem>
					            </asp:RadioButtonList>
				         </div>
                        </div>
			        <div class="form-inline">
                       <div class="form-group">
					         <label for="exampleInputName2">Year</label>
					            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control kk" ClientIDMode="Static" >                 
                            </asp:DropDownList>
				         </div>
				         <div class="form-group">
					         <label for="exampleInputName2">Shift</label>
					            <asp:DropDownList ID="dlShift" runat="server" CssClass="form-control kk" ClientIDMode="Static" >
                                <asp:ListItem>All</asp:ListItem>                                
                            </asp:DropDownList>
				         </div>
				        <%--<div class="form-group">
					         <label for="exampleInputName2">Batch</label>
                             <asp:DropDownList ID="dlBatch" runat="server" CssClass="form-control kk"
                                AutoPostBack="true"  OnSelectedIndexChanged="dlBatch_SelectedIndexChanged" ClientIDMode="Static" >
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
				         </div>--%>
                        <div class="form-group">
					         <label for="exampleInputName2">Class</label>
                             <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control kk"
                                AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" >
                                <asp:ListItem Value="00">All</asp:ListItem>
                            </asp:DropDownList>
				         </div>
				        <div class="form-group">
					         <label for="exampleInputName2">Group</label>
                             <asp:DropDownList ID="dlGroup" runat="server" CssClass="form-control kk" 
                               AutoPostBack="true"  OnSelectedIndexChanged="dlGroup_SelectedIndexChanged" ClientIDMode="Static">
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
				         </div>
				        <div class="form-group">
					         <label for="exampleInputName2">Section</label>
                            <asp:DropDownList ID="dlSection" runat="server" CssClass="form-control kk" ClientIDMode="Static">
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
				         </div>
				        <div class="form-group">
					         <label for="exampleInputName2"></label>
					            <asp:Button ID="btnSearch"  runat="server" Text="Search" ClientIDMode="Static" CssClass="btn btn-primary litleMargin" 
                                OnClientClick="return btnSearch_validation();" OnClick="btnSearch_Click" />
				         </div>
				        
			        </div>
	          </div>
         </div>
                <div class="row tbl-controlPanel"> 
		        <div class="col-md-12 boX">
			        <div class="form-inline">
                        <input type="text"  class="Search_New form-control" style="color:black"  placeholder="type here to search" />
                        </div>
                    </div>
                 </div>
             
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="tgPanel">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                </Triggers>
                <ContentTemplate>
                    <div class="widget">
                        <asp:GridView HeaderStyle-BackColor="#23282C" ID="gvForApprovedList" runat="server" AutoGenerateColumns="false" DataKeyNames="StudentId,BatchId"  HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true" HeaderStyle-Height="25px" HeaderStyle-Font-Size="14px" Width="100%" OnRowCommand="gvForApprovedList_RowCommand" >
                        <%-- <PagerStyle CssClass="gridview" />--%>
                          <Columns>  
                              <asp:TemplateField HeaderText="SL">
                                <ItemTemplate>
                                     <%# Container.DataItemIndex + 1 %>                                  
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>                         
                          
                                 <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                 <asp:BoundField DataField="ClassName" HeaderText="Class" />
                                 <asp:BoundField DataField="GroupName" HeaderText="Group"  />
                                 <asp:BoundField DataField="SectionName" HeaderText="Section"  />
                                 <asp:BoundField DataField="ShiftName" HeaderText="Shift"  />
                                 <asp:BoundField DataField="Gender" HeaderText="Gender"/>
                                 <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                                 <%--<asp:BoundField DataField="EmpStatusName" HeaderText="Status" ItemStyle-HorizontalAlign="Center" />--%>                                
                              <asp:TemplateField HeaderText="Note" HeaderStyle-Width="30px" >
                                  <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtNote" CssClass="dropdown-wrapper"  ></asp:TextBox>
                                  </ItemTemplate>
                              </asp:TemplateField> 
                               <asp:TemplateField HeaderText="Action" HeaderStyle-Width="30px">
                                  <ItemTemplate>
<%--                                      <asp:Button ID="btnInActive" runat="server" CommandName="InActive" Font-Bold="true" ForeColor="red" Text="In Active" Width="55px" Height="30px" OnClientClick="return confirm('Do you want to inactive this student ?')" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' />--%>
                                  <asp:CheckBox ID="cbkInactive" runat="server" 
                                                CommandName="InActive" AutoPostBack="true"
                                                onchange="return confirm('Do you want to inactive this student ?')" 
                                                CommandArgument='<%#((GridViewRow)Container).RowIndex%>' />

<%--                                      <asp:CheckBox ID="CbkInActive" runat="server" CommandName="InActive" onchange="return confirm('Do you want to inactive this student ?')" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' />--%>
                                  </ItemTemplate>
                              </asp:TemplateField>                               
                              <asp:TemplateField HeaderText="Action" HeaderStyle-Width="30px">
                                  <ItemTemplate>
                                      <asp:Button ID="btnActive" runat="server" CommandName="Active"  Font-Bold="true" ForeColor="Green" Text="Active" Width="55px" Height="30px" OnClientClick="return confirm('Do you want to inactive this student ?')" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' />
                                  </ItemTemplate>
                              </asp:TemplateField>  
                          </Columns>
                     </asp:GridView>
                        <div id="divStudentDetails" class="datatables_wrapper" runat="server" style="width: 100%; max-height:680px; overflow-y: scroll;overflow-x: hidden;"></div>
                    </div>
                    
                    </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        function btnSearch_validation() {
            if (validateCombo('dlBatch', "0", 'Select a Batch') == false) return false;
            if (validateCombo('dlSection', "0", 'Select a Section Name') == false) return false;
            if (validateCombo('dlShift', "0", 'Select a Shift Name') == false) return false;
            return true;
        };
           $(document).ready(function () {
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'MainContent_gvForApprovedList', '');
            });
        });
        //$(document).ready(function () {
        //    $("#dlShift").select2();
        //    $("#dlBatch").select2();
        //    $("#dlGroup").select2();
        //    $("#dlSection").select2();
        //    $('#tblStudentInfo').dataTable({
        //        "iDisplayLength": 10,
        //        "lengthMenu": [10, 20, 30, 40, 50, 100]
        //    });
        //});
        function loadStudentInfo() {
            $('#tblStudentInfo').dataTable({
                "iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        }
        function editStudent(studentId) {
            goURL('/UI/Academic/Students/OldStudentEntry.aspx?StudentId=' + studentId + "&Edit=True");
        }
        function viewStudent(studentId) {
            goURL('/UI/Academic/Students/StdProfile.aspx?StudentId=' + studentId);
        }
        function onMouseOver(rowIndex) {
            var gv = document.getElementById("gvAdmissionDetails");
            var rowElement = gv.rows[rowIndex];
            rowElement.style.backgroundColor = "#c8e4b6";
            //rowElement.cells[1].style.backgroundColor = "green";
        }
        function onMouseOut(rowIndex) {
            var gv = document.getElementById("gvAdmissionDetails");
            var rowElement = gv.rows[rowIndex];
            rowElement.style.backgroundColor = "#fff";
            //rowElement.cells[1].style.backgroundColor = "#fff";
        }
        function load(id) {
            $("#dlShift").select2();
            $("#dlBatch").select2();
            $("#dlGroup").select2();
            $("#dlSection").select2();
            if (id == 1) {
                loadStudentInfo();
            }
        }
    </script>
</asp:Content>
