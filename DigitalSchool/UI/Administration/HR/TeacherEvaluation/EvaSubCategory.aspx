﻿<%@ Page Title="Add Sub Category" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="EvaSubCategory.aspx.cs" Inherits="DS.UI.Administration.HR.TeacherEvaluation.EvaSubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .tgPanel {
            width: 100%;
        }
        .tbl-controlPanel td:first-child{
            text-align: right;
            padding-right: 5px;
        }
        input[type="checkbox"]{
            margin: 7px;
        }
         .dataTables_length, .dataTables_filter {
          display: none;
          padding: 15px;
        }
        #tblClassList_info {
             display: none;
            padding: 15px;
        }
        #tblClassList_paginate {
            display: none;
            padding: 15px;
        }
        .no-footer {
           border-bottom: 1px solid #ecedee !important;
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
                    <a id="A1" runat="server" href="~/Dashboard.aspx">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>
                <li><a id="A2" runat="server" href="~/UI/Administration/AdministrationHome.aspx">Administration Module</a></li>
                <li><a id="A3" runat="server" href="~/UI/Administration/HR/hrHome.aspx">Human Resource Module</a></li>  
                <li><a id="A4" runat="server" href="~/UI/Administration/HR/TeacherEvaluation/EvaHome.aspx">Teacher Evaluation</a></li> 
                <li class="active">Add Category</li>              
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
    <div class="">
        <div class="row">
            <div class="col-md-6">
                <h4 class="text-right" style="float:left">Category List</h4>
                 <div class="dataTables_filter_New" style="float: right;margin-right:0px;">
                     <label>
                         Search:
                         <input type="text" class="Search_New" placeholder="type here" />
                     </label>
                 </div>                
            </div>
            <div class="col-md-6"></div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="tgPanel">
                        <div id="divCategoryList" class="datatables_wrapper" runat="server" 
                            style="width: 100%; height: auto; max-height: 500px; overflow: auto; overflow-x: hidden;"></div>
                            </div>
                        <asp:HiddenField ID="lblSubCategoryId" ClientIDMode="Static" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-6">
                <div class="tgPanel">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="tgPanelHead">Add Sub Category</div>
                        <table class="tbl-controlPanel">     
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlCategory" ClientIDMode="Static" CssClass="input form-control"></asp:DropDownList>
                                </td>
                            </tr>                       
                            <tr>
                                <td>
                                   Sub Category
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSubCategory" runat="server" ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>
                                </td>
                            </tr>                            
                            <tr>
                                <td>
                                    Ordering
                                </td>
                                <td>
                                   <asp:TextBox ID="txtOrdering" runat="server" ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>                                 
                                </td>
                            </tr>   
                             <tr>
                                <td>
                                    Status
                                </td>
                                <td>
                                   <asp:CheckBox runat="server" ClientIDMode="static" ID="ckbStatus" Checked="true" />                              
                                </td>
                            </tr>                         
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" ClientIDMode="Static"
                                        OnClientClick="return validateInputs();" OnClick="btnSave_Click" />
                                    <input id="tnReset" type="reset" value="Reset" class="btn btn-default" onclick="clearIt();" />
                                </td>
                            </tr>                            
                        </table>                        
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            </div>
        </div>        
    </div>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'tblClassList', '');
                
                

            });
            $('#tblClassList').dataTable({
                "iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        });
        function loaddatatable() {
            $('#tblClassList').dataTable({
                "iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        }
        function validateInputs() {
           var i= $("#ddlCategory option:selected").index();
           if (i < 1) {               
               showMessage('Select Category', 'error');                     
               return false;
           }
            if (validateText('txtSubCategory', 1, 50, 'Enter Sub Category Name') == false) return false;
            if (validateText('txtOrdering', 1, 50, 'Enter Order No') == false) return false;
            return true;
        }
        function editCategory(id,cid) {
            $('#lblSubCategoryId').val(id);
            var strCategory = $('#r_' + id + ' td:first-child').html();
            $('#txtSubCategory').val(strCategory);
            $("#ddlCategory option[value='" + cid + "']").attr("selected", "selected");
            var strO = $('#r_' + id + ' td:nth-child(3)').html();
            $('#txtOrdering').val(strO);
            var status = $('#r_' + id + ' td:nth-child(4)').html();
            if(status=='Active')
                $('#ckbStatus').prop('checked', true);
            else
            $('#ckbStatus').prop('checked', false);
            $("#btnSave").val('Update');
        }
        function clearIt() {
            $('#lblSubCategoryId').val('');
            $('#txtCategory').val('');
            $('#txtOrdering').val('');
            $("#btnSave").val('Save');
        }
    </script>
</asp:Content>
