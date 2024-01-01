   <%@ Page Title="Add Designation" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddDesignation.aspx.cs" Inherits="DS.UI.Administration.HR.Employee.AddDesignation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            .gridRow {
        border: 1px solid #999999; /* Set the border style for each row */
    }
    .switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
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
                <li><a runat="server" href="~/UI/Administration/AdministrationHome.aspx">Administration Module/</a></li>
                <li><a runat="server" href="~/UI/Administration/HR/hrHome.aspx">Human Resource Module/</a></li>
                <li><a runat="server" href="~/UI/Administration/HR/Employee/EmpHome.aspx">Employee Management/</a></li>  
                <li class="active">Add Designation</li>              
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>

     <div class="fghj">
          <label id="lblDesName" runat="server">Designation</label>
             <asp:TextBox ID="txtDesName" runat="server"></asp:TextBox>
            <asp:CheckBox runat="server" ID="chkStatus" Text="IsActive"/>

     </div>
            

       <asp:Button  runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click1"/>

          <h4 class="text-right" style="float:left">Designation List</h4>
                            
           
    <div class="ghjkl">
                 <asp:GridView runat="server" ID="gvDesgtionlist" OnRowCommand="gvDesgtionlist_RowCommand" AutoGenerateColumns="False" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" 
        DataKeyNames="DesId" GridLines="Vertical" 
        PagerStyle-CssClass="pgr"  Width="70%">
               <HeaderStyle BackColor="#006666" CssClass="bg-Danger"/>


                 <RowStyle CssClass="gridRow" />
     
         <Columns>
           
      <asp:TemplateField HeaderText="SL">
            <ItemTemplate>
                 <%#Container.DataItemIndex+1 %>
            </ItemTemplate>
        </asp:TemplateField>

<asp:TemplateField HeaderText="Desgination Name">
    <ItemTemplate>
        <asp:Label ID="lblDesname" runat="server" Text='<%# Eval("DesName") %>'></asp:Label>
    </ItemTemplate>          
</asp:TemplateField>


   <asp:TemplateField HeaderText="Update">
    <ItemTemplate>
     <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%# Container.DataItemIndex %>'>
    <i class="far fa-edit"></i>
</asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>

        <asp:TemplateField HeaderText="Status">
          <ItemTemplate>
             <label class="switch">
    <asp:CheckBox ID="chkSwitchStatus" runat="server" OnCheckedChanged="chkSwitchStatus_CheckedChanged" AutoPostBack="true" 
                  Checked='<%# Convert.ToBoolean(Eval("Status")) %>' />
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
        $(document).ready(function () {
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'tblDesignationList', '');
            });
            $('#tblDesignationList').dataTable({
                "iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        });
       
    </script>
</asp:Content>
