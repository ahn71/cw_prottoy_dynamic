<%@ Page Title="Fees Category" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="FeesCategoriesInfo.aspx.cs" Inherits="DS.UI.Administration.Finance.FeeManaged.FeesCategoriesInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tgPanel {
            width: 100%;
        }
        .controlLength{
            /*width: 250px;*/
        }
        .tbl-controlPanel td:first-child{
            text-align: right;
            padding-right: 5px;
        }
         /*.dataTables_length, .dataTables_filter {
          display: none;
          padding: 15px;
        }
         #tblParticularCategory_length {
             display: none;
            padding: 15px;
        }
          #tblParticularCategory_filter {
            display: none;
            padding: 15px;
        }
        #tblParticularCategory_info {
             display: none;
            padding: 15px;
        }
        #tblParticularCategory_paginate {
            display: none;
            padding: 15px;
        }
        .no-footer {
           border-bottom: 1px solid #ecedee !important;
        }
        #tblParticularCategory {
        
        margin-top:0px!important;
        margin-bottom:0px!important;
        }*/
         @media (min-width: 320px) and (max-width: 480px) {
             .input{
            color:#000;
            margin-top:10px;
            
         }
        }
        
         .button-panel{
             text-align:right;
             padding:20px;
         }
         .main-panel{
             margin:10px;
         }

            .group-info-box {
                border: 1px solid #c1c1c1;
                padding: 20px;

            }
/*            .group-info-box .control-label{
                padding-top: 6px;
            }
            .group-info-box .group-title {
                margin-top: -34px;
                position: absolute;
                background: #fff;
                padding: 0px 10px;
            }*/
        .particular_section{
            margin:20px;
            padding:10px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            border-radius:10px;

        }
        .add-particular{
            padding:10px;
            color:white;
            background-color:forestgreen;
        }
        .fa-trash {
            color: red;
            font-size: 18px;
            display: block;
            text-align: center;
        }
        .totalLbl{
            display:block;
            text-align:end;

            font-weight:bold;
        }
        .amountStyle{
            font-weight:bold;
        }
        .addFeesCat{
            margin:20px;


        }

        .pagination{
            width:100px;
            text-align:center;
        }

        .pagination a {
           color: white !important;
           background-color:forestgreen;
           padding:7px;
         }

        .modal-body {
            font-size: 13px;
            display: flex;
            justify-content: space-between;
        }
        .modal-right{
            display:inline;

        }
        .modelleft{
            display:inline;
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
                    <a runat="server" href="~/Dashboard.aspx">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>
                <li><a runat="server" href="~/UI/Administration/AdministrationHome.aspx">Administration Module</a></li>
                <li><a runat="server" href="~/UI/Administration/Finance/FinanceHome.aspx">Finance Module</a></li>
                <li><a runat="server" href="~/UI/Administration/Finance/FeeManaged/FeeHome.aspx">Fee Management</a></li>
                <li class="active">Fees Category</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
  

 <div>
            <!-- Your page content -->

     <asp:UpdatePanel runat="server" ID="upFeeCatDetails">
         <Triggers>
             <asp:AsyncPostBackTrigger ControlID="gvParticularList" />
         </Triggers>
         <ContentTemplate>

             <!-- Button trigger modal -->

<!-- Modal -->
             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                             </button>
                         </div>
                         <div class="modal-body">

                             <div class="modelleft">
                                 <asp:Label ID="lblPaymentFor" CssClass="form-control" runat="server" Text=""></asp:Label>
                                 <br />
                               <asp:Label ID="lblFeeCatName" CssClass="form-control" runat="server" Text=""></asp:Label>

                                 <br />
                               <asp:Label ID="lblPaymentStore" CssClass="form-control" runat="server" Text=""></asp:Label>
                                  <br />

                            <asp:Label ID="lblExam" CssClass="form-control" runat="server" Text=""></asp:Label>
                                 <br /> 
                               
                                 <asp:Label ID="lblBatchName" CssClass="form-control" runat="server" Text=""></asp:Label>
                                 
     
                                 <br />



                             </div>


                             <div class="modal-right">
                                 <asp:Label ID="lblGroup" CssClass="form-control" runat="server" Text=""></asp:Label>
                                <br />
                               <asp:Label ID="lblDateOfStart" CssClass="form-control" runat="server" Text=""></asp:Label>
                             <br />
                              <asp:Label ID="lblDateOfEnd" CssClass="form-control" runat="server" Text=""></asp:Label>
                                 <br />
                              

                                 <br />
                                 <asp:Label ID="lblFeeFine" CssClass="form-control" runat="server" Text=""></asp:Label>
                                 <br />


                                 <br />
                              <asp:Label ID="lblTotalAmount" CssClass="form-control" runat="server" Text=""></asp:Label>
                                 <br />
                                 

                             </div>



                        
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                             <button type="button" class="btn btn-primary">Save changes</button>
                         </div>
                     </div>
                 </div>
             </div>

         </ContentTemplate>
     </asp:UpdatePanel>
        </div>

            <asp:HiddenField ID="lblFeesCateId" ClientIDMode="Static" runat="server"/>
            <div class="">
                <div class="row">
                    <div class="col-md-7">
                        <h4 class="text-right" style="float:left">Fees Category Information</h4>
                         <div class="dataTables_filter_New" style="float: right;">
                     <label>
                         Search:
                         <input type="text" class="Search_New" placeholder="type here" />
                     </label>
                 </div>                        
                    </div>
                    <div class="col-md-5"></div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <asp:UpdatePanel runat="server" ID="updatepanelFeesSett" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                                <asp:AsyncPostBackTrigger ControlID="dlBatchName" />
                                <asp:AsyncPostBackTrigger ControlID="ddlPaymentFor" />
                                <asp:AsyncPostBackTrigger ControlID="ddlParticular" />
                                <asp:AsyncPostBackTrigger ControlID="btnAddParticular" />

                          
                            </Triggers>
                            <ContentTemplate>
                                <div class="tgPanel">
                                    <div id="divFeesCategoryList" class="datatables_wrapper" runat="server"
                                        style="width: 100%; height: auto; max-height: 500px; overflow: auto; overflow-x: hidden;">
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <br />


                    


                    <!---------Particular List Section Start -------------------------------------->
                          <asp:Button runat="server" ID="btnAddFeesCat" CssClass="btn btn-success addFeesCat" Text="Add New Fees Catagory +" OnClick="btnAddFeesCat_Click" />
                    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" CssClass="form-control pagination">
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                     
                    </asp:DropDownList> <br />

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                                                   <asp:Panel runat="server" ID="listPanel">

                        <asp:GridView ID="gvParticularList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                            CssClass="table table-hover table-striped" Width="100%"
                            OnRowCommand="gvParticularList_RowCommand" DataKeyNames="FeeCatId" AllowPaging="true"
                            OnPageIndexChanging="gvParticularList_PageIndexChanging"
                            PagerStyle-NextPageText="&gt;&gt;" PagerStyle-PreviousPageText="&lt;&lt;"
                            PagerStyle-CssClass="pagination">

                            <Columns>
                                         <asp:TemplateField HeaderText="Batch Name">
                                             <ItemTemplate >
                                                 <asp:Label runat="server" ID="lblBtchName" Text=' <%# Eval("BatchName") %>'></asp:Label>

                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Fee Category Name">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="lblFeeCatName" Text=' <%# Eval("FeeCatName") %>'></asp:Label>

                                             </ItemTemplate>
                                            
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Start Date">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="lblDateOFStart" Text=' <%# Eval("DateOfStart") %>'></asp:Label>

                                             </ItemTemplate>

                                         </asp:TemplateField>

                                         <asp:TemplateField HeaderText="End Date">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="lblDateOfEnd" Text=' <%# Eval("DateOfEnd") %>'></asp:Label>

                                             </ItemTemplate>

                                         </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Fee Fine">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="lblFeeFine" Text=' <%# Eval("FeeFine") %>'></asp:Label>

                                             </ItemTemplate>

                                         </asp:TemplateField>
                                <asp:TemplateField HeaderText="Payment Store">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblStorePayment" Text=' <%# Eval("StoreTitle") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>


                                         <asp:TemplateField HeaderText="Total Amount">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="lblTotalAmount" Text=' <%# Eval("TotalAmount") %>'></asp:Label>

                                             </ItemTemplate>

                                         </asp:TemplateField>



                                         <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center">
                                             <ItemTemplate>
                                                 <asp:LinkButton ID="btnEdit" runat="server" CommandName="edit" CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                                       <i class="fa-regular fa-pen-to-square"></i>

                                                 </asp:LinkButton>
                                             </ItemTemplate>
                                         </asp:TemplateField>

                                <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:LinkButton  runat="server" ID="btnShowPopup" ClientIDMode="Static"  AutoPostBack="true" CommandName="ViewDetails"
                                            CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                <i class="fa-regular fa-eye"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                     </Columns>

                                 </asp:GridView>
                    </asp:Panel>
                        </ContentTemplate>

                    </asp:UpdatePanel>







                  

                    
                    <!------Popup End ------------------>







                    <!---------Particular List Section End ---------------------------------------->

                    <div class="col-md-12 m-2">
                        <asp:UpdatePanel runat="server" ID="updatepanel1" UpdateMode="Conditional">
                            <Triggers>    
                                <asp:AsyncPostBackTrigger ControlID="dlBatchName" />
                                <asp:AsyncPostBackTrigger ControlID="ddlPaymentFor" />
                            </Triggers>
                            <ContentTemplate>

                                <asp:Panel runat="server" ID="entryPanel" >
                                    <div class="tgPanel">
                                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="hfAcademicInfo" Value="0" />
                                    <div class="tgPanelHead">Fees Category</div>

                             <div class="main-panel">
                             <div class="row form-group"> <!------------Start----------------->

                              <div class="col-md-4">
                                  <div class="row">
                                      <label for="name" class="col-sm-4 control-label">Payment For <strong class="required">*</strong></label>
                                      <div class="col-sm-8">
                                          <asp:DropDownList ID="ddlPaymentFor" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static"
                                              AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentFor_SelectedIndexChanged">
                                              <%--<asp:ListItem Value="0">...Select...</asp:ListItem>
                                                <asp:ListItem Value="admission">Admission</asp:ListItem>
                                                <asp:ListItem Value="regular">Regular Fee</asp:ListItem>
                                                <asp:ListItem Value="openPayment">Open Payment</asp:ListItem>--%>
                                          </asp:DropDownList>
                                      </div>
                                  </div>
                              </div>

                       
                              <div class="col-md-4">
                                  <div class="row">
                                      <label for="namebn" class="col-sm-4 control-label">Fees Category<strong class="required"></strong></label>
                                      <div class="col-sm-8">
                                          <asp:TextBox ID="txtFeesCatName" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control"></asp:TextBox>
                                      </div>
                                  </div>
                              </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <label for="namebn" class="col-sm-4 control-label">Payment Store<strong class="required">*</strong></label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaymentStore" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>


                           

                     </div><!------------End ----------------->

                             <asp:Panel runat="server" ClientIDMode="Static" ID="pnlAcademicInfo">
                            <div class="row form-group"><!------------Start----------------->

   
                         <div runat="server" class="col-md-4">
                             <div class="row">
                                 <label for="namebn" class="col-sm-4 control-label">Exam<strong class="required">*</strong></label>
                                 <div class="col-sm-8">
                                     <asp:DropDownList ID="ddlExam" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static">
                                     </asp:DropDownList>
                                 </div>
                             </div>
                         </div>


                                <div class="col-md-4">
                                    <div class="row">
                                        <label for="name" class="col-sm-4 control-label">Batch Name<strong class="required">*</strong></label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="dlBatchName" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static" OnSelectedIndexChanged="dlBatchName_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                         <div class="col-md-4">
                             <div class="row">
                                 <label for="namebn" class="col-sm-4 control-label">Group<strong class="required"></strong></label>
                                 <div class="col-sm-8">
                                     <asp:DropDownList ID="ddlGroup" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static">
                                     </asp:DropDownList>
                                 </div>
                             </div>
                         </div>


                            </div>
                         </asp:Panel>
                            <!------------End ----------------->
                     

                            <div class="row form-group"> <!------------Start----------------->                                       
                                <div class="col-md-4">
                                    <div class="row">
                                        <label for="name" class="col-sm-4 control-label">Date of Start<strong class="required">*</strong></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtDateStart" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control"></asp:TextBox>
                                            <asp:CalendarExtender Format="dd-MM-yyyy" ID="CalendarExtender1" runat="server" TargetControlID="txtDateStart"></asp:CalendarExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <label for="namebn" class="col-sm-4 control-label">Date of End<strong class="required"></strong></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtDateEnd" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control"></asp:TextBox>
                                            <asp:CalendarExtender Format="dd-MM-yyyy" ID="CalendarExtender2" runat="server" TargetControlID="txtDateEnd"></asp:CalendarExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <label for="namebn" class="col-sm-4 control-label">Fine Amount<strong class="required">*</strong></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtFeesFine" runat="server" ClientIDMode="Static" Text="0" CssClass="input controlLength form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>




                            <!------------End ----------------->

                        </div>


                             <div class="particular_section">
                             <h6 class="group-title">Particular Section</h6>

                         <div class="row form-group"> <!------------Start----------------->

                                 <div class="col-md-6">
                                     <div class="row">
                                         <label for="namebn" class="col-sm-4 col-lg-3 control-label">Particular <strong class="required">*</strong></label>
                                         <div class="col-sm-8">
                                             <div class="input-group">
                                           <asp:DropDownList ID="ddlParticular" runat="server" CssClass=" form-control" ClientIDMode="Static" AutoPostBack="true" >
<%--                                               <asp:ListItem Value="0">...Select...</asp:ListItem>
                                               <asp:ListItem Value="admission">Admission</asp:ListItem>
                                               <asp:ListItem Value="regular">Regular Fee</asp:ListItem>
                                               <asp:ListItem Value="openPayment">Open Payment</asp:ListItem>--%>
                                                 </asp:DropDownList>

  
                                                 <span class="input-group-btn"><asp:Button runat="server" ID="btnParticular" Text="Add+" CssClass="btn btn-success" /></span>
                                             </div>

                                         </div>
                                     </div>
                                 </div>

                       
                              <div class="col-md-4">
                                  <div class="row">
                                      <label for="namebn" class="col-sm-4 control-label">Amount <strong class="required"></strong></label>
                                      <div class="col-sm-8">
                                          <asp:TextBox ID="txtAmount" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control"></asp:TextBox>
                                      </div>
                                  </div>
                              </div>

                       <div class="col-md-2">
                                  <div class="row">
                                      <asp:Button runat="server" ID="btnAddParticular" Text="Add Particular+" CssClass="btn btn-success" OnClick="btnAddParticular_Click" />
         
                                      </div>
                                  </div>
                              </div>
                               <%--  gridview part--%>
                         <asp:GridView ID="gvParticularInfo" runat="server"  ShowFooter="true" AutoGenerateColumns="False" CellPadding="6" CssClass="table table-hover table-striped" Width="100%" DataKeyNames="PId" OnRowCommand="gvParticularInfo_RowCommand" OnRowDataBound="gvParticularInfo_RowDataBound">
                             <FooterStyle BackColor="white" />
                                     <Columns>
                                         <asp:TemplateField HeaderText="Particular">
                                             <ItemTemplate >
                                                 <asp:Label runat="server" ID="lblName" Text=' <%# Eval("Particular") %>'></asp:Label>

                                             </ItemTemplate>
                                                <FooterTemplate >
                                                 <asp:Label runat="server" ID="labeltotaltext"  CssClass="totalLbl" Text="Total Amount "></asp:Label>
                                             </FooterTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Amount">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="lblamount" Text=' <%# Eval("Amount") %>'></asp:Label>

                                             </ItemTemplate>
                                             
                                             <FooterTemplate>
                                                 <asp:Label runat="server" ID="lblTotalAmount"  CssClass="amountStyle" >Total Amount:</asp:Label>
                                             </FooterTemplate>

                                         </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="text-center">
                                             <ItemTemplate>
                                                 <asp:LinkButton ID="btnEdit" runat="server" CommandName="Remove" CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                                       <i class="fa-solid fa-trash"></i></i>

                                                 </asp:LinkButton>
                                             </ItemTemplate>
                                         </asp:TemplateField>



                                     </Columns>

                                 </asp:GridView>




                               </div>
                                 <!------------End ----------------->
                                    <div class="button-panel">
                                        <asp:Button CssClass="btn btn-primary" ID="btnSave" ClientIDMode="Static" runat="server" Text="Save" OnClientClick="return validateInputs();" OnClick="btnSave_Click" />
                                        <input type="button" value="Reset" class="btn btn-default" onclick="clearIt();" />
                                    </div>


         

                             </div>
                                </asp:Panel>

                                



                                   

                                    
                      </div>
                            </ContentTemplate>
    </asp:UpdatePanel>
                    </div>
                </div>
            </div>
       
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">

        //    function getUserInput() {
        //    // Get the user input
        //    var userInput = document.getElementById("userInput").value;

        //    // You can now use the userInput variable as needed, for example, display it in an alert.
        //    alert("User Input: " + userInput);

        //    // Close the modal
        //    $('#myModal').modal('hide');
        //}


<%--        function showPopup(button) {
            // Get the popup element
            var popup = document.getElementById('<%= popup.ClientID %>');

            // Calculate the position based on the button's position
            var btnRect = button.getBoundingClientRect();
            var popupLeft = btnRect.right - window.pageXOffset - popup.offsetWidth; // Adjusted for left side
            var popupTop = btnRect.bottom + window.pageYOffset;

            // Set the popup position
            popup.style.left = popupLeft - 'px';
            popup.style.top = popupTop + 'px';

            // Display the popup
            popup.style.display = 'block';
        }


        

        function hidePopup() {
            // Get the popup element
            var popup = document.getElementById('<%= popup.ClientID %>');

        // Hide the popup
        popup.style.display = 'none';
    }--%>


        $(document).ready(function () {
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'tblParticularCategory', '');
            });
            // $("#dlBatchName").select2();
            $('#tblParticularCategory').dataTable({
                //"iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        });
        function loaddatatable() {
            $('#tblParticularCategory').dataTable({
                "iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        }
        function validateInputs() {

            if (validateCombo('ddlPaymentFor', '0', "Select Payment For") == false) return false;
            if ($('#hfAcademicInfo').val() == "1") {
                if (validateCombo('dlBatchName', '0', "Select Batch") == false) return false;
            }
            if (validateText('txtFeesCatName', 1, 200, "Enter Fees Category") == false) return false;
            if (validateCombo('ddlPaymentStore', '0', "Select Payment Store") == false) return false;
            if (validateText('txtDateStart', 10, 10, "Select Start Date") == false) return false;
            if (validateText('txtDateEnd', 10, 10, "Select End Date") == false) return false;
            return true;
        }
        function editFeesCategory(feesCatId, BatchId, ClassId, ExInSl, PaymentFor, ClsGrpId, StoreNameKey) {
            $('#ddlPaymentFor').val(PaymentFor);
            $('#lblFeesCateId').val(feesCatId);
            var strBatch = $('#r_' + feesCatId + ' td:nth-child(1)').html();
            var strFeesCatName = $('#r_' + feesCatId + ' td:nth-child(2)').html();
            var strStartDate = $('#r_' + feesCatId + ' td:nth-child(3)').html();
            var strEndDate = $('#r_' + feesCatId + ' td:nth-child(4)').html();
            var strFine = $('#r_' + feesCatId + ' td:nth-child(5)').html();
            var BatchID = BatchId + '_' + ClassId;
            $("#dlBatchName").prop("disabled", true);
            $('#hfAcademicInfo').val('0');
            //  $('#dlBatchName option[value='+BatchID+']').attr('selected','selected');        
            $('#ddlGroup option[value=' + ClsGrpId + ']').attr('selected', 'selected');
            $('#ddlExam option[value=' + ExInSl + ']').attr('selected', 'selected');
            $('#ddlPaymentStore option[value=' + StoreNameKey + ']').attr('selected', 'selected');

            $('#txtFeesCatName').val(strFeesCatName);
            $('#txtDateStart').val(strStartDate);
            $('#txtDateEnd').val(strEndDate);
            $('#txtFeesFine').val(strFine);
            $("#btnSave").val('Update');
            //load();
        }
        function clearIt() {
            $('#lblFeesCateId').val('');
            $('#txtFeesCatName').val('');
            $('#txtFeesFine').val('');
            $('#txtDateStart').val('');
            $('#txtDateEnd').val('');
            setFocus('#txtFeesCatName');
            $("#btnSave").val('Save');
        }
        function updateSuccess() {
            load();
            showMessage('Update successfully', 'success');
            clearIt();
        }
        function load() {
            loaddatatable();
            // $("#dlBatchName").select2();
        }
        var ddlText, ddlValue, ddl, lblMesg;
        function CacheItems() {
            ddlText = new Array();
            ddlValue = new Array();
            ddl = document.getElementById("<%=dlBatchName.ClientID %>");
            lblMesg = document.getElementById("<%=lblMessage.ClientID%>");
            for (var i = 0; i < ddl.options.length; i++) {
                ddlText[ddlText.length] = ddl.options[i].text;
                ddlValue[ddlValue.length] = ddl.options[i].value;
            }
        }
        window.onload = CacheItems;

        function FilterItems(value) {
            ddl.options.length = 0;
            for (var i = 0; i < ddlText.length; i++) {
                if (ddlText[i].toLowerCase().indexOf(value) != -1) {
                    AddItem(ddlText[i], ddlValue[i]);
                }
            }
            lblMesg.innerHTML = ddl.options.length + " items found.";
            if (ddl.options.length == 0) {
                AddItem("No items found.", "");
            }
        }

        function AddItem(text, value) {
            var opt = document.createElement("option");
            opt.text = text;
            opt.value = value;
            ddl.options.add(opt);
        }

        //function getUserInput() {
        //    // Get the user input
        //    var userInput = document.getElementById("userInput").value;

        //    // You can now use the userInput variable as needed, for example, display it in an alert.
        //    alert("User Input: " + userInput);

        //    // Close the modal
        //    $('#myModal').modal('hide');
        //}

    </script>

    <script>

        function showModal() {
            $('#myModal').modal('show');
            $('#myModal').show();
        }
        function removeModal() {
            $('#myModal').modal('hide');
            $('#myModal').hide();
            $('#txtNote').val('');
            $('.modal-backdrop').css('display', 'none');

        }

    </script>
</asp:Content>
