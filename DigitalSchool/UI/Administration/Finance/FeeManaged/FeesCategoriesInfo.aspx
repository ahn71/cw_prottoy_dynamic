 <%@ Page Title="Fees Category" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="FeesCategoriesInfo.aspx.cs" Inherits="DS.UI.Administration.Finance.FeeManaged.FeesCategoriesInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tgPanel {
            width: 100%;
        }


        .tbl-controlPanel td:first-child {
            text-align: right;
            padding-right: 5px;
        }
        @media (min-width: 320px) and (max-width: 480px) {
            .input {
                color: #000;
                margin-top: 10px;
            }
        }

        .button-panel {
            text-align: right;
            padding: 20px;
        }

        .main-panel {
            margin: 10px;
        }

        .group-info-box {
            border: 1px solid #c1c1c1;
            padding: 20px;
        }

        .particular_section {
            margin: 20px;
            padding: 10px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            border-radius: 10px;
        }

        .add-particular {
            padding: 10px;
            color: white;
            background-color: forestgreen;
        }

        .fa-trash {
            color: red;
            font-size: 18px;
            display: block;
            text-align: center;
        }

        .totalLbl {
            display: block;
            text-align: end;
            font-weight: bold;
        }

        .amountStyle {
            font-weight: bold;
        }

        .addFeesCat {
            margin: 20px;
        }

        .pagination {
            width: 100px;
            text-align: center;
        }

        .pagination a {
            color: white !important;
            background-color: forestgreen;
            padding: 7px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!--- Git Test--->
    
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

    <!------Add Particular Section Start -------->
    <!-- Button trigger modal -->
<%--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
          Launch demo modal
        </button>--%>

<!-- Modal -->
        <div class="modal fade" id="ParticularModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <asp:label ID="lblParticular" runat="server" CssClass="form-label" >Please Insert Particular Name </asp:label>
                  <asp:TextBox ID="txtParticular" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control"></asp:TextBox>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <asp:Button runat="server" ID="btnParticularSave" Text="Save" CssClass="btn btn-success" OnClick="btnParticularSave_Click" />
                  
              </div>
            </div>
          </div>
        </div>
    <!------Add Particular Section End -------->










        <!------Fees Catagory Information Detailes Start -------->

                         <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog  modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title text-center p-2" id="FeesCatTitle">Fees Catagory Detailes</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">


                                <div class="row">
                                    <div class="col-lg-6 m-3">
                                       <asp:Label ID="lblPaymentFor" runat="server" Text=""></asp:Label> <br />

                                        <asp:Label ID="lblFeeCatName" runat="server" Text=""></asp:Label><br />


                                        <asp:Label ID="lblPaymentStore" runat="server" Text=""></asp:Label><br />


                                        <asp:Label ID="lblExam" runat="server" Text=""></asp:Label><br />


                                        <asp:Label ID="lblBatchName" runat="server" Text=""></asp:Label><br />
                                    </div>
                                    <div class="col-lg-6">
                                                                            
                                        <asp:Label ID="lblGroup" runat="server" Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="lblDateOfStart" runat="server" Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="lblDateOfEnd" runat="server" Text=""></asp:Label>
                                        <br />


                                        <asp:Label ID="lblFeeFine" runat="server" Text=""></asp:Label>
                                        <br />


                                        <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label>
                                        <br />

                                  
                                </div>

                                </div>
                            </div>
                                <br />
                                <br />


                                <asp:GridView ID="gvParticularDetailes" runat="server" AutoGenerateColumns="False" ShowFooter="true" CellPadding="6"
                                    CssClass="table table-hover table-striped" Width="100%" DataKeyNames="FeeCatId">

                                    <Columns>
                                        <asp:TemplateField HeaderText="Particular Name">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblParticularName" Text=' <%# Eval("Particular") %>'></asp:Label>

                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label runat="server" ID="labeltotaltext" CssClass="totalLbl" Text="Total Amount "></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblParticularAmount" Text=' <%# Eval("Amount") %>'></asp:Label>

                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label runat="server" ID="lblParticularTotalAmount" CssClass="text-start"  style="font-weight: bold;" Text='<%# ViewState["TotalAmount"] %>' ></asp:Label>
                                            </FooterTemplate>

                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                       
                    </div>
                </div>


      <!------Fees Catagory Information Detailes End -------->


 

        <div class="row">
            <div class="col-md-7">
                <h4 class="text-right" style="float: left">Fees Category Information</h4>
                <div class="dataTables_filter_New" style="float: right;">
                    <label>
                        Search:
                         <input type="text" class="Search_New" placeholder="type here" />
                    </label>
                </div>
            </div>
            <div class="col-md-5"></div>
        </div>

            <br />


            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                <asp:Button runat="server" ID="btnAddFeesCat" ClientIDMode="Static" CssClass="btn btn-success addFeesCat" Text="Add New Fees Catagory +" OnClick="btnAddFeesCat_Click" />
            <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" CssClass="form-control pagination">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>

            </asp:DropDownList>


                    <asp:Panel runat="server" ID="listPanel">

                        <asp:GridView ID="gvParticularList" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" CellPadding="6"
                            CssClass="table table-hover table-striped" Width="100%"
                            OnRowCommand="gvParticularList_RowCommand" DataKeyNames="FeeCatId" AllowPaging="true"
                            OnPageIndexChanging="gvParticularList_PageIndexChanging"
                            PagerStyle-NextPageText="&gt;&gt;" PagerStyle-PreviousPageText="&lt;&lt;"
                         >

                            <Columns>
                                <asp:TemplateField HeaderText="Batch Name">
                                    <ItemTemplate>
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
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                                       <i class="fa-regular fa-pen-to-square"></i>

                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        
                                        <asp:LinkButton runat="server" ID="btnShowPopup" ClientIDMode="Static" AutoPostBack="true" CommandName="ShowDetailes"
                                            CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                                     <i class="fa-regular fa-eye"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>



                            </Columns>

                        </asp:GridView>
                    </asp:Panel>


                    <asp:Panel runat="server" ID="entryPanel">
                            <div class="tgPanel">
                                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hfAcademicInfo" Value="0" />
                                <div class="tgPanelHead">Fees Category</div>

                                <div class="main-panel">
                                    <div class="row form-group">
                                        <!------------Start----------------->
                                        
                                        <asp:Label runat="server" ID="lblDemo"></asp:Label>
                                        <div class="col-md-4">
                                            <div class="row">
                                                <label for="name" class="col-sm-4 control-label">Payment For <strong class="required">*</strong></label>
                                                <div class="col-sm-8">
                                                    <asp:DropDownList ID="ddlPaymentFor" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentFor_SelectedIndexChanged">

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




                                    </div>
                                    <!------------End ----------------->

                                    <asp:Panel runat="server" ClientIDMode="Static" ID="pnlAcademicInfo">
                                        <div class="row form-group">
                                            <!------------Start----------------->


                                            <div runat="server" class="col-md-4">
                                                <div class="row">
                                                    <label for="namebn" class="col-sm-4 control-label">Batch Name<strong class="required">*</strong></label>
                                                    <div class="col-sm-8">
                                                        <asp:DropDownList ID="dlBatchName" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static" OnSelectedIndexChanged="dlBatchName_SelectedIndexChanged" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-4">
                                                <div class="row">
                                                    <label for="name" class="col-sm-4 control-label">Group<strong class="required">*</strong></label>
                                                    <div class="col-sm-8">
                                                        <asp:DropDownList ID="ddlGroup" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="row">
                                                    <label for="namebn" class="col-sm-4 control-label">Exam<strong class="required"></strong></label>
                                                    <div class="col-sm-8">
                                                        <asp:DropDownList ID="ddlExam" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </asp:Panel>
                                    <!------------End ----------------->


                                    <div class="row form-group">
                                        <!------------Start----------------->
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

                                    <div class="row form-group">
                                        <!------------Start----------------->

                                        <div class="col-md-6">
                                            <div class="row">
                                                <label for="namebn" class="col-sm-4 col-lg-3 control-label">Particular <strong class="required">*</strong></label>
                                                <div class="col-sm-8">
                                                    <div class="input-group">
                                                        <asp:DropDownList ID="ddlParticular" runat="server" CssClass=" form-control" ClientIDMode="Static" AutoPostBack="true">                                 
                                                        </asp:DropDownList>


                                                        <span class="input-group-btn">
                                                            <asp:Button runat="server" ID="btnParticular" data-toggle="modal" Text="Add+" CssClass="btn btn-success" data-target="#ParticularModal" /></span>
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
                                    <asp:GridView ID="gvParticularInfo" runat="server" ShowFooter="true" AutoGenerateColumns="False" CellPadding="6" CssClass="table table-hover table-striped" Width="100%" DataKeyNames="PId" OnRowCommand="gvParticularInfo_RowCommand" OnRowDataBound="gvParticularInfo_RowDataBound">
                                        <FooterStyle BackColor="white" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Particular">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblName" Text=' <%# Eval("Particular") %>'></asp:Label>

                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label runat="server" ID="label1" CssClass="totalLbl" Text="Total Amount "></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblamount" Text=' <%# Eval("Amount") %>'></asp:Label>

                                                </ItemTemplate>

                                                <FooterTemplate>
                                                    <asp:Label runat="server" ID="lblTotalAmountAdded" CssClass="amountStyle">Total Amount:</asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Remove" CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                                       <i class="fa-solid fa-trash"></i></i>

                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                        </Columns>

                                    </asp:GridView>


                                </div>
                                <!------------End ----------------->
                                <div class="button-panel">
                                    <asp:Button CssClass="btn btn-success" ID="btnSave" ClientIDMode="Static" runat="server" Text="Save" OnClientClick="return validateInputs();" OnClick="btnSave_Click" />
                                </div>




                            </div>
                        </asp:Panel>



                </ContentTemplate>
  

            </asp:UpdatePanel>

        </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">       
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
       /*     if (validateCombo('ddlPaymentStore', '0', "Select Payment Store") == false) return false;*/
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
            $('#dlBatchName option[value='+BatchID+']').attr('selected','selected');        
            $('#ddlGroup option[value=' + ClsGrpId + ']').attr('selected', 'selected');
            //$('#ddlExam option[value=' + ExInSl + ']').attr('selected', 'selected');
            $('#ddlPaymentStore option[value=' + StoreNameKey + ']').attr('selected', 'selected');

            $('#txtFeesCatName').val(strFeesCatName);
            $('#txtDateStart').val(strStartDate);
            $('#txtDateEnd').val(strEndDate);
            $('#txtFeesFine').val(strFine);
            $("#btnSave").val('Update');
            //load();
        }
        //function clearIt() {
        //    $('#lblFeesCateId').val('');
        //    $('#txtFeesCatName').val('');
        //    $('#txtFeesFine').val('');
        //    $('#txtDateStart').val('');
        //    $('#txtDateEnd').val('');
        //    setFocus('#txtFeesCatName');
        //    $("#btnSave").val('Save');
        //}
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
        //function removeModal() {
        //    $('#myModal').modal('hide');
        //    $('#myModal').hide();
        //    $('#txtNote').val('');
        //    $('.modal-backdrop').css('display', 'none');

        //}

    </script>
</asp:Content>
