<%@ Page Title="Create" Language="C#" MasterPageFile="~/Site.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="HistorySheet.Create" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm">
                <asp:Button ID="btnImport" runat="server" CssClass="btn btn-primary" Text="Import Data" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="importID" runat="server" />
    <hr />
    <div class="form-row">
        <div  class="form-group col-md-6">
            <label for="ddlCategory">Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                <asp:ListItem Text="A" Value="A" Selected="True"></asp:ListItem>
                <asp:ListItem Text="B" Value="B"></asp:ListItem>
                <asp:ListItem Text="C" Value="C"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="txtHistoryNo">Hisotry No</label>
            <asp:TextBox ID="txtHistoryNo" runat="server" CssClass="form-control" placeholder="History No" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtDistrict">Home District</label>
            <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" placeholder="District"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtPoliceStation">Police Station</label>
            <asp:TextBox ID="txtPoliceStation" runat="server" CssClass="form-control" placeholder="Police Station"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtReportDate">Report Date</label>
            <asp:TextBox ID="txtReportDate" runat="server" CssClass="form-control" placeholder="Report Date" contentEditable="false" AutoCompleteType="Disabled"></asp:TextBox>
            <ajax:CalendarExtender ID="CE1" runat="server" TargetControlID="txtReportDate" Format="dd-MMM-yyyy" />
        </div>
        <div class="form-group col-md-6">
            <label for="txtName">Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtAliases">Aliases @</label>
            <asp:TextBox ID="txtAliases" runat="server" CssClass="form-control" placeholder="Aliases"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="chkGender">Gender</label>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Male" Value="male" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female" ></asp:ListItem>
                <asp:ListItem Text="Transgender" Value="Transgender" ></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group col-md-6">
            <label for="txtFName">Father/Husband's Name</label>
            <asp:RadioButtonList ID="rblPrefix" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Father" Selected="True" Value="false"></asp:ListItem>
                <asp:ListItem Text="Husband" Value="true"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" placeholder="Father's Name"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtFAliases">Father/Husband's Aliases @</label>
            <asp:TextBox ID="txtFAliases" runat="server" CssClass="form-control" placeholder="Father's Aliases"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtProfession">Trade or Profession</label>
            <asp:TextBox ID="txtProfession" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtBirthYear">Year of Birth</label>
            <asp:TextBox ID="txtBirthYear" runat="server" CssClass="form-control" placeholder="Year of Birth"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtHeight">Height</label>
            <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" placeholder="Height"></asp:TextBox>
            <ajax:MaskedEditExtender Mask="9.99 Inch" runat="server" ID="mEE" MaskType="None" TargetControlID="txtHeight" ClearMaskOnLostFocus="false" />
        </div>
        <div class="form-group col-md-6">
            <label for="ddlBuild">Build</label>
            <asp:DropDownList ID="ddlBuild" runat="server" CssClass="form-control" placeholder="Build">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Thin</asp:ListItem>
                <asp:ListItem>Stout</asp:ListItem>
                <asp:ListItem>Erect</asp:ListItem>
                <asp:ListItem>Stooping</asp:ListItem>
                <asp:ListItem>Plump</asp:ListItem>
                <asp:ListItem>Stocky</asp:ListItem>
                <asp:ListItem>Overweight</asp:ListItem>
                <asp:ListItem>Fat</asp:ListItem>
                <asp:ListItem>Slim</asp:ListItem>
                <asp:ListItem>Trim</asp:ListItem>
                <asp:ListItem>Skinny</asp:ListItem>
                <asp:ListItem>Buff</asp:ListItem>
                <asp:ListItem>Well Built</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>Strong</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlHair">Hair Color</label>
            <asp:TextBox ID="txtHaircolor" runat="server" CssClass="form-control" placeholder="eg:- Black, Brown, White, etc."></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlHair">Hair Cut</label>
            <asp:TextBox ID="txtHaircut" runat="server" CssClass="form-control" placeholder="eg:- Plain, Stylish, etc."></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlEyebrow">Eyebrow</label>
            <asp:DropDownList ID="ddlEyebrow" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Thick</asp:ListItem>
                <asp:ListItem>Thin</asp:ListItem>
                <asp:ListItem>Arched</asp:ListItem>
                <asp:ListItem>Straight</asp:ListItem>
                <asp:ListItem>Meeting</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlForehead">Forehead</label>
            <asp:DropDownList ID="ddlForehead" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>High</asp:ListItem>
                <asp:ListItem>Low</asp:ListItem>
                <asp:ListItem>Upright</asp:ListItem>
                <asp:ListItem>Sloping</asp:ListItem>
                <asp:ListItem>Board</asp:ListItem>
                <asp:ListItem>Narrow</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlEye">Eye</label>
            <asp:DropDownList ID="ddlEye" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Large</asp:ListItem>
                <asp:ListItem>Small</asp:ListItem>
                <asp:ListItem>Wide or close-set</asp:ListItem>
                <asp:ListItem>Color</asp:ListItem>
                <asp:ListItem>Wears glasses</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlNose">Nose</label>
            <asp:DropDownList ID="ddlNose" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Large</asp:ListItem>
                <asp:ListItem>Small</asp:ListItem>
                <asp:ListItem>Hooked</asp:ListItem>
                <asp:ListItem>Snub</asp:ListItem>
                <asp:ListItem>Thick</asp:ListItem>
                <asp:ListItem>Thin</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlMouth">Mouth</label>
            <asp:DropDownList ID="ddlMouth" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Close-shut</asp:ListItem>
                <asp:ListItem>Shows teeth</asp:ListItem>
                <asp:ListItem>Thick</asp:ListItem>
                <asp:ListItem>Thin or short lips</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlChin">Chin</label>
            <asp:DropDownList ID="ddlChin" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Reeding</asp:ListItem>
                <asp:ListItem>Protruding</asp:ListItem>
                <asp:ListItem>Square</asp:ListItem>
                <asp:ListItem>Pointed</asp:ListItem>
                <asp:ListItem>Long</asp:ListItem>
                <asp:ListItem>Short</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlTeeth">Teeth</label>
            <asp:DropDownList ID="ddlTeeth" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Discoloured</asp:ListItem>
                <asp:ListItem>Irregular</asp:ListItem>
                <asp:ListItem>Missing in Front</asp:ListItem>
                <asp:ListItem>White</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlFinger">Fingers</label>
            <asp:DropDownList ID="ddlFingers" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Long</asp:ListItem>
                <asp:ListItem>Short</asp:ListItem>
                <asp:ListItem>Stub</asp:ListItem>
                <asp:ListItem>Pointed</asp:ListItem>
                <asp:ListItem>Figer deformed</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlEar">Ears</label>
            <asp:DropDownList ID="ddlEars" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Large</asp:ListItem>
                <asp:ListItem>Small</asp:ListItem>
                <asp:ListItem>Protruding</asp:ListItem>
                <asp:ListItem>Long lobes</asp:ListItem>
                <asp:ListItem>Piereed</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlFace">Face</label>
            <asp:DropDownList ID="ddlFace" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Long</asp:ListItem>
                <asp:ListItem>Round</asp:ListItem>
                <asp:ListItem>Smiling</asp:ListItem>
                <asp:ListItem>Scowling</asp:ListItem>
                <asp:ListItem>Wrinkled</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlComplexion">Complexion</label>
            <asp:DropDownList ID="ddlComplexion" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Fair</asp:ListItem>
                <asp:ListItem>Brown</asp:ListItem>
                <asp:ListItem>Black</asp:ListItem>
                <asp:ListItem>Sallow</asp:ListItem>
                <asp:ListItem>Dark</asp:ListItem>
                <asp:ListItem>Light</asp:ListItem>
                <asp:ListItem>Olive</asp:ListItem>
                <asp:ListItem>Pale</asp:ListItem>
                <asp:ListItem>Tan</asp:ListItem>
                <asp:ListItem>Pimply</asp:ListItem>
                <asp:ListItem>Freckles</asp:ListItem>
                <asp:ListItem>Spots</asp:ListItem>
                <asp:ListItem>Pimples</asp:ListItem>
                <asp:ListItem>Wheat</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlFacialHairType">Facial Hair Type</label>
            <asp:DropDownList ID="ddlFacialHairType" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Clean Shaved</asp:ListItem>
                <asp:ListItem>Beard</asp:ListItem>
                <asp:ListItem>Moustache</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="ddlFacialHair">Facial Hair</label>
            <asp:DropDownList ID="ddlFacialHair" runat="server" CssClass="form-control">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>Long</asp:ListItem>
                <asp:ListItem>Short</asp:ListItem>
                <asp:ListItem>White</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label for="txtMarks">Marks</label>
            <asp:TextBox ID="txtMarks" runat="server" CssClass="form-control" placeholder="Marks"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtDeformities">Deformities</label>
            <asp:TextBox ID="txtDeformities" runat="server" CssClass="form-control" placeholder="Deformities"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtManners">Manners</label>
            <asp:TextBox ID="txtManners" runat="server" CssClass="form-control" placeholder="Manners"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtGait">Gait</label>
            <asp:TextBox ID="txtGait" runat="server" CssClass="form-control" placeholder="Gait"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtSpeech">Speech</label>
            <asp:TextBox ID="txtSpeech" runat="server" CssClass="form-control" placeholder="Sheech"></asp:TextBox>
        </div>
         <div class="form-group col-md-6">
            <label for="txtAppreance">Appreance</label>
            <asp:TextBox ID="txtAppreance" runat="server" CssClass="form-control" placeholder="Appreance"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtDresshing">Dressing</label>
            <asp:TextBox ID="txtDressing" runat="server" CssClass="form-control" placeholder="Dressing"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtAcomplishment">Acomplishment</label>
            <asp:TextBox ID="txtAcomplishment" runat="server" CssClass="form-control" placeholder="Acomplishment"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtHabits">Habits</label>
            <asp:TextBox ID="txtHabits" runat="server" CssClass="form-control" placeholder="Habits"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label for="txtBadHabits">Bad Habits</label>
            <asp:TextBox ID="txtBadHabits" runat="server" CssClass="form-control" placeholder="Bad Habits"></asp:TextBox>
        </div>
        <div class="form-group col-md-12">
            <label for="txtOtherPoints">Other Descriptive Points</label>
            <asp:TextBox ID="txtOtherPoints" runat="server" CssClass="form-control" placeholder="Other Descriptive Points"></asp:TextBox>
        </div>
        <div class="form-group col-md-12">
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnProceed" runat="server" CssClass="btn btn-primary" Text="Proceed" OnClick="btnProceed_Click" />
        </div>
    </div>


    <div class="jumbotron" id="popup" runat="server">
        <h3 class="display-4">Import record from Crime DB</h3>
        <hr />
        <div class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <label for="txtName" class="sr-only">Name</label>
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Accused Name" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearch" runat="server" class="btn btn-success mb-2" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <hr />
        <asp:GridView ID="grdAccused" runat="server" GridLines="None" Width="800px" PagerSettings-PageButtonCount="5"  ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5" OnRowCommand="grdAccused_RowCommand" OnPageIndexChanging="grdAccused_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="SL No" ItemStyle-Width="100px" ItemStyle-Height="50px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="accusedName" HeaderText="Name" />
                <asp:BoundField DataField="accusedFathersName" HeaderText="Fathers Name" />
                <asp:BoundField DataField="accusedAddress" HeaderText="Adderss" ItemStyle-Width="200" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnFetch" runat="server" CssClass="btn btn-success btn-sm" Text="Import" CommandArgument='<%# Eval("ID") %>' CommandName="import" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <hr />
        <asp:Button ID="btnClose" runat="server" CssClass="btn btn-primary" Text="Close" />
    </div>
    <ajax:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="popup" TargetControlID="btnImport" CancelControlID="btnClose" BackgroundCssClass="overlay"></ajax:ModalPopupExtender>
    <hr />
</asp:Content>
