<%@ Page Title="Class ways Subject Set" Language="C#" MasterPageFile="~/main.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ClassSubjectSetup.aspx.cs" Inherits="DS.UI.Academic.Examination.ManagedSubject.ClassSubjectSetup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tgPanel {
            width: 100%;
        }
        .controlLength{
            width: 200px;
        }
        .tbl-controlPanel td:first-child{
            text-align: right;
            padding-right: 5px;
        }        
         input[type="checkbox"] {
        margin: 5px;
        }
        .table td:nth-child(2) {
            text-align:left;
        }
         .table tr th{
             background: #ddd !important;
            color: black;
        }

          td, th {
             text-align: center;
             border: 1px solid #ddd !important;
             }

             .table {
                 border-radius:0 !important;
                 margin: 10px 0;
             }
             .border-1{
                 border:1px solid #ddd;
             }


        .rbl label {
            margin:5px;
        }
        #tblClassList {
            margin-top:0px!important;
        
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

        @media only screen and (min-width: 320px) and (max-width: 479px) {

            .radio-inline {
                width:100%;
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
    <asp:HiddenField ID="CSId" ClientIDMode="Static" runat="server" />
    
        <div class="col-md-12">
            <!--breadcrumbs start -->
            <ul class="breadcrumb">
                <li>
                    <a runat="server" href="~/Dashboard.aspx">
                        <i class="fa fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>
                <li><a runat="server" href="~/UI/Academic/AcademicHome.aspx">Academic Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Examination/ExamHome.aspx">Examination Module</a></li>
                <li><a runat="server" href="~/UI/Academic/Examination/ManagedSubject/SubjectManageHome.aspx">Subject Management</a></li>
                <li class="active">Class Wise Subject Setup</li>               
            </ul>
            <!--breadcrumbs end -->
        </div>
  
    <h4 class="text-right fw-bold mb-3" style="float: left;">Class Subject Setup</h4>

   <div class="row w-100">
      <div class="tgPanel row g-2">
                     
          <div class="col-md-3">
                <asp:Label runat="server" ID="lblClaas">Class</asp:Label>
                             
                   <asp:DropDownList ID="ddlClassName" runat="server" ClientIDMode="Static" CssClass="input controlLength form-control" AutoPostBack="True"
                                     OnSelectedIndexChanged="ddlClassName_SelectedIndexChanged">
                                 </asp:DropDownList>
                           
          </div>
                         

         <div class="col-md-3">
                             <asp:Label runat="server" ID="lblSubjectName">Subject Name</asp:Label>
                           
                                 <asp:DropDownList ID="ddlSubject" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static"
                                     AutoPostBack="True" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                 </asp:DropDownList>
                           
                   </div>  
                         

               <div class="col-md-3">
                        <asp:Label runat="server" ID="lblCourseName">Course</asp:Label>
                             
                                 <asp:DropDownList ID="ddlCourse" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static" >
                                 </asp:DropDownList>
                           
                       
                  </div>       
               <div class="col-md-3">
                            <asp:Label runat="server" ID="lblMarks">Marks</asp:Label>
                          
                                 <asp:TextBox ID="txtMarks" CssClass="input controlLength form-control" runat="server" MaxLength="7"  ClientIDMode="Static"></asp:TextBox>
                        
                         
                </div>            
                     
               <div class="col-md-3">
             <asp:Label runat="server" ID="lblCode">Code</asp:Label>
                                
                                     <asp:TextBox ID="txtSubCode" CssClass="input controlLength form-control" runat="server" MaxLength="7"  ClientIDMode="Static"></asp:TextBox>
                                 
       </div>          
             
               <div class="col-md-3">
                            <asp:Label runat="server" ID="lblGroup">Group</asp:Label>
                          <%--   <tr id="trGroup" runat="server">--%>
                            
                            
                                <asp:RadioButtonList ID="rblGroupList" runat="server"  RepeatDirection="Vertical" RepeatColumns="2" AutoPostBack="True" CssClass="rbl" OnSelectedIndexChanged="rblGroupList_SelectedIndexChanged" >
                                   
                                </asp:RadioButtonList>
                            
                         <%--</tr>--%>
                         
                           <asp:Label runat="server" ID="lblOrder">Order</asp:Label>
                           
                                 <asp:TextBox ID="txtOrderBy" CssClass="input controlLength form-control" runat="server" MaxLength="7"  ClientIDMode="Static"></asp:TextBox>
                                                                                                                                 </div>  
                            
                        

                        <%-- Related Subject--%>
               <div class="col-md-3">
                        <asp:Label runat="server" ID="lblRelatedSubject">Related Subject</asp:Label>
                             
                                 <asp:DropDownList ID="ddlRelatedSubject" runat="server" CssClass="input controlLength form-control" ClientIDMode="Static">
                                 </asp:DropDownList>
                            
                        

                        </div>  
                        <%-- Related Subject dropown end--%>


                       <div class="col-md-3">
                            <asp:CheckBoxList runat="server" ID="chkSubjectType"  ClientIDMode="Static" RepeatDirection="Horizontal"  OnSelectedIndexChanged="chkSubjectType_SelectedIndexChanged">
                                     <asp:ListItem class="radio-inline" Value="0">Optional</asp:ListItem>
                                     <asp:ListItem class="radio-inline" Value="1">Optional + Mandatory</asp:ListItem>
                                 </asp:CheckBoxList> 


                             <asp:Button CssClass="btn btn-primary" ID="btnSave" runat="server" ClientIDMode="Static"
                                     Text="Save" OnClientClick="return validateInputs();" OnClick="btnSave_Click" />
                                 &nbsp;<asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-default" OnClientClick="return clearText();"/> 
                                 &nbsp;<asp:LinkButton ID="lnkbtnpassMarks" style="border-bottom:solid 1px;"
                                      OnClientClick="return validatePassMarks();" 
                                     OnClick="lnkbtnpassMarks_Click" runat="server" ForeColor="#1fb5ad" 
                                     Text="Set Dependency Subject Pass Marks"
                                      ClientIDMode="Static"></asp:LinkButton>
                          
                      </div>  
                                                          
                 </div>
          
      </div>



       
         
    
    
    
    
    <div class="col-md-7">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" />
                        <asp:AsyncPostBackTrigger ControlID="ddlClassList" />
                        <asp:AsyncPostBackTrigger ControlID="ddlClassName" />
                       
                    </Triggers>
                    <ContentTemplate>
                        <table class="col-md-12">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlClassList" runat="server" CssClass="input"
                                        Style="height: 26px; width: 150px; margin-right: 10px; padding: 2px" ClientIDMode="Static"
                                        AutoPostBack="True" OnSelectedIndexChanged="ddlClassList_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">...Select Class...</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btnPrint" CssClass="btn btn-primary" Text="Print" OnClick="btnPrint_Click"></asp:Button>
                                </td>
                                <td>
                                      <div class="dataTables_filter_New" style="float: right;">
                                    <label>
                                        Search:
                                    <input type="text" class="Search_New" placeholder="type here" />
                                    </label>
                                </div>
                                </td>
                                <td>
                                    <h4 class="text-right">Class Wise Subject List</h4>
                                </td>
                            </tr>
                        </table>





                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            
           <%-- <div class="col-md-12">--%>
              
                   
           <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                                <asp:AsyncPostBackTrigger ControlID="ddlClassList" />
                                <asp:AsyncPostBackTrigger ControlID="ddlClassName" />
                                <asp:AsyncPostBackTrigger ControlID="ddlSubject" />
                                 <asp:AsyncPostBackTrigger EventName="RowCommand" ControlID="gvClassSubject" />
                                <asp:AsyncPostBackTrigger ControlID="chkSubjectType" />
                              <%--  <asp:AsyncPostBackTrigger ControlID="btnReset" />--%>
                            </Triggers>
                            <ContentTemplate>
                               <%-- <div id="divClassSubject" class="datatables_wrapper tgPanel" runat="server"
                                    style="width: 100%; height: auto; max-height: 450px; overflow: auto; overflow-x: hidden;">
                                </div>--%>                                
                                 
                         
                      <div class="gvTable">
                                <asp:GridView runat="server" ClientIDMode="Static" CssClass="table"
                               ID="gvClassSubject" AutoGenerateColumns="false" Width="100%"  HeaderStyle-HorizontalAlign="Center" DataKeyNames="ClassSubjectId,ClassId,GroupId" AllowPaging="true" PageSize="15" OnPageIndexChanging="gvClassSubject_PageIndexChanging" OnRowCommand="gvClassSubject_RowCommand">
                                   
                                  
                                    <Columns>
                                         <asp:BoundField DataField="Class.ClassName" HeaderText="Class" />
                                       
                                        
                                         <asp:TemplateField HeaderText="Subject">
                                             <ItemTemplate>
                                             <asp:Label ID="lblSubName" runat="server" Text='<%# Eval("Subject.SubjectName") %>'></asp:Label>

                                                  <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Alter" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'>
                                        <span class="update-icon" ><i class="fas fa-edit"></i></span>
                                            </asp:LinkButton>
                                             </ItemTemplate>
                                         </asp:TemplateField>

                                        <asp:BoundField DataField="Course.CourseName" HeaderText="Course" />

                                        
                                        <asp:BoundField DataField="SubjectCode" HeaderText="Code" ItemStyle-HorizontalAlign="Center" >

                                         <ItemStyle HorizontalAlign="Center" />
                                         </asp:BoundField>

                                        <asp:BoundField DataField="OrderBy" HeaderText="Order" ItemStyle-HorizontalAlign="Center" >
                                         <ItemStyle HorizontalAlign="Center" />
                                         </asp:BoundField>
                                        <asp:BoundField DataField="SubMarks" HeaderText="Marks" ItemStyle-HorizontalAlign="Center" >
                                         <ItemStyle HorizontalAlign="Center" />
                                         </asp:BoundField>
                                        <asp:BoundField DataField="Mandatory" HeaderText="Mandatory" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >    
                                         <HeaderStyle HorizontalAlign="Center" />
                                         <ItemStyle HorizontalAlign="Center" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Both" HeaderText="O+M" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >    
                                         <HeaderStyle HorizontalAlign="Center" />
                                         <ItemStyle HorizontalAlign="Center" />
                                         </asp:BoundField>
                                  </Columns>
                                </asp:GridView>
                                     <div runat="server" style="font-size:x-large; text-align:center;color:black;margin: 125px auto;" id="divSub"></div>
                                         </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                <%--    </div>--%>
                
              
                      <!-- Dependency modal -->
           <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <Triggers>                                
                                <asp:AsyncPostBackTrigger ControlID="lnkbtnpassMarks" />   
                                <asp:AsyncPostBackTrigger ControlID="btnSaveDepedencyMarks" />                             
                            </Triggers>
                            <ContentTemplate>
                            <asp:ModalPopupExtender ID="showDependencyModal" runat="server" BehaviorID="modalpopup2" CancelControlID="Button4"
                                OkControlID="LinkButton2"
                                TargetControlID="button5" PopupControlID="showParticular" BackgroundCssClass="ModalPopupBG">
                            </asp:ModalPopupExtender>
                            <div id="showParticular" runat="server" style="display: none;" class="confirmationModal500">
                                <div class="modal-header">
                                    <button id="Button4" type="button" class="close white"></button>
                                    <div class="tgPanelHead">Add Dependency Pass Marks</div>
                                </div>
                                <div class="modal-body">
                                    <table class="tbl-controlPanel">
                                        <tr>
                                            <td>Class Name
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlMarksClass" runat="server" ClientIDMode="Static" CssClass="input controlLength"></asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="tgPanel">
                                        <asp:Panel ID="dependencyPanel" runat="server" CssClass="datatables_wrapper" Width="100%" ScrollBars="Auto">
                                            <asp:GridView ID="gvSubjectList" CssClass="table table-bordered" runat="server" Width="100%" AutoGenerateColumns="False">
                                                <RowStyle HorizontalAlign="Center" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hideSubId" runat="server"
                                                                Value='<%# DataBinder.Eval(Container.DataItem, "Subject.SubjectId")%>' />
                                                            <%# Container.DataItemIndex+1%>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="Subject Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubName" style="float:left"  runat="server"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Subject.SubjectName")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="input controlLength" HeaderText="Pass Marks">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtPassMarks" style="width:78px;text-align:center;" CssClass="input controlLength" runat="server"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "PassMarks")%>'></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>   

                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button id="button5" type="button" runat="server" style="display: none;" />
                                    <asp:LinkButton ID="LinkButton2" runat="server" ClientIDMode="Static" CssClass="btn btn-default">
                                        <i class="icon-remove"></i>                                    
                                        Close
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnSaveDepedencyMarks" runat="server" CssClass="btn btn-primary" UseSubmitBehavior="false"
                                       OnClick="btnSaveDepedencyMarks_Click"  >
                                        <i class="icon-ok"></i>
                                        Save
                                    </asp:LinkButton>
                                </div>
                            </div>
                                </ContentTemplate>
                         </asp:UpdatePanel>
                            <!-- END Dependency modal -->     
  
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            
            $(document).on("keyup", '.Search_New', function () {
                searchTable($(this).val(), 'gvClassSubject', '');

            });
            loadStudentInfo();
           
        });
        function loadStudentInfo() {
            load();
            $('#gvClassSubject').dataTable({
                "iDisplayLength": 10,
                "lengthMenu": [10, 20, 30, 40, 50, 100]
            });
        }
            function load() {
                $("#ddlSubject").select2();
                $("#ddlRelatedSubject").select2();
            }
            function goToNewTab(url) {
                window.open(url);
               // load();
                loadStudentInfo();
            }
            function validateInputs() {
                
                if ($('#ddlClassName').val() == 0) {
                    showMessage('Select Class', 'warning');
                    $('#ddlClassName').focus();
                    return false;
                }
                if ($('#ddlSubject').val() == 0) {
                    showMessage('Select Subject', 'warning');
                    $('#ddlSubject').focus();
                    return false;
                }
                if (validateText('txtMarks', 1, 50, 'Type Marks') == false) {
                    $('#txtMarks').focus();
                    return false;
                }
                if (validateText('txtSubCode', 1, 50, 'Type Code') == false) {
                    $('#txtSubCode').focus();
                    return false;
                }
                if (validateText('txtOrderBy', 1, 50, 'Type Order') == false) {
                    $('#txtOrderBy').focus();
                    return false;
                }
                return true;
            }
            function editClassSubject(Id) {
                $('#CSId').val(Id);

                //alert();
                var strClass = $('#r_' + Id + ' td:first-child').html();



                var $results = $('#ddlClassName').find('*').filter(function () {
                    return $(this).text() == strClass;
                }).prop("selected", true);


                var strP = $('#r_' + Id + ' td:nth-child(2)').html();

                var $results = $('#ddlSubject').find('*').filter(function () {
                    return $(this).text() == strP;
                }).prop("selected", true);

                var subVal = $('#ddlSubject').val();

                var serverURL = window.location.protocol + "//" + window.location.host + "/";
                jx.load(serverURL + 'UI/Academic/Examination/ForUpdate.aspx?tbldata=getCourseList,' + subVal + '&val=' + Id + '&do=GetSubjectStatus', function (data) {

                    // var getLists = data.split(':');

                    $('#ddlCourse').html(data);
                    //$('#ddlCourse').html("");


                    /*
                    for (var i = 0; i < getLists.length; i++) {
    
                        var getTextVal = getLists[i].split('-');
    
                        var opt = document.createElement("option");
                        document.getElementById("ddlCourse").options.add(opt);
                        opt.text = getTextVal[0];
                        opt.value = getTextVal[1];
                    }
                    */

                });


                strP = $('#r_' + Id + ' td:nth-child(3)').html();

                var $results = $('#ddlCourse').find('*').filter(function () {
                    return $(this).text() == strP;
                }).prop("selected", true);

                if (strP == "") {
                    alert("OK");
                    $('#ddlCourse').val(0);



                }

                strP = $('#r_' + Id + ' td:nth-child(4)').html();
                $('#txtSubCode').val(strP);

                strP = $('#r_' + Id + ' td:nth-child(5)').html();
                $('#txtOrderBy').val(strP);

                strP = $('#r_' + Id + ' td:nth-child(6)').html();
                $('#txtMarks').val(strP);

                strP = $('#r_' + Id + ' td:nth-child(7)').html();
                if (strP == "No") {
                    $('#chkIsOptional').removeProp('checked');;
                    $('#chkIsOptional').click();
                }
                else $('#chkIsOptional').removeProp('checked');

                $("#btnSave").val('Update');
            }
            function clearText() {
                $('#CSId').val('');
                $('#txtOrderBy').val('');
                $('#txtSubCode').val('');
                $('#txtMarks').val('');
                // $('#ddlSubject').val('0');
                $('#ddlCourse').val('0');
                //$('#ddlClassName').val('0');
                $('#chkIsOptional').removeProp('checked');
                $('#btnSave').val('Save');
            }
            function validatePassMarks() {
                if ($('#ddlClassName').val() == 0) {
                    showMessage('Select Classs', 'warning');
                    $('#ddlClassName').focus();
                    return false;
                }
                return true;
            }
            function updateSuccess() {
                showMessage('Updated successfully', 'success');
                clearText();
            }
            function SaveSuccess() {
                showMessage('Save successfully', 'success');
                clearText();
            }
        
    </script>
</asp:Content>