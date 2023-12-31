<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDepartmentTest.aspx.cs" Debug="true" Inherits="DS.UI.Administration.HR.Employee.AddDepartmentTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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



</head>
<body>
    <form id="form1" runat="server">
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
                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%# Container.DataItemIndex %>' Text="Edit" />
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
    </form>
</body>
</html>
