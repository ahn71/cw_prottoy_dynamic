<%@ Page Title="Classroom Allocated To Building" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Allocated.aspx.cs" Inherits="DS.UI.Academic.Timetable.RoomAllocation.Allocated" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

        <style>
                      th {
            font-size: 15px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 52px;
            height: 25px;
        }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 15px;
                width: 15px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

            .slider.round:before {
                border-radius: 50%;
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
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }
        .active-wrapper {
    display: flex;
    align-items: center;
    gap: 5px;
}
        input#MainContent_chkStauts {
    width: 20px;
    display: block;
    height: 15px;
}
       
        input:focus {
    box-shadow: 0px 0px 0px 0px !important;
    border: 1px solid rgba(255,255,255, 0.8);
}

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

            .slider.round:before {
                border-radius: 50%;
            }
        th {
          background: #ddd !important;
          }

        td, th {
              border: 1px solid #ddd !important;
             }

        .table {
            border: 0 !important;
            margin: 10px 0;
        }
        .border-1{
            border:1px solid #ddd;
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
                <li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Timetable/TimetableHome.aspx">Routine Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Timetable/RoomAllocation/BuildingHome.aspx">Building and Classroom Settings</a></li>
                <li class="active">Classroom Allocated To Building</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>

   <%-- input pannel--%>
     
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"> 
                    <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSubmit"/>
                            <asp:AsyncPostBackTrigger ControlID="drpBuildingName"/>                                                  
                        </Triggers>                   
                    <ContentTemplate>





                                   <div class="tgPanelHead">Class Room Allocate</div>
                        <div class="row">
                              <div class="col-lg-3">
                                   <label>Building Name</label>
                                  <asp:DropDownList ID="drpBuildingName" runat="server" CssClass="form-control" AutoPostBack="true"
    OnSelectedIndexChanged="drpBuildingName_SelectedIndexChanged" ClientIDMode="Static">
               </asp:DropDownList>
                              </div>
                              <div class="col-lg-3">
                                  <label>Room Name/Code</label>
                                    <asp:TextBox ID="TxtRName" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                              </div>
                               <div class="col-lg-3">
                                 <label>Room Capacity</label>
                                     <asp:TextBox ID="TxtRCapacity" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                               </div>
                              <div class="col-lg-3 mt-3">
                                     <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Save" ClientIDMode="Static"
OnClientClick="return validateInputs();" OnClick="btnSubmit_Click"/>
 
                              </div>

                          </div>

                    
                       




                        
                <h4 class="text-right mt-3" style="float:left">Classroom Allocated List</h4>
                <div class="dataTables_filter_New" style="float: right;margin-right:0px;">
                     <label>
                         Search:
                         <input type="text" class="Search_New" style="width:150px;" placeholder="type here" />
                     </label>
                 </div>  


                        <asp:HiddenField ID="lblRmId" ClientIDMode="Static" runat="server"/>    
                          <asp:HiddenField ID="lblBuidlingId" ClientIDMode="Static" runat="server"/> 
                        <div class="gvRoomList mt-3">
                              <asp:GridView runat="server" AllowPaging="false" ID="gvRoomList"
                                  AutoGenerateColumns="false" DataKeyNames="RoomId,BuildingId" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" OnRowCommand="gvRoomList_RowCommand">
                                  <Columns>
                                       <asp:TemplateField HeaderText="SL">
                                         <ItemTemplate>
                                              <%#Container.DataItemIndex+1 %>
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Building Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuldingName" runat="server" Text='<%# Eval("BuildingName") %>'></asp:Label>
                                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
                                             <span class="update-icon" ><i class="fas fa-edit"></i></span>
                                               </asp:LinkButton>
                                        </ItemTemplate>          
                                    </asp:TemplateField>  



                                      <asp:TemplateField HeaderText="Room Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRoomName" runat="server" Text='<%# Eval("RoomName") %>'></asp:Label>
                                            </ItemTemplate>          
                                        </asp:TemplateField>  

                                     <asp:TemplateField HeaderText="Capacity">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblCapacity" runat="server" Text='<%# Eval("RoomCapacity") %>'></asp:Label>
                                                 </ItemTemplate>          
                                  </asp:TemplateField>  


                            <asp:TemplateField HeaderText="Status">
                             <ItemTemplate>
                                 <label class="switch">
                                 <asp:CheckBox ID="chkSwitchStatus" runat="server" OnCheckedChanged="chkSwitchStatus_CheckedChanged" AutoPostBack="true" 
                               Checked='<%# Convert.ToBoolean(Eval("Status")) %>' />
                                    <span class="slider round"></span>
                             </ItemTemplate>
                         </asp:TemplateField>



                                  </Columns>
                              </asp:GridView>
                        </div>
                            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
           
      
        
          
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'gvRoomList', '');
            });
            $('#gvRoomList').dataTable({
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
            if (validateCombo('drpBuildingName', 0, 'Select a Building Name') == false) return false;
            if (validateText('TxtRName', 1, 50, 'Enter a Room Name') == false) return false;
            if (validateText('TxtRCapacity', 1, 50, 'Enter a Room Capacity') == false) return false;
            return true;
        }
        function editRM(RmId, BId) {
            $('#lblRmId').val(RmId);
            $('#lblBuidlingId').val(BId);
            $('#drpBuildingName').val(BId).prop("disabled", true);          
            var rmName = $('#roomName' + RmId).html();
            $('#TxtRName').val(rmName);       
            var capcity = $('#capacity' + RmId).html();            
            $('#TxtRCapacity').val(capcity);
            $("#btnSubmit").val('Update');
        }
        function clearIt() {
            $('#drpBuildingName').val(0);
            $('#lblRmId').val('');
            $('#lblBuidlingId').val('');
            $('input[type=text]').val('');
            $("#btnSubmit").val('Save');            
        }
        function updateSuccess() {
            loaddatatable();
            showMessage('Update successfully', 'success');
            //clearIt();
            $('#lblRmId').val('');
            $('#lblBuidlingId').val('');
            $('input[type=text]').val('');
            $("#btnSubmit").val('Save');
        }
        function SavedSuccess() {
            loaddatatable();
            showMessage('Save successfully', 'success');
            //clearIt();
            $('#lblRmId').val('');
            $('#lblBuidlingId').val('');
            $('input[type=text]').val('');
            $("#btnSubmit").val('Save');
        }
    </script>
</asp:Content>
