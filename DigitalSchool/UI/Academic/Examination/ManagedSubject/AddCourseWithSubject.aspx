<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddCourseWithSubject.aspx.cs" Inherits="DS.UI.Academic.Examination.ManagedSubject.AddCourseWithSubject" %>

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
            text-align: center;
            border: 1px solid #ddd !important;
        }

        .table {
            border: 0 !important;
            margin: 10px 0;
        }
        .border-1{
            border:1px solid #ddd;
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
            <ul class="breadcrumb py-3">
                <li>
                    <a runat="server" href="~/Dashboard.aspx">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>
                <li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Examination/ExamHome.aspx">Examination Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Examination/ManagedSubject/SubjectManageHome.aspx">Subject Management</a></li>
                <li class="active">Add Course With Subject</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
    <div class="bg-white p-3 mb-3">
        <div class="row">
            <div class="col-md-6">
                <h4 class="text-right fw-bold mb-3" style="float: left;">Add Course With Subject List</h4>
            </div>
        </div>
        <div class="inputPannel">

            <div class="row">
                <div class="col-lg-4">
                     <asp:Label runat="server" ID="lblSubjectName" Text="Subject Name"></asp:Label>
                     <asp:DropDownList CssClass="form-control" ID="ddlSubjectList" runat="server"></asp:DropDownList>
                </div>

                <div class="col-lg-4">
                    <asp:Label runat="server" ID="lblCourseName" Text="Course Name"></asp:Label>
                    <asp:TextBox  CssClass="form-control" ID="txtCourseName" runat="server"></asp:TextBox>
                </div>

                <div class="col-lg-4">
                    <asp:Label runat="server" ID="lblOrdering" Text="Ordering"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtOrdering" runat="server"></asp:TextBox>
                </div>

            </div>

           

  
            
           
        </div>

        <div class="d-flex gap-3 justify-content-end align-items-center py-3">
            <div class="active-wrapper">
               <asp:Label runat="server" ID="lblStats" Text="Is Active?"></asp:Label>
                <asp:CheckBox  for="lblStats" ID="chkStauts" runat="server" />
            </div>

            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
        </div>





    </div>

    <div class="main-table">
                <%--Seaech--%>
        <div class="btnSection row justify-content-end">
            <div class="col-lg-4">
                <div class="search-wrapper d-flex align-items-center border-1 rounded bg-white">
                    <asp:TextBox CssClass="form-control border-0" runat="server" ID="txtSearch" oninput="filterGridView()" placeholder="Type to Search"></asp:TextBox>
                    <span class="d-block pe-3"><i class="fas fa-search"></i></span>
                </div>
            </div>
        </div>

        <div class="gvTable">
            <asp:GridView ID="gvCourseSubList" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" OnRowCommand="gvCourseSubList_RowCommand" OnPageIndexChanging="gvCourseSubList_PageIndexChanging"
                CssClass="table" AllowPaging="True" PageSize="10"
                DataKeyNames="SubId" GridLines="Vertical"
                PagerStyle-CssClass="pgr"
                Width="100%">
             
                <RowStyle CssClass="gridRow" />
                <HeaderStyle CssClass="gridHeader" />
                <Columns>

                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject Name">
                        <ItemTemplate>
                            <asp:Label ID="lblSubName" runat="server" Text='<%# Eval("SubName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Course Tittle">
                        <ItemTemplate>
                            <asp:Label ID="lblCourse" runat="server" Text='<%# Eval("CourseName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Orderning">
                        <ItemTemplate>
                            <asp:Label ID="lblOrder" runat="server" Text='<%# Eval("Ordering") %>'></asp:Label>
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
                                    EnableViewState="true" Checked='<%# Convert.ToBoolean(Eval("IsActive")) %>' />
                                <span class="slider round"></span>
                            </label>

                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>

            </asp:GridView>
        </div>

    </div>

    <script type="text/javascript">
        function filterGridView() {

            var searchValue = document.getElementById('<%=txtSearch.ClientID%>').value.toLowerCase();
             var grid = document.getElementById('<%=gvCourseSubList.ClientID%>');
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

