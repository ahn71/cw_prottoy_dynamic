﻿<%@ Page Title="Add Class" Language="C#" MasterPageFile="~/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="DigitalSchool.Admin.AddClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-1.10.2.min.js"></script>
    <link href="/Styles/gridview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="uplMessage" runat="server">
    <ContentTemplate><p class="message"  id="lblMessage" clientidmode="Static" runat="server"></p></ContentTemplate>
</asp:UpdatePanel>

<asp:HiddenField ID="lblClassId" ClientIDMode="Static" runat="server"/>

<div class="main-div">

        <div class="leftSide-div">

              <div class="tgPanel">
                <div class="tgPanelHead">ADD CLASS</div>

                <table class="tbl-controlPanel">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>

                    <tr>
                        <td>
                           Class Name
                        </td>
                        <td>
                           <asp:TextBox ID="txtClassName" runat="server" Width="261px" ClientIDMode="Static" CssClass="input"></asp:TextBox>
                        </td>
                    </tr>
                    
                </table>
                  <div class="buttonBox">
                    <asp:Button ID="btnSave" style="margin-top:30px;" ClientIDMode="Static" CssClass="greenBtn" OnClientClick="return validateInputs();"  runat="server" Text="Save" OnClick="btnSave_Click"/> 
                    <input  type="button" value="Clear" class="blueBtn" onclick="clearIt();" />
                    </div>
            </div>
            
        </div>


<div class="rightSide-div">

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="btnSave" />
</Triggers>
<ContentTemplate>
    <div id="divClassList" class="datatables_wrapper" runat="server" style="width:100%; height:auto; max-height:500px;overflow:auto;overflow-x:hidden;"></div>
</ContentTemplate>
 </asp:UpdatePanel>
    
     
</div>


</div>



<script src="/Scripts/adviitJS.js" type="text/javascript"></script>
<script src="/Scripts/master.js"></script>


    <script type="text/javascript">
        function validateInputs() {
            if (validateText('txtClassName', 1, 15, 'Enter a Class Name') == false) return false;
            return true;
        }

        function editClass(clsId) {
            $('#lblClassId').val(clsId);

            var strClass = $('#r_' + clsId + ' td:first-child').html();
            $('#txtClassName').val(strClass);
            $("#btnSave").val('Update');
        }

        function clearIt() {
            $('#lblClassId').val('');
            $('#txtClassName').val('');
            setFocus('txtClassName');
            $("#btnSave").val('Save');
        }

        function updateSuccess() {
            showMessage('Updated successfully', 'success');
            clearIt();
        }

    </script>


</asp:Content>
