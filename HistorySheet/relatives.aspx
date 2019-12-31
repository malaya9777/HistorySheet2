<%@ Page Title="Add Relative" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="relatives.aspx.cs" Inherits="HistorySheet.relatives" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            Insert Relative Details
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:Button ID="btnImport" runat="server" CssClass="btn btn-primary" Text="Link History Sheeter" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2">
                    <label>History ID</label>
                    <asp:TextBox ID="txtHistoryID" runat="server" CssClass="form-control" placeholder="HistoryID"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label>Name</label>

                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="insert" ControlToValidate="txtName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <label>Aliases</label>

                    <asp:TextBox ID="txtAliases" runat="server" CssClass="form-control" placeholder="Aliases"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="insert" ControlToValidate="txtAliases" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <label>Father's Name</label>

                    <asp:TextBox ID="txtFathersName" runat="server" CssClass="form-control" placeholder="Fathers Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="insert" ControlToValidate="txtFathersName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <label>Relationship</label>

                    <asp:TextBox ID="txtRelationship" runat="server" CssClass="form-control" placeholder="Relationship"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="insert" ControlToValidate="txtRelationship" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <label>Address</label>

                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2">
                    <label>Occupation</label>

                    <asp:TextBox ID="txtOccupation" runat="server" CssClass="form-control" placeholder="Occupation"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label>Mobile Number</label>

                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number" MaxLength="10" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label>Account Number</label>

                    <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control" placeholder="Account Number" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label>Bank Name</label>

                    <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control" placeholder="Bank Name"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label>IFSC</label>

                    <asp:TextBox ID="txtIFSC" runat="server" CssClass="form-control" placeholder="IFSC Code"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label>Image</label>
                    
                    <asp:FileUpload ID="fu1" runat="server" CssClass="form-control" placeholder="Image" />
                </div>
               
            </div>
            <br />
            <div class="row">
                 <div class="col-sm-2">
                    <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn btn-primary" OnClick="btnInsert_Click" ValidationGroup="insert" />
                </div>
            </div>
        </div>
    </div>
    <asp:GridView ID="grdRelative" runat="server"  GridLines="None" Width="100%" RowStyle-Height="40" OnRowCommand="grdRelative_RowCommand" OnPageIndexChanging="grdRelative_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="5" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table-striped" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:TemplateField HeaderText="History Link">
                <ItemTemplate>
                    <a href='<%# "HistorySheet.html?H_ID="+Eval("RefMasterID") %>'><%# Eval("RefMasterID") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgThumbnail" Height="100px" src='<%# "data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Details">
                <ItemTemplate>
                    <p><%# Eval("Name")+" @"+Eval("Aliases") %></p>
                    <p><%# "Father's Name"+Eval("FathersName") %></p>
                    <p><%# Eval("Relationship") %></p>                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="Occupation" HeaderText="Occupation" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
            <asp:TemplateField HeaderText="Bank Details">
                <ItemTemplate>
                    <p><%# "A/c."+Eval("BankAccount") %></p>
                    <p><%# Eval("NameofBank") %></p>
                    <p><%# Eval("IFSC") %></p>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
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
    <ajax:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="popup1" TargetControlID="btnImport" CancelControlID="btnClose2" BackgroundCssClass="overlay"></ajax:ModalPopupExtender>

</asp:Content>
