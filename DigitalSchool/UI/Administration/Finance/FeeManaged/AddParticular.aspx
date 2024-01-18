<%@ Page Title="Add Particulars" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddParticular.aspx.cs" Inherits="DS.UI.Administration.Finance.FeeManaged.AddParticular" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .icon-style{
            color:green;
        }

        /* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
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

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
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


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">  
   
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
                <li class="active">Add Particulars</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>

   
        <asp:UpdatePanel ID="uplMessage" runat="server">
        <ContentTemplate>
           <p class="message" id="lblMessage" clientidmode="Static" runat="server"></p>

        </ContentTemplate>
        </asp:UpdatePanel>



    <asp:UpdatePanel runat="server" ID="updatePanel" UpdateMode="Conditional">

     
      <ContentTemplate>
                  <div class=" form-group row">

                <asp:Label runat="server" CssClass="col-sm-1 col-form-label" ID="lblName">Name</asp:Label>
                   <div class="col-lg-6">
                <asp:TextBox ClientIDMode="Static" runat="server" CssClass="form-control" ID="txtParticulerName"></asp:TextBox>
      
            </div>
            
                <asp:Button ID="btnSave" CssClass="btn btn-success " Text="Save" runat="server"  OnClientClick="return validateInputs();" OnClick="btnSave_Click"/>

            </div>

      
           <div class="gvList">
            <asp:GridView ID="gv_particularList" runat="server" AutoGenerateColumns="false" CellPadding="6"
                DataKeyNames="PId" CssClass="table" Width="100%" OnRowCommand="gv_particularList_RowCommand" >
                <Columns>
                       <asp:TemplateField HeaderText="Particular Name" HeaderStyle-Width="30px">

                           <ItemTemplate>
                               <asp:Label runat="server" ID="lblName" Text='<%#Eval("PName") %>'></asp:Label>
                               <span class="EditStyle">
                                 <asp:LinkButton ID="btnEdit" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex%>'>
                                       <i class="fa-regular iconStyle fa-pen-to-square"></i>

                                   </asp:LinkButton>

                               </span>


                            </ItemTemplate>
                       </asp:TemplateField>


                    <asp:TemplateField HeaderText="Status" HeaderStyle-Width="30px">

                        <ItemTemplate>
                            <label class="switch">

                                <asp:CheckBox ID="chkStatus" runat="server" OnCheckedChanged="chkStatus_CheckedChanged" AutoPostBack="true" ClientIDMode="Static" EnableViewState="true" Checked='<%#Convert.ToBoolean(Eval("PStatus")) %>' />
                                <span class="slider round"></span> 
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>


            </asp:GridView>
            </div>
        </ContentTemplate>

     </asp:UpdatePanel>
       

</asp:Content>

<asp:Content runat="server" ID="Content3" ClientIDMode="Static" ContentPlaceHolderID="ScriptContent">
       <script type='text/javascript'>
        function validateInputs() {
                try {
                    if (!validateText('txtParticulerName', 1, 100, 'Enter valid particular name')) {
                        return false;
                    }


                }
                catch (e) {
                    showMessage("Validation failed: " + e.message, 'error');
                    console.log(e.message);
                    return false;
                }

               

                return true; 
            }




        </script>

</asp:Content>


