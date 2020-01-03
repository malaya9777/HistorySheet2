<%@ Page Title="Disabled List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisabledList.aspx.cs" Inherits="HistorySheet.DisabledList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="row">
            <asp:RadioButtonList ID="lstSearchTerm" runat="server" RepeatDirection="Vertical" CellPadding="20">
                <asp:ListItem Text="By Name" Value="Name"></asp:ListItem>
                <asp:ListItem Text="By Father's Name" Value="FName"></asp:ListItem>
                <asp:ListItem Text="By Bank Account" Value="Account"></asp:ListItem>
                <asp:ListItem Text="By Mobile" Value="Mobile"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-4">
                <asp:TextBox ID="txtSearchbox" runat="server" CssClass="form-control" placeholder="Search Term"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>
</asp:Content>
