<%@ Page Title="Add Relative" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="relatives.aspx.cs" Inherits="HistorySheet.relatives" %>

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
                    <asp:TextBox ID="txtHistoryID" runat="server" CssClass="form-control" placeholder="HistoryID"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="insert" ControlToValidate="txtName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtAliases" runat="server" CssClass="form-control" placeholder="Aliases"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="insert" ControlToValidate="txtAliases" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtFathersName" runat="server" CssClass="form-control" placeholder="Fathers Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="insert" ControlToValidate="txtFathersName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtRelationship" runat="server" CssClass="form-control" placeholder="Relationship"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="insert" ControlToValidate="txtRelationship" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2">
                    <asp:TextBox ID="txtOccupation" runat="server" CssClass="form-control" placeholder="Occupation"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control" placeholder="Account Number"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control" placeholder="Bank Name"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtIFSC" runat="server" CssClass="form-control" placeholder="IFSC Code"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:FileUpload ID="fu1" runat="server" CssClass="form-control" placeholder="Image" />
                </div>
               
            </div>
            <div class="row">
                 <div class="col-sm-2">
                    <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn btn-primary" OnClick="btnInsert_Click" ValidationGroup="insert" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
