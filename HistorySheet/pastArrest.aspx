<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pastArrest.aspx.cs" Inherits="HistorySheet.passtArrest" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Insert Past arrest
        </div>
        <div class="panel-body">
            <div class="form-row">
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPS" runat="server" CssClass="form-control" placeholder="Police Station"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtPS" ErrorMessage="*" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCaseNo" runat="server" CssClass="form-control" placeholder="Case No"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCaseNo" ErrorMessage="*" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Case Date" AutoCompleteType="Disabled"></asp:TextBox>
                    <ajax:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate" Format="dd-MMM-yyyy"  />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate" ErrorMessage="*" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtSection" runat="server" CssClass="form-control" placeholder="Sections"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtArrestDate" runat="server" CssClass="form-control" placeholder="Arrest Date" AutoCompleteType="Disabled"></asp:TextBox>
                    <ajax:CalendarExtender ID="ce1" runat="server" TargetControlID="txtArrestDate" Format="dd-MMM-yyyy" />
                </div>
                 <div class="col-sm-2">
                    <asp:TextBox ID="txtWhereArrested" runat="server" CssClass="form-control" placeholder="Where arrested"></asp:TextBox>
                </div>
                <div class="col-sm-12">
                    <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="insert" />
                </div>
            </div>
        </div>
    </div>
    <asp:GridView ID="grdPastArrest" runat="server" GridLines="None" Width="100%" RowStyle-Height="40" OnRowCommand="grdPastArrest_RowCommand" OnPageIndexChanging="grdPastArrest_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="5" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField DataField="PS" HeaderText="Police Station" />
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" />
            <asp:BoundField DataField="Date" HeaderText="Case Date" />
            <asp:BoundField DataField="Sections" HeaderText="Case Date" />
            <asp:BoundField DataField="ArrestedDate" HeaderText="Arrested On" />
            <asp:BoundField DataField="WhereArrested" HeaderText="Where Arrested" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("ID") %>' CommandName="remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
         <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
    </asp:GridView>
</asp:Content>
