<%@ Page Title="Add Category" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true"
    CodeBehind="AddDepartment.aspx.cs" Inherits="DS.UI.Administration.HR.Employee.AddDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tgPanel {
            width: 100%;
        }

        .tbl-controlPanel td:first-child {
            text-align: right;
            padding-right: 5px;
        }

        input[type="checkbox"] {
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

          <style type="text/css">
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

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <!--breadcrumbs start -->
            <ul class="breadcrumb py-2 border-0">
                <li>
                    <a runat="server" href="~/Dashboard.aspx">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>
                <li><a runat="server" href="~/UI/Administration/AdministrationHome.aspx">Administration
                    Module</a></li>
                <li><a runat="server" href="~/UI/Administration/HR/hrHome.aspx">Human Resource Module</a>
                </li>
                <li><a runat="server" href="~/UI/Administration/HR/Employee/EmpHome.aspx">Employee Management</a>
                </li>
                <li class="active">Add Department</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
    <div>
      <div>
          <label id="lblDeptName" runat="server">Department</label>
          <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
          <asp:CheckBox runat="server" ID="chkIsteacher" Text="IsTeacher"/>
          <asp:CheckBox runat="server" ID="chkStatus" Text="IsActive"/>
           
      </div>
    <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click"/>

    <asp:GridView ID="gvDepartment"  runat="server" AlternatingRowStyle-CssClass="alt"    AutoGenerateColumns="False" CssClass="table"  OnRowCommand="gvDepartment_RowCommand"
    BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" 
    DataKeyNames="Did" GridLines="Vertical" 
    PagerStyle-CssClass="pgr" 
    Width="70%">
         <HeaderStyle BackColor="#006666" CssClass="bg-primary"/>

    <RowStyle CssClass="gridRow" />
     
         <Columns>
           
      <asp:TemplateField HeaderText="SL">
            <ItemTemplate>
                 <%#Container.DataItemIndex+1 %>
            </ItemTemplate>
        </asp:TemplateField>

<asp:TemplateField HeaderText="Department Name">
    <ItemTemplate>
        <asp:Label ID="lblDname" runat="server" Text='<%# Eval("Dname") %>'></asp:Label>
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
                  Checked='<%# Convert.ToBoolean(Eval("DStatus")) %>' />
    <span class="slider round"></span>
</label>
   
         </ItemTemplate>
        </asp:TemplateField>

       <asp:TemplateField HeaderText="IsTeacher">
    <ItemTemplate>
        <label class="switch">
            <asp:CheckBox ID="chkSwitchIsTeacher" runat="server" OnCheckedChanged="chkSwitchIsTeacher_CheckedChanged" ClientIDMode="static" EnableViewState="true" AutoPostBack="true" 
                          Checked='<%# Convert.ToBoolean(Eval("IsTeacher")) %>' />
            <span class="slider round"></span>
        </label>
    </ItemTemplate>
</asp:TemplateField>

       </Columns>

    </asp:GridView>
  </div>


</asp:Content>
