<%@ Page Title="Add Residence" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="residences.aspx.cs" Inherits="HistorySheet.residences" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Insert Residence
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Country"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" ControlToValidate="txtCountry" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtState" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" placeholder="District"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDistrict" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPoliceStation" runat="server" CssClass="form-control" placeholder="Police Station"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPoliceStation" ForeColor="Red" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>

                </div>
                <div class="col-sm-2">
                    <asp:CheckBox ID="chkFrequentlyVisiting" runat="server" Text="Frequently visiting" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2">
                    <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert" ValidationGroup="insert" OnClick="btnInsert_Click" />
                </div>
            </div>
        </div>
    </div>
    <asp:GridView ID="grdResidence" runat="server" GridLines="None" Width="100%" CssClass="table-striped" PageSize="10" Font-Size="9" AutoGenerateColumns="false" OnRowCommand="grdResidence_RowCommand" OnPageIndexChanging="grdResidence_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="Country" HeaderText="Country" />
            <asp:BoundField DataField="State" HeaderText="State" />
            <asp:BoundField DataField="District" HeaderText="District" />
            <asp:BoundField DataField="PS" HeaderText="Police Station" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="FequentlyVisiting" HeaderText="Frequently visiting" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <br />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="remove" CommandArgument='<%# Eval("ID") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
    </asp:GridView>
</asp:Content>
