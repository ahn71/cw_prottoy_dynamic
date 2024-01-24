<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddTitle.aspx.cs" Inherits="DS.UI.Administration.Finance.Accounts.AddTitle" %>
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
                <li><a runat="server" href="~/UI/Administration/AdministrationHome.aspx">Administration Module</a></li>
                <li><a runat="server" href="~/UI/Administration/Finance/FinanceHome.aspx">Finance Module</a></li>
                <li><a runat="server" href="~/UI/Administration/Finance/Accounts/AccountsHome.aspx">Accounts Management</a></li>                          
                <li class="active">Add Title</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
         <div class="row">            
           
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" />
                    </Triggers>

                 <ContentTemplate>
                       <div class="tgPanelHead">Add Title</div>

                       <div class="row align-items-center">
                            <label>Title</label>
                    <div class="col-lg-4">
                      
                         <asp:TextBox ID="txtTitle" runat="server" Width="100%" ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>
                     </div>

                 <div class="col-lg-2">
                     <div class="rdioBtn d-flex g-3">
                          <asp:Label CssClass="pe-3" runat="server" ID="lblType" Text="Type:"></asp:Label>
                               <div class="d-flex gap-2">
                                <asp:RadioButton ID="rdoIncome" runat="server"  Text="Income"/>
                                <asp:RadioButton ID="rdExapanse" runat="server" Text="Expance"/>
                            </div> 
                     </div>
                   </div>
                    <div class="col-lg-4">
                         <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" ClientIDMode="Static" Text="Save"
OnClientClick="return btnAddTitle_validation();" OnClick="btnSave_Click"/>
                    </div>
              
          </div> 

                     <asp:HiddenField ID="lblTitleID" Value="0" ClientIDMode="Static" runat="server" />

                        <div class="gvTable">
                              <asp:GridView runat="server" ID="gvTittleList" AutoGenerateColumns="false" DataKeyNames="ID" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" OnRowCommand="gvTittleList_RowCommand" Width="100%">

        <Columns>
              <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                         <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
          </asp:TemplateField>


              <asp:TemplateField HeaderText="Title Name">
                <ItemTemplate>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
                     <span class="update-icon" ><i class="fas fa-edit"></i></span>
                       </asp:LinkButton>
                </ItemTemplate>          
        </asp:TemplateField>  


               <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <label class="switch">
                        <asp:CheckBox ID="chkSwitchStatus" runat="server" OnCheckedChanged="chkSwitchStatus_CheckedChanged"  AutoPostBack="true" 
                      Checked='<%# Convert.ToBoolean(Eval("Status")) %>' />
                           <span class="slider round"></span>
                    </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
       
      

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">       
        function btnAddTitle_validation() {
            if (validateText('txtTitle', 1, 100, 'Enter a Title') == false) return false;           
            return true;
        }
        function SavedSuccess() {
            clearIt();
            showMessage('Saved successfully', 'success');
        }
        function updateSuccess() {
            clearIt();
            showMessage('Updated successfully', 'success');
        }
        function editTemplate(titleID) {
            $('#lblTitleID').val(titleID);
            var title = $('#title' + titleID).html();
            var type = $('#type' + titleID).html();
            $('#<%=rdoIncome.ClientID %>').find("input[value='False']").prop("checked", true);               
            $('#<%=rdExapanse.ClientID %>').find("input[value='True']").prop("checked", true);
                     
            $('#txtTitle').val(title);
            $("#btnSave").val('Update');
        }
        function clearIt() {
            $('input[type=text]').val('');
            $("#btnSave").val('Save');
            setFocus('txtTitle');           
        }
    </script>
</asp:Content>
