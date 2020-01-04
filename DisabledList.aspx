<%@ Page Title="Disabled List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisabledList.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="HistorySheet.DisabledList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="row">
            <asp:RadioButtonList ID="lstSearchTerm" runat="server" RepeatDirection="Vertical" CellPadding="20">
                <asp:ListItem Text="By Name" Value="Name"></asp:ListItem>
                <asp:ListItem Text="By Father's Name" Value="FName"></asp:ListItem>              
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
    <asp:GridView ID="grdDisabledList" runat="server" GridLines="None" Width="100%" RowStyle-Height="50" CssClass="table-striped" PageSize="10" Font-Size="9" AutoGenerateColumns="false" OnRowCommand="grdDisabledList_RowCommand" OnPageIndexChanging="grdDisabledList_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="HistoryNo" HeaderText="History No" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
            <asp:BoundField DataField="DateofReport" HeaderText="Report Date" />
            <asp:TemplateField HeaderText="Enable">
                <ItemTemplate>
                    <asp:Button ID="btnEnable" runat="server" CssClass="btn btn-success" Text="Enable" CommandArgument='<%# Eval("ID") %>' CommandName="enable" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
