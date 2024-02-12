<%@ Page Title="Current Students Details" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="CurrentStudentInfo.aspx.cs" Inherits="DS.UI.Academics.Students.CurrentStudentInfo" %>

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
         .kk {
            width: 140px!important;
        }
        @media only screen and (max-width: 600px) {
          .kk {
                 width: 100%!important;
            }
          .Search_New{
              width:100%!important;
          }
        }

       /*----this code for switch button-------*/
                /* The switch - the box around the slider */
                .switch {
                position: relative;
                display: inline-block;
                width: 35px;
                height: 17px;
                margin-top:5px;

                }

                /* Hide default HTML checkbox */
                .switch input {
                opacity: 0;
                width: 0;
                height: 0;
                }

                /* The slider */
                .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 1px;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
                }

                .slider:before {
                position: absolute;
                content: "";
                height: 9px;
                width: 9px;
                left: 3px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
                }

                input:checked + .slider {
                background-color: #34a836;
                }

                input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
                }

                input:checked + .slider:before {
                -webkit-transform: translateX(20px);
                -ms-transform: translateX(20px);
                transform: translateX(20px);
                }

                /* Rounded sliders */
                .slider.round {
                border-radius: 34px;
                }

                .slider.round:before {
                border-radius: 50%;
                }

                /*---Design----*/
                .font_icon i{
                font-size:16px;
                color:#34a836;

                }

                #del_col {
                  color:#ff0505;

                }
                #usercolor{
                font-size:16px;
                color: #0866ff;

                }
                .modal-backdrop {
    /* opacity: .5; */
    display: none !important;
}
                .remove{
                    display:none;
                }
          #iconStyle {
          width:50px;
          height:50px;
          color:green;
         }

          .modal{
              box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px !important;
          }
                    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <asp:UpdatePanel ID="uplMessage" runat="server">
        <ContentTemplate>
            <p class="message" id="lblMessage" clientidmode="Static" runat="server"></p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">

<%--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            Open Input Box
        </button>--%>

        <!-- The Modal -->
        <div class="modal fade mt-5 p-4" id="myModal" data-backdrop="static" data-keyboard="false"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content p-5 ">
                    <div class="modal-header">
                      <h3 class="text-danger font-weight-bold mt-5 text-center"> Why You Want to Active or Inactive This Student <span class="text-danger fa-2x">?</span></h3>

          <%--              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>--%>

<%--                        <asp:LinkButton runat="server" class="close" aria-label="Close" ClientIDMode="Static" ID="lnkModalClose" OnClick="btnModalClose_Click" >
                              <span aria-hidden="true">&times;</span>
                        </asp:LinkButton>--%>
                    </div>
                    <div class="modal-body">
                        <!-- Input box -->
                        <asp:TextBox ID="txtNote" runat="server" class="form-control" placeholder="Type Reason"></asp:TextBox>
                        <%--<input type="text" id="userInput" class="form-control" />--%>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnModalClose" runat="server" Text="Close"  class="btn btn-secondary"  OnClick="btnModalClose_Click"/>
                        <asp:Button ID="btnSubmitStatus" runat="server" Text="Submit"  class="btn btn-primary"   OnClick="btnSubmitStatus_Click" />
     
                    </div>
                </div>
            </div>
        </div>




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
                <%--<li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>--%>
                <li><a runat="server" id="aAcademicHome">Academic Module</a></li>
                <%--<li><a runat="server" href="~/UI/Academic/Students/StdHome.aspx">Student Module</a></li> --%>
                <li><a runat="server" id="aStudentHome">Student Module</a></li> 
                <li class="active">Current Students Details</li>                              
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>

    <div class="tgPanel">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch"  />
                <asp:AsyncPostBackTrigger ControlID="ddlClass" />
                <asp:AsyncPostBackTrigger ControlID="dlGroup" />
            </Triggers>
            <ContentTemplate>
               
              <div class="row tbl-controlPanel"> 
		        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
			        <div class="form-inline">
                            <div class="form-group">
					         <label for="exampleInputName2">Status</label>
					            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="form-control kk" ClientIDMode="Static" >
                                <asp:ListItem Value="00">All</asp:ListItem>                                
                                <asp:ListItem Value="1">Active Student </asp:ListItem>                                
                                <asp:ListItem Value="0">inactive Student</asp:ListItem>                                
                   
                            </asp:DropDownList>
				         </div>

                        <div class="form-group">
					         <label for="exampleInputName2">Year</label>
					            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control kk" ClientIDMode="Static" >
                                                           
                            </asp:DropDownList>
				         </div>
				         <div class="form-group">
					         <label for="exampleInputName2">Shift</label>
					            <asp:DropDownList ID="dlShift" runat="server" CssClass="form-control kk" ClientIDMode="Static" >
                                <asp:ListItem Value="00">All</asp:ListItem>                                
                            </asp:DropDownList>
				         </div>
				        
                        <div class="form-group">
					         <label for="exampleInputName2">Class</label>
                             <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control kk"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" ClientIDMode="Static" >
                                <asp:ListItem Value="00">All</asp:ListItem> 
                            </asp:DropDownList>
				         </div>
				        <div class="form-group">
					         <label for="exampleInputName2">Group</label>
                             <asp:DropDownList ID="dlGroup" runat="server" CssClass="form-control kk" 
                               AutoPostBack="true"  OnSelectedIndexChanged="dlGroup_SelectedIndexChanged" ClientIDMode="Static">
                               <asp:ListItem Value="00">All</asp:ListItem> 
                            </asp:DropDownList>
				         </div>
				        <div class="form-group">
					         <label for="exampleInputName2">Section</label>
                            <asp:DropDownList ID="dlSection" runat="server" CssClass="form-control kk" ClientIDMode="Static">
                                <asp:ListItem Value="00">All</asp:ListItem> 
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
<%--    <div class="tgPanel">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                </Triggers>
                <ContentTemplate>
                    <div class="widget">
                        <div id="divStudentDetails" class="datatables_wrapper" runat="server" style="width: 100%; max-height:680px; overflow-y: scroll;overflow-x: hidden;"></div>
                    </div>
                    
                    </ContentTemplate>
            </asp:UpdatePanel>
    </div>--%>
     <asp:UpdatePanel ID="up2" runat="server" UpdateMode="Conditional">
         <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                <asp:AsyncPostBackTrigger ControlID="btnSubmitStatus" />
              <%--  <asp:AsyncPostBackTrigger ControlID="btnSubmitStatusClose" />--%>
                <asp:AsyncPostBackTrigger ControlID="btnModalClose" />
<%--                <asp:AsyncPostBackTrigger ControlID="lnkModalClose" />--%>
            </Triggers>
            <ContentTemplate>
            <div class="tgPanel">
                 <asp:GridView ID="gvStudentList" runat="server" AutoGenerateColumns="false" DataKeyNames="StudentId ,BatchID" 
                     CssClass="table table-bordered" BackColor="White" HeaderStyle-ForeColor="Black" OnRowCommand="gvStudentList_RowCommand">
                     <%--<PagerStyle CssClass="gridview" />--%>
            <Columns>
                  <asp:TemplateField HeaderText="SL"> 
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
               <asp:BoundField DataField="AdmissionNo" HeaderText="Admission No" />
               <asp:BoundField DataField="FullName" HeaderText="Full Name" />
               <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                <asp:BoundField DataField="ClassName" HeaderText="Class" />
               
                <asp:BoundField DataField="GroupName" HeaderText="Group" />
                
                <asp:BoundField DataField="SectionName" HeaderText="Section" />

                <asp:BoundField DataField="ShiftName" HeaderText="Shift" />
                <asp:BoundField DataField="RollNo" HeaderText="Roll" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="GuardianMobileNo" HeaderText="Guardian Mobile" />
                <asp:BoundField DataField="FirstName" HeaderText="Create By" />
                <asp:BoundField DataField="CreateOn" HeaderText="Create On" />
                <asp:BoundField DataField="StatusNote" HeaderText=" Activation Note" />
                   <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Status">
                    <ItemTemplate>
                            <label class="switch" data-toggle="modal" data-target="#myModal">
                               <asp:CheckBox ID="ckbStatus" ClientIDMode="Static" ViewStateMode="Enabled" runat="server" AutoPostBack="true" OnCheckedChanged="ckbStatus_CheckedChanged" Checked='<%#Convert.ToBoolean(Eval("IsActive")) %>' />
                               <span class="slider round"></span>
                            </label>

<%--                        <label class="switch">
                        <asp:CheckBox ID="cbk_Status" Checked="true" runat="server" CommandName="status"/>
                          <span class="slider round"></span>
                        </label>--%>

<%--                        <asp:CheckBox ID="cbk_Status" CommandName="Status"  runat="server" CommandArgument='<%#((GridViewRow)Container).RowIndex %>' />--%>
<%--                        <asp:ImageButton ID="btnShowUIP" runat="server"  ImageUrl="~/Images/gridImages/view.png" Width="30px" CommandName="View" CommandArgument='<%#((GridViewRow)Container).RowIndex %>' />                 --%>
                         
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate >
                       View
                    </HeaderTemplate>
                    <ItemTemplate>
<%--                        <asp:ImageButton ID="btnShowUIP" runat="server"  ImageUrl="~/Images/gridImages/view.png" Width="30px" CommandName="View" CommandArgument='<%#((GridViewRow)Container).RowIndex %>' />--%>
                        <asp:LinkButton ID="btnShowUIP"  runat="server" CommandName="View" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'><i class="fa-regular fa-eye fa-2x text-success"></i></asp:LinkButton>

    
                         
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate >
                       Edit
                    </HeaderTemplate>
                    <ItemTemplate>

                        <asp:LinkButton ID="btnEdit" Width="25px" runat="server" CommandName="Change" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'><i class="fa-regular fa-2x fa-pen-to-square text-success"></i></asp:LinkButton>

<%--                        <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/datatables/edit.png" Width="25px" CommandName="Change" CommandArgument='<%#((GridViewRow)Container).RowIndex %>' />--%>
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

       
        function getUserInput() {
            // Get the user input
            var userInput = document.getElementById("userInput").value;

            // You can now use the userInput variable as needed, for example, display it in an alert.
            alert("User Input: " + userInput);

            // Close the modal
            $('#myModal').modal('hide');
        }

         $(document).ready(function () {
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'MainContent_gvStudentList', '');
            });
        });
        function btnSearch_validation() {
            if (validateCombo('dlBatch', "0", 'Select a Batch') == false) return false;
            if (validateCombo('dlSection', "0", 'Select a Section Name') == false) return false;
            if (validateCombo('dlShift', "0", 'Select a Shift Name') == false) return false;
            return true;
        };
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

                function getUserInput() {
            // Get the user input
            var userInput = document.getElementById("userInput").value;

            // You can now use the userInput variable as needed, for example, display it in an alert.
            alert("User Input: " + userInput);

            // Close the modal
            $('#myModal').modal('hide');
        }
    </script>

    <script>
             
        function removeModal()
        {
            $('#myModal').modal('hide');
            $('#txtNote').val('');
            
        }

                
    </script>

</asp:Content>
