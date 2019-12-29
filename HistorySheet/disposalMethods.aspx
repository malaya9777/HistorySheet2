<%@ Page Title="Add Disposal Methods" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="disposalMethods.aspx.cs" Inherits="HistorySheet.disposalMethods" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Insert Disposal Methods
        </div>
        <div class="panel-body">
            <div class="form-row">
                <div class="col-sm-2">
                    <asp:Button ID="btnLinkHistorySheeter" runat="server" CssClass="btn btn-primary" Text="Link Histroy Sheeter" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtHistoryID" runat="server" CssClass="form-control" placeholder="History ID"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtMethod" runat="server" CssClass="form-control" placeholder="Method"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtMethod" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtReceiverName" runat="server" CssClass="form-control" placeholder="Receiver name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReceiverName" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtReceiverAddress" runat="server" CssClass="form-control" placeholder="Receiver Address"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn btn-primary" OnClick="btnInsert_Click" ValidationGroup="insert" />
                </div>
            </div>
        </div>
    </div>
    <asp:GridView ID="grdDisposalMethod" runat="server" GridLines="None" Width="100%" RowStyle-Height="40" OnRowCommand="grdDisposalMethod_RowCommand" OnPageIndexChanging="grdDisposalMethod_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="5" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:TemplateField HeaderText="History ID">
                <ItemTemplate>
                    <a href="HistorySheet.html?"><%# Eval("MasterID") %></a>
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:BoundField DataField="Method" HeaderText="Disposal Method" />
            <asp:BoundField DataField="ReceiverName" HeaderText="Receiver Name" />
            <asp:BoundField DataField="ReceiverAddress" HeaderText="Receiver Address" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <br />
             
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Eval("ID") %>' CommandName="remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
    </asp:GridView>

    <div class="jumbotron" id="popup1" runat="server">
        <h3 class="display-4">Link History Sheeter</h3>
        <hr />
        <div class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <label for="txtSearch2" class="sr-only">Name</label>
                <asp:TextBox ID="txtSearch2" runat="server" placeholder="History Sheeter Name" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearchHistory" runat="server" class="btn btn-success mb-2" Text="Search" OnClick="btnSearchHistory_Click" />
        </div>
        <hr />

        <asp:GridView ID="grdHistoryList" runat="server" GridLines="None" Width="800px" PagerSettings-PageButtonCount="5" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5" OnRowCommand="grdHistoryList_RowCommand" OnPageIndexChanging="grdHistoryList_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="SL No" ItemStyle-Width="100px" ItemStyle-Height="50px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="FathersName" HeaderText="Fathers Name" />
                <asp:BoundField DataField="Address" HeaderText="Adderss" ItemStyle-Width="200" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnFetch" runat="server" CssClass="btn btn-success btn-sm" Text="Import" CommandArgument='<%# Eval("ID") %>' CommandName="import" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
        </asp:GridView>
        <hr />
        <asp:Button ID="btnClose2" runat="server" CssClass="btn btn-primary" Text="Close" />
    </div>
    <ajax:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="popup1" TargetControlID="btnLinkHistorySheeter" CancelControlID="btnClose2" BackgroundCssClass="overlay"></ajax:ModalPopupExtender>
</asp:Content>
