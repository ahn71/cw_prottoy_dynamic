<%@ Page Title="Salary Allowance Type" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="SalaryAllowanceType.aspx.cs" Inherits="DS.UI.Administration.HR.Payroll.SalaryAllowanceType" %>

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
        /*.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}*/
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
          /*  text-align: center;*/
            border: 1px solid #ddd !important;
        }

        .table {
            border: 0 !important;
            margin: 10px 0;
        }
        .border-1{
            border:1px solid #ddd;
        }
        /*Update*/
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
    <asp:HiddenField ID="lblAId" ClientIDMode="Static" Value="" runat="server" />
    <asp:HiddenField ID="lblOldPercentage" ClientIDMode="Static" Value="" runat="server" />
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
                <li><a runat="server" href="~/UI/Administration/HR/hrHome.aspx">Human Resource Module</a></li>
                <li><a runat="server" href="~/UI/Administration/HR/Payroll/PayrollHome.aspx">Payroll Management</a></li>
                <li class="active">Salary Allowance Type</li>                
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
  
    <div class="row">
            <div class="col-md-6">
                <h4 class="text-right" style="float:left">Salary Allowance Type Details</h4>
            </div>
            
        </div>


    
    <div class="inputPannel" id="inputPannels">
       
           <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
               <Triggers>
                   <asp:AsyncPostBackTrigger ControlID="btnSave" />
               </Triggers>
                   <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-3">
                          <asp:Label runat="server" ID="lblAllownece">Allowance Type</asp:Label>
                          <asp:TextBox runat="server" ID="txtAllowence" 
                              CssClass="form-control"></asp:TextBox>
                          </div>
                        <div class="col-lg-3">
                              <asp:Label runat="server" ID="lblPersentance">Percentage</asp:Label>
                              <asp:TextBox runat="server" ID="txtPersantece" 
                                  CssClass="form-control"></asp:TextBox>

                          </div>
                      <div class="col-lg-3">
                              <asp:Button  runat="server" CssClass="btn btn-primary" Text="Save"  style="margin-top:17px;" ID="btnSave" OnClick="btnSave_Click1" />

                          </div>

                      </div> 

                   </ContentTemplate>
           </asp:UpdatePanel>
       </div>
     
     
    <div class="gvTable">
               <asp:GridView runat="server" ID="gvAllowenceList" CssClass="table"  OnRowCommand="gvAllowenceList_RowCommand" AllowPaging="true" PageSize="10"  AutoGenerateColumns="False" BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2"  OnPageIndexChanging="gvAllowenceList_PageIndexChanging"
        DataKeyNames="Aid" GridLines="Vertical" 
        PagerStyle-CssClass="pgr" Width="100%">
       <Columns>
            <asp:TemplateField HeaderText="SL">
            <ItemTemplate>
                 <%#Container.DataItemIndex+1 %>
            </ItemTemplate>
        </asp:TemplateField>

           <asp:TemplateField HeaderText="Allowence Type">
    <ItemTemplate>
        <asp:Label ID="lblAllowence" runat="server" Text='<%# Eval("Atype") %>'></asp:Label>
             <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
     <span class="update-icon" ><i class="fas fa-edit"></i></span>
</asp:LinkButton>
    </ItemTemplate>          
</asp:TemplateField>

           <asp:TemplateField HeaderText="Percentage">
                <ItemTemplate>
                 <asp:Label ID="lblPercentance" runat="server" Text='<%# Eval("APercentage") %>'></asp:Label>        
            </ItemTemplate>          
         </asp:TemplateField>

           <asp:TemplateField HeaderText="Status">
          <ItemTemplate>
             <label class="switch">
    <asp:CheckBox ID="chkSwitchStatus" runat="server" OnCheckedChanged="chkSwitchStatus_CheckedChanged" AutoPostBack="true" 
                  Checked='<%# Convert.ToBoolean(Eval("AStatus")) %>' />
    <span class="slider round"></span>
</label>
   
         </ItemTemplate>
        </asp:TemplateField>

       </Columns>

   </asp:GridView>

 </div>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
    
        function validateInputs() {
            if (validateText('txtAllowanceType', 1, 50, 'Enter Allowance Type') == false) return false;
            if (validateText('txtPercentage', 1, 30, 'Enter Percentage') == false) return false;
            return true;
        }

    </script>
</asp:Content>
