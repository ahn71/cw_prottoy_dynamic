<%@ Page Title="Add Building Name" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ManagedBuildings.aspx.cs" Inherits="DS.UI.Academic.Timetable.RoomAllocation.ManagedBuildings" %>

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
                <li class="active">Add Building</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>

   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
              <ContentTemplate>
                  <div class="tgPanelHead">Add Building Name</div>
                         <div class="row">
                             <div class="col-lg-3">
                                 <label>Building Name</label>
                                <asp:TextBox ID="txtBuildingName" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                             </div>
                             <div class="col-lg-3" style="margin-top:20px;">
                         <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Save" ClientIDMode="Static"
                            OnClientClick="return validateInputs();" OnClick="btnSubmit_Click" />
                               &nbsp;
                             </div>
                         </div>
                             
                               
              </ContentTemplate>
          </asp:UpdatePanel>
     
 

  
                 <h4 class="text-right mt-3">Building Name List</h4>
    
                <div class="dataTables_filter_New" style="float: right;margin-right:0px;">
                     <label>
                         Search:
                         <input type="text" class="Search_New" placeholder="type here" />
                     </label>
                 </div> 
               <div class="gvTable">
          
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:HiddenField ID="lblBuidlingId" ClientIDMode="Static" runat="server"/>  
                        <asp:GridView runat="server" ID="gvBuldingList" AutoGenerateColumns="false" DataKeyNames="BuildingId" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" GridLines="Vertical" 
      PagerStyle-CssClass="pgr"  Width="100%" OnRowCommand="gvBuldingList_RowCommand">
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

                    </ContentTemplate>
                </asp:UpdatePanel>
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
            if (validateText('txtBuildingName', 1, 50, 'Enter a Building Name') == false) return false;
            return true;
        }
        function editBuilding(BuildingId) {
            var na = $('#lblBuidlingId').val(BuildingId);            
            var strBuildingName = $('#buildingName' + BuildingId).html();
            $('#txtBuildingName').val(strBuildingName);            
            $("#btnSubmit").val('Update');
        }
        function clearIt() {
            $('input[type=text]').val('');           
            $("#btnSave").val('Save');
            setFocus('txtEx_Name');
        }
        function updateSuccess() {
            loaddatatable();
            showMessage('Update successfully', 'success');
            clearIt();
        }
        function SavedSuccess() {
            loaddatatable();
            showMessage('Save successfully', 'success');
            clearIt();
        }
    </script>
</asp:Content>
