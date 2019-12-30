
<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moreInfo.aspx.cs" Inherits="HistorySheet.moreInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">Add Mobile Number</div>
        <div class="panel-body">
            <div class="panel-row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtMobNumber" CssClass="form-control" Placeholder="Mobile No."></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtMobNumber" runat="server" ID="rfv1" ValidationGroup="Add" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtOperator" CssClass="form-control" Placeholder="Operator Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ID="rfv2" ControlToValidate="txtOperator" runat="server" Display="Dynamic" ValidationGroup="Add"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>InActive</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <%--<div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtReportDate" CssClass="form-control" Placeholder="Report Date" Visible="false"></asp:TextBox>
                    <ajax:CalendarExtender ID="CE1" TargetControlID="txtReportDate" runat="server" Format="dd-MMM-yyyy" />
                </div>--%>
                <div class="col-sm-2">
                    <asp:Button runat="server" ID="btnInsert" Text="Add" ValidationGroup="Add" CssClass="btn btn-primary" OnClick="btnInsert_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:GridView ID="grdMobile" runat="server" Width="100%" GridLines="None" Font-Size="10" CssClass="table-striped" OnRowCommand="grdMobile_RowCommand" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="MobileNumber1" HeaderText="Mobile Number" />
            <asp:BoundField DataField="Operator" HeaderText="Operator Name" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:BoundField DataField="ReportDate" HeaderText="Report Date" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <br />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("ID") %>' CommandName="remove" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <div class="panel panel-primary">
        <div class="panel-heading">Add Bank Details</div>
        <div class="panel-body">
            <div class="pael-row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtAcctNo" CssClass="form-control" Placeholder="Bank Account Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ID="rfvBank1" ControlToValidate="txtAcctNo" runat="server" ValidationGroup="Bank" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtBankDetail" CssClass="form-control" placeholder="Bank Details"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ID="rfvBank2" ControlToValidate="txtBankDetail" runat="server" Display="Dynamic" ValidationGroup="Bank"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtBankBalance" CssClass="form-control" placeholder="Bank Balance"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBankBalance" runat="server" Display="Dynamic" ValidationGroup="Bank"></asp:RequiredFieldValidator>
                </div>
                <%--<div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtBankReportDate" CssClass="form-control" placeholder="Report Date" Visible="false"></asp:TextBox>
                    <ajax:CalendarExtender ID="CE2" TargetControlID="txtBankReportDate" runat="server" Format="dd-MMM-yyyy" />
                </div>--%>
                <div class="col-sm-2">
                    <asp:Button runat="server" ID="btnBankDetail" ValidationGroup="Bank" Text="Add" CssClass="btn btn-primary" OnClick="btBankDetail_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:GridView ID="grdBankDetail" runat="server" OnRowCommand="grdBankDetail_RowCommand" Width="100%" GridLines="None" Font-Size="10" CssClass="table-striped" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="BankName" HeaderText="Bank Name" />
            <asp:BoundField DataField="Balance" HeaderText="Bank Details" />
            <asp:BoundField DataField="ReportedOn" HeaderText="Reported On" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <br />
                    <asp:Button ID="btnDeleteBank" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<% # Eval("ID")%>' CommandName="remove" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <div class="panel panel-primary">
        <div class="panel-heading">Add Political Links</div>
        <div class="panel-body">
            <div class="panel-row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtNamePolitical" CssClass="form-control" Placeholder="Name of Party"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ValidationGroup="Political" ControlToValidate="txtNamePolitical" runat="server" Display="Dynamic" ID="rfvPolitical1"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:DropDownList runat="server" ID="ddlStatus2" CssClass="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>In-Active</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlStatus2" runat="server" ValidationGroup="Political" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtSince" CssClass="form-control" Placeholder="Date Since"></asp:TextBox>
                    <ajax:CalendarExtender ID="CE3" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtSince" />
                </div>
                <%--<div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtReportedon" CssClass="form-control" Placeholder="Reported Date" Visible="false"></asp:TextBox>
                    <ajax:CalendarExtender ID="CE4" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtReportedon" />
                </div>--%>
                <div class="col-sm-2">
                    <asp:Button ID="btnAddPolitical" Text="Add" runat="server" CssClass="btn btn-primary" ValidationGroup="Political" OnClick="btnAddPolitical_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:GridView ID="grdPoliticalLink" runat="server" OnRowCommand="grdPoliticalLink_RowCommand" Width="100%" GridLines="None" Font-Size="10" CssClass="table-striped" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Political Party" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:BoundField DataField="Since" HeaderText="Since" />
            <asp:BoundField DataField="ReportedOn" HeaderText="Reported Date" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <br />
                    <asp:Button ID="btnPoliticalLink" CssClass="btn btn-danger" CommandArgument='<%#Eval("ID") %>' Text="Delete" runat="server" CommandName="remove" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
