<%@ Page Title="Add Exam Type" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddExam.aspx.cs" Inherits="DS.UI.Academics.Examination.AddExam" %>
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


span#MainContent_lblType {
    font-weight: 700;
    display: block;
    margin-top: -2px;
}
.table-wrapper tbody tr td label{
    padding:0 10px;
    display:inline-block;
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
    <asp:HiddenField ID="lblExId" ClientIDMode="Static" runat="server" />
    <div class="row">
        <div class="col-md-12">
            <!--breadcrumbs start -->
            <ul class="breadcrumb">
                <li>
                   <%-- <a runat="server" href="~/Dashboard.aspx">--%>
                    <a runat="server" id="aDashboard">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li> 
                <li>
                    <%--<a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a>--%>
                    <a runat="server" id="aAcademicHome" >Academic Module</a>
                </li>
                <%--<li><a runat="server" href="~/UI/Academic/Examination/ExamHome.aspx">Examination Module</a></li>--%>
                <li><a runat="server" id="aExamHome">Examination Module</a></li>
                <li class="active">Add Exam Type</li>
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>
   
        <asp:UpdatePanel runat="server" ID="upgvExamTabel" ClientIDMode="Static">
        <ContentTemplate>
   <div class="bg-white p-3 mb-3">
      <div class="row">
          <div class="col-md-6">
              <h4 class="text-right fw-bold mb-3" style="float: left;">Add Exam Type</h4>
          </div>
      </div>
      <div class="inputPannel">

          <div class="row">

              <div class="col-lg-4">
                  <asp:Label runat="server" ID="lblExamName" Text="Exam Name"></asp:Label>
                  <asp:TextBox  CssClass="form-control" ID="txtExamName" runat="server"></asp:TextBox>
                 
              </div>    

          </div>
          <div class="rdioBtn d-flex mt-3 g-3">
            <asp:Label CssClass="pe-3" runat="server" ID="lblType" Text="Type:"></asp:Label>
             <div class="d-flex gap-2">
                 <asp:RadioButton runat="server" ID="rdoSemesterExam" Text="Semester Exam" value="SemesterExam" GroupName="examGroup" ClientIDMode="Static" CssClass="examRadioButton"/>
                <asp:RadioButton runat="server" ID="rdoQuiz" Text="Quiz" value="Exam" GroupName="examGroup" ClientIDMode="Static" CssClass="examRadioButton"/>
                <asp:RadioButton runat="server" ID="rdoOthers" Text="Others" value="Semester" GroupName="examGroup" ClientIDMode="Static" CssClass="examRadioButton" />



              <%--<asp:RadioButtonList runat="server" ID="rdioList" CssClass="d-flex table-wrapper">
                <asp:ListItem Text="Semester Exam" Value="SemesterExam" style="border:none; display:flex;"></asp:ListItem>
                <asp:ListItem Text="Exam" Value="SemesterExam" style="border:none; display:flex;"></asp:ListItem>
                <asp:ListItem Text="Semester" Value="SemesterExam" style="border:none; display:flex;"></asp:ListItem>
            </asp:RadioButtonList>--%>
         </div>
    </div>

  </div>

      <div class="d-flex gap-3 justify-content-end align-items-center py-3">
         <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click1" Text="Save"/>
       </div>
</div>

     <asp:GridView runat="server" ID="gvExamList" AutoGenerateColumns="False" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" OnRowDataBound="gvExamList_RowDataBound" OnRowCommand="gvExamList_RowCommand"
      DataKeyNames="ExId" GridLines="Vertical" 
      PagerStyle-CssClass="pgr"  Width="100%">
             

          <RowStyle CssClass="gridRow" />

                      <Columns>
         
                    <asp:TemplateField HeaderText="SL">
                          <ItemTemplate>
                               <%#Container.DataItemIndex+1 %>
                          </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="ExamName">
                          <ItemTemplate>
                              <asp:Label ID="lblExamName" runat="server" Text='<%# Eval("ExName") %>'></asp:Label>
                                  <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
                               <span class="update-icon" ><i class="fas fa-edit"></i></span>
                                 </asp:LinkButton>
                          </ItemTemplate>          
                      </asp:TemplateField>      

                       <asp:TemplateField HeaderText="Type">
                           <ItemTemplate>
                               <asp:Label ID="lblType" runat="server" Text='<%# Eval("SemesterExam") %>'></asp:Label>
                           </ItemTemplate>          
                       </asp:TemplateField>

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                      <label class="switch">
                    <asp:CheckBox ID="chkSwitchStatus" runat="server" OnCheckedChanged="chkSwitchStatus_CheckedChanged" AutoPostBack="true" 
                   Checked='<%# Convert.ToBoolean(Eval("IsActive")) %>' />
                  <span class="slider round"></span>
              </label>
 
             </ItemTemplate>
          </asp:TemplateField>

     </Columns>
         </asp:GridView>

        </ContentTemplate>
    </asp:UpdatePanel>
  





</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
   
    </script>
</asp:Content>

