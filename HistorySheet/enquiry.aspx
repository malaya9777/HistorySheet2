<%@ Page Title="Add Enquiry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="enquiry.aspx.cs" Inherits="HistorySheet.enquiry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding:0;margin:0;font-size:15px"></p>
        <p id="category" runat="server" style="padding:0;margin:0;font-size:15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Insert enquiry Note
        </div>
        <div class="panel-body">
            <div class="col-sm-2">
                <label for="txtDate">Enquiry Date</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Enquiry Date"></asp:TextBox>
                <ajax:CalendarExtender ID="ce1" TargetControlID="txtDate" runat="server" Format="dd-MMM-yyyy" />
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtDate" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-2">
                <label for="txtEnquiryTakenBy">Enquiry Taken By</label>
                <asp:TextBox ID="txtEnquiryTakenBy" runat="server" CssClass="form-control" placeholder="Entry taken by"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEnquiryTakenBy" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>

            </div>
            <div class="col-sm-4">
                <label for="txtEnquiryReport">Enquiry Report</label>
                <asp:TextBox ID="txtEnquiryReport" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enquiry Report"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEnquiryReport" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>

            </div>
            <div class="col-sm-2">
                <br />
                <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="insert"/>
            </div>
        </div>
    </div>
    <asp:GridView ID="grdEnquiry" runat="server"  GridLines="None" Width="100%" RowStyle-Height="40" OnRowCommand="grdEnquiry_RowCommand" OnPageIndexChanging="grdEnquiry_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="5" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Enquiry Date" />
            <asp:BoundField DataField="EntryTakenBy" HeaderText="Enquiry Taken By" />
            <asp:BoundField DataField="Note" HeaderText="Enquiry Note" />
            <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="remove" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
    </asp:GridView>
</asp:Content>
