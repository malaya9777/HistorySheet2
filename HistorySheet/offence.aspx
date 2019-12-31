<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="offence.aspx.cs" Inherits="HistorySheet.offence" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Insert Offence
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPS" runat="server" CssClass="form-control" placeholder="Police Station"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtPS" ErrorMessage="*" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCaseNo" runat="server" CssClass="form-control" placeholder="Case No" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCaseNo" ErrorMessage="*" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCaseDate" runat="server" CssClass="form-control" placeholder="Case Date"></asp:TextBox>
                    <ajax:CalendarExtender ID="ce1" runat="server" TargetControlID="txtCaseDate" Format="dd-MMM-yyyy" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCaseDate" ErrorMessage="*" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtSection" runat="server" CssClass="form-control" placeholder="Sections"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtMOdetails" runat="server" CssClass="form-control" placeholder="MO Details"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="Remarks"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:CheckBox ID="chkIsImportant" runat="server" Text="Is Important" />
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="insert" />
                </div>
            </div>
        </div>
    </div>
    <asp:GridView ID="grdOffence" runat="server" GridLines="None" Width="100%" RowStyle-Height="40" OnRowCommand="grdOffence_RowCommand" OnPageIndexChanging="grdOffence_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="5" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField DataField="PS" HeaderText="Police Station" />
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" />
            <asp:BoundField DataField="Date" HeaderText="Case Date" />
            <asp:BoundField DataField="Sections" HeaderText="Sections" />
            <asp:BoundField DataField="MODetails" HeaderText="MO Details" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
            <asp:BoundField DataField="Important" HeaderText="Is Important" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("ID") %>' CommandName="remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
    </asp:GridView>
</asp:Content>
