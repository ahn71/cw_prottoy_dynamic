<%@ Page Title="Question Pattern" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="QuestionPattern.aspx.cs" Inherits="DS.UI.Academic.Examination.QuestionPattern" %>

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
            text-align: left;
            border: 1px solid #ddd !important;
        }

        .table {
            border-radius:0 !important;
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

         input#btnSave {
    background: forestgreen;
    margin-top: 17px;
    color: white;
}
          @media only screen and (min-width: 320px) and (max-width: 479px) {

            #btnSave {
                margin-left:initial;
            }
        
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
    <asp:UpdatePanel ID="uplMessage" runat="server">
        <ContentTemplate>
            <p class="message" id="lblMessage" clientidmode="Static" runat="server"></p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="lblQPId" ClientIDMode="Static" runat="server" />
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
                 <%--<li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>--%>                
                <%--<li><a runat="server" href="~/UI/Academic/Examination/ExamHome.aspx">Examination Module</a></li>--%>
                 <li>  <a runat="server" id="aAcademicHome" >Academic Module</a></li>
                <li><a runat="server" id="aExamHome">Examination Module</a></li> 
                <li class="active">Question Pattern</li>               
            </ul>
            <!--breadcrumbs end -->
        </div>
    </div>


    <asp:UpdatePanel runat="server" ID="upQuestionMark">
        <ContentTemplate>
                    <div class="row">

            <div class="col-md-4">
                <h4 class="text-right" style="float:left">Question Pattern</h4>
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-12">
                <div class="row">
                      <div class="col-md-2"></div>
                        <div class="col-md-4">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="tgPanel">
                                <div id="divQuestionPattern" class="datatables_wrapper" runat="server" 
                                    style="width: 100%; height: auto; max-height: 500px; overflow: auto; overflow-x: hidden;"></div>
                                    </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                 
                        <div class="tgPanel">
                            <div class="tgPanelHead">Add Question Pattern</div>
                            <%--<table class="tbl-controlPanel">                                
                                <tr>
                                    <td>Question Pattern</td>
                                    <td>
                                        <asp:TextBox ID="txtQPName" runat="server" ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>
                                    </td>
                                </tr> 
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnSave" ClientIDMode="Static" CssClass="btn btn-primary" runat="server" Text="Save" 
                                    OnClientClick="return validateInputs();" OnClick="btnSave_Click" />
                                &nbsp;<input type="button" class="btn btn-default" value="Clear" onclick="clearText();" />
                                    </td>    
                               </tr>                           
                            </table>--%>
                            <div class="row"> 

                                <div class="col-lg-3">
                                     <div class="form-group">
     <label for="exampleInputName2">Question Pattern</label>
     <asp:TextBox ID="txtQPName" runat="server" ClientIDMode="Static" CssClass="input form-control"></asp:TextBox>
     
 </div>
                                </div>
				              <div class="col-lg-3">
                                        <label for="exampleInputName2" disabled="true"></label>
                                         <asp:Button ID="btnSave" ClientIDMode="Static" CssClass="btn btn-              primary" runat="server" Text="Save" 
                                     OnClientClick="return validateInputs();" OnClick="btnSave_Click" />
				                 </div>     
			                      
	                          </div>
                         </div>
                             
                        </div>                  
                </div>
            <asp:GridView runat="server" ID="gvQuestionMarks" AutoGenerateColumns="False" CssClass="table"  BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" CellPadding="2" OnRowCommand="gvQuestionMarks_RowCommand"  Width="100%" ridLines="Vertical"
                 DataKeyNames="QPId"
         PagerStyle-CssClass="pgr">
                <RowStyle CssClass="gridRow" />
<HeaderStyle CssClass="gridHeader" />
                <Columns>
                      <asp:TemplateField HeaderText="SL">
                      <ItemTemplate>
                          <%#Container.DataItemIndex+1 %>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Question Pattern">
                      <ItemTemplate>
                          <asp:Label ID="lblQuestionPname" runat="server" Text='<%# Eval("QPName") %>'></asp:Label>
                           <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
                      <span class="update-icon" ><i class="fas fa-edit"></i></span>
                                    </asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>


                     <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
            <label class="switch">
                <asp:CheckBox ID="chkSwitchStatus" runat="server"  OnCheckedChanged="chkSwitchStatus_CheckedChanged" AutoPostBack="true"
                    EnableViewState="true" Checked='<%# Convert.ToBoolean(Eval("IsActive")) %>' />
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
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
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
            if (validateText('txtQPName', 1, 30, 'Enter Question Pattern') == false) return false;
            return true;
        }
        function editQuestionPattern(QPId) {
            $('#lblQPId').val(QPId);
            var strQP = $('#r_' + QPId + ' td:first-child').html();
            $('#txtQPName').val(strQP);
             strQP = $('#r_' + QPId + ' td:nth-child(2)').html();
             if (strQP == "Yes") {              
                $('#chkIsActive').removeProp('checked');
                $('#chkIsActive').click();

            }
            else $('#chkIsActive').removeProp('checked');
            $("#btnSave").val('Update');
        }
        function clearText() {
            $('#lblQPId').val('');
            $('#txtQPName').val('');
            setFocus('txtQPName');
            $('#btnSave').val('Save');
        }
        function updateSuccess() {
            loaddatatable();
            showMessage('Updated successfully', 'success');
            clearText();
        }
        function SaveSuccess() {
            loaddatatable();
            showMessage('Save successfully', 'success');
            clearText();
        }
    </script>
</asp:Content>
