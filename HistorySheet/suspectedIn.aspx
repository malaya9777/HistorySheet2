<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="suspectedIn.aspx.cs" Inherits="HistorySheet.suspectedIn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <br />

    <div class="panel panel-primary">
        <div class="panel-heading">Suspected In</div>
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtDistrict" CssClass="form-control" Placeholder="District"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDistrict" runat="server" ValidationGroup="suspect" Display="Dynamic" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtPS" CssClass="form-control" Placeholder="Police Station"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPS" runat="server" Display="Dynamic" ValidationGroup="suspect"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCaseNo" runat="server" CssClass="form-control" Placeholder="Case No" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCaseNo" runat="server" Display="Dynamic" ValidationGroup="suspect"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtCaseDate" CssClass="form-control" Placeholder="Case Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCaseDate" runat="server" Display="Dynamic" ValidationGroup="suspect"></asp:RequiredFieldValidator>
                    <ajax:CalendarExtender ID="CE1" runat="server" TargetControlID="txtCaseDate" Format="dd-MMM-yyyy" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" Placeholder="Remarks"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnAdd" Text="Insert" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2">
                    <asp:CheckBox Text="Is SR" runat="server" ID="chkSR" AutoPostBack="true" OnCheckedChanged="chkSR_CheckedChanged" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtSRNo" CssClass="form-control" Placeholder="SR No" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPropertyKind" CssClass="form-control" runat="server" Placeholder="Type of Property" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPropertyValue" CssClass="form-control" runat="server" Placeholder="Value of Property" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtSections" CssClass="form-control" runat="server" placeholder="Sections"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtMODetails" CssClass="form-control" runat="server" placeholder="MO Details"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <asp:GridView runat="server" ID="grdSuspect" GridLines="None" Width="100%" CssClass="table-striped" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowCommand="grdSuspect_RowCommand">
        <Columns>
            <asp:BoundField DataField="District" HeaderText="District" />
            <asp:BoundField DataField="PS" HeaderText="Police Station" />
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" />
            <asp:BoundField DataField="CaseDate" HeaderText="Case Date" />
            <asp:BoundField DataField="SRNo" HeaderText="SR No" />
            <asp:BoundField DataField="PropertyKind" HeaderText="Property Kind" />
            <asp:BoundField DataField="PropertyValue" HeaderText="Property Value" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <br />
                    <asp:Button Text="Delete" runat="server" ID="btnDelete" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="remove" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
