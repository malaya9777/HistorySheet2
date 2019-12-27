<%@ Page Title="Add Associates" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="associates.aspx.cs" Inherits="HistorySheet.associates" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>  

    <div class="form-row">        
        <div class="col-sm-2">
            <asp:Button ID="btnImport" Text="Import Accused Data" runat="server" CssClass="btn btn-primary" />
        </div>        
        <div class="col-sm-2">
            <asp:Button ID="btnImporthis" Text="Link History Data" runat="server" CssClass="btn btn-primary" />            
        </div>
    </div>
    <br />
    <br />
    <div class="form-row">
        <div class="col-sm-2">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
        </div>
        <div class="col-sm-2">
            <asp:TextBox ID="txtAliases" runat="server" CssClass="form-control" placeholder="Aliases"></asp:TextBox>
        </div>
        <div class="col-sm-2">
            <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" placeholder="Father's Name"></asp:TextBox>
        </div>
        <div class="col-sm-2">
            <asp:TextBox ID="txtResidence" runat="server" CssClass="form-control" placeholder="Residence"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <asp:GridView ID="grdAssociates" runat="server" GridLines="None" Width="100%" RowStyle-Height="40" OnRowCommand="grdAssociates_RowCommand" OnPageIndexChanging="grdAssociates_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="5"  ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5" >
        <Columns>            
            <asp:BoundField DataField="AccusedID" HeaderText="Accused ID" HeaderStyle-Font-Size="7" />            
            <asp:BoundField DataField="HistoryMasterID" HeaderText="History ID" HeaderStyle-Font-Size="7" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Aliases" HeaderText="Aliases" />
            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
            <asp:BoundField DataField="Residence" HeaderText="Address" ItemStyle-Width="200" />
            <asp:BoundField DataField="Occupation" HeaderText="Occupation" ItemStyle-Width="200" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument=<%# Eval("Id") %> CommandName="remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <div class="jumbotron" id="popup" runat="server">
        <h3 class="display-4">Import record from Crime DB</h3>
        <hr />
        <div class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <label for="txtName" class="sr-only">Name</label>
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Accused Name" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearch" runat="server" class="btn btn-success mb-2" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <hr />
        <asp:GridView ID="grdAccused" runat="server" GridLines="None" Width="800px" PagerSettings-PageButtonCount="5"  ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5" OnRowCommand="grdAccused_RowCommand" OnPageIndexChanging="grdAccused_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="SL No" ItemStyle-Width="100px" ItemStyle-Height="50px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="accusedName" HeaderText="Name" />
                <asp:BoundField DataField="accusedFathersName" HeaderText="Fathers Name" />
                <asp:BoundField DataField="accusedAddress" HeaderText="Adderss" ItemStyle-Width="200" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnFetch" runat="server" CssClass="btn btn-success btn-sm" Text="Import" CommandArgument='<%# Eval("ID") %>' CommandName="import" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <hr />
        <asp:Button ID="btnClose" runat="server" CssClass="btn btn-primary" Text="Close" />
    </div>
    <ajax:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="popup" TargetControlID="btnImport" CancelControlID="btnClose" BackgroundCssClass="overlay"></ajax:ModalPopupExtender>
    <hr />


    <div class="jumbotron" id="popup1" runat="server">
        <h3 class="display-4">Link History Sheeter</h3>
        <hr />
        <div class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <label for="txtName" class="sr-only">Name</label>
                <asp:TextBox ID="txtName2" runat="server" placeholder="History Sheeter Name" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearchHistory" runat="server" class="btn btn-success mb-2" Text="Search" OnClick="btnSearchHistory_Click" />
        </div>
        <hr />

        <asp:GridView ID="grdHistoryList" runat="server" GridLines="None" Width="800px" PagerSettings-PageButtonCount="5"  ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5" OnRowCommand="grdHistoryList_RowCommand" OnPageIndexChanging="grdHistoryList_PageIndexChanging">
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
        </asp:GridView>
        <hr />
        <asp:Button ID="btnClose2" runat="server" CssClass="btn btn-primary" Text="Close" />
    </div>
    <ajax:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="popup1" TargetControlID="btnImporthis" CancelControlID="btnClose2" BackgroundCssClass="overlay"></ajax:ModalPopupExtender>
</asp:Content>
