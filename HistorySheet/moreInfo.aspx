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
                    <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtMobNumber" runat="server" ID="rvf1" ValidationGroup="Add" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtOperator" CssClass="form-control" Placeholder="Operator Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOperator" runat="server" Display="Dynamic" ValidationGroup="Add"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>InActive</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtReportDate" CssClass="form-control" Placeholder="Report Date"></asp:TextBox>
                    <ajax:CalendarExtender ID="CE1" TargetControlID="txtReportDate" runat="server" Format="dd-MMM-yyyy" />
                </div>
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
            <asp:BoundField DataField="MobileNumber1" HeaderText="Mobile Number" HeaderStyle-Font-Size="7" />
            <asp:BoundField DataField="Operator" HeaderText="Operator Name" HeaderStyle-Font-Size="7" />
            <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-Font-Size="7" />
            <asp:BoundField DataField="ReportDate" HeaderText="Report Date" HeaderStyle-Font-Size="7" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("ID") %>' CommandName="remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
