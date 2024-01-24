<%@ Page Title="Add Category" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true"
    CodeBehind="AddDepartment.aspx.cs" Inherits="DS.UI.Administration.HR.Employee.AddDepartment" %>

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
           /* text-align: center;*/
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
    <asp:UpdatePanel ID="uplMessage" runat="server" UpdateMode="Conditional">
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
                <li><a runat="server" href="~/UI/Administration/AdministrationHome.aspx">Administration/
                    Module</a></li>
                <li><a runat="server" href="~/UI/Administration/HR/hrHome.aspx">Human Resource Module/</a>
                </li>
                <li><a runat="server" href="~/UI/Administration/HR/Employee/EmpHome.aspx">Employee Management/</a>
                </li>
                <li class="active text-danger">Add Department</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
    

 

             
    <div class="main-table">

   
<asp:UpdatePanel runat="server" ID="upPannel" ClientIDMode="Static">
    <ContentTemplate>



          





          <div class="bg-white p-3 mb-3">
      <div class="row">
          <div class="col-md-6">
              <h4 class="text-right fw-bold mb-3" style="float: left;">Add Department</h4>
          </div>
      </div>


      <div class="inputPannel">
          <div class="row">

              <div class="col-lg-3">
                  <asp:Label runat="server" ID="lblDeptName" Text="Department Name"></asp:Label>
                  <asp:TextBox  CssClass="form-control" ID="txtDepartment" runat="server"></asp:TextBox>
              </div> 
              
              <div class="col-lg-3" style="margin-top:17px;">
                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Save" /> 
          
              </div>

          </div>
      </div>
</div>





                   <div class="btnSection row justify-content-end">
         <div class="col-lg-4">
             <div class="search-wrapper d-flex align-items-center border-1 rounded bg-white">
<asp:TextBox  CssClass="form-control border-0" ID="txtSearch" runat="server" oninput="filterGridView()" placeholder="Type to Search"></asp:TextBox>
                 <span class="d-block pe-3"><i class="fas fa-search"></i></span>
             </div>
         </div>
   </div>






            <div class="gvTable">
            <asp:GridView ID="gvDepartment"  runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="table"  OnRowCommand="gvDepartment_RowCommand"
    BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" 
    DataKeyNames="Did" GridLines="Vertical" 
    PagerStyle-CssClass="pgr"  AllowPaging="true"  OnPageIndexChanging="gvDepartment_PageIndexChanging"
    Width="100%">
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
             <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
       <span class="update-icon" ><i class="fas fa-edit"></i></span>
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

    </ContentTemplate>
</asp:UpdatePanel>
   

  </div>

 
</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="ScriptContent">
        <script type="text/javascript">
            function filterGridView() {
            
                var searchValue = document.getElementById('<%=txtSearch.ClientID%>').value.toLowerCase();
            var grid = document.getElementById('<%=gvDepartment.ClientID%>');
                var rows = grid.getElementsByTagName('tr');

                for (var i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
                    var row = rows[i];
                    var cells = row.getElementsByTagName('td');
                    var found = false;

                    for (var j = 0; j < cells.length; j++) {
                        var cellText = cells[j].innerText.toLowerCase();

                        if (cellText.indexOf(searchValue) > -1) {
                            found = true;
                            break;
                        }
                    }

                    if (found) {
                        row.style.display = ''; // Show the row if found
                    } else {
                        row.style.display = 'none'; // Hide the row if not found
                    }
                }
            }

        </script>
</asp:Content>
