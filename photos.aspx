<%@ Page Title="Photos and Fingerprint" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="photos.aspx.cs" Inherits="HistorySheet.photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            Add Photo
        </div>
        <div class="panel-body">
            <div class="form-group">
                <div class="col-sm-2">
                    <asp:CheckBox ID="chkIsFingerPrint" runat="server" Text="Is Fingerprint" />
                </div>
                <div class="col-sm-4">
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" placeholder="Select File" />
                    <asp:RequiredFieldValidator ID="rvf1" runat="server" ControlToValidate="fuImage" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ValidationGroup="imgInsert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnSubmit_Click" ValidationGroup="imgInsert"/>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Photos
        </div>
        <div class="panel-body">
            <asp:DataList ID="dgPhotos" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" OnDeleteCommand="dgPhotos_DeleteCommand">
                <ItemTemplate>
                    <div style="text-align:center;padding:10px;background:#d4d4d4;border-radius:3px;margin:0 8px 8px 0">
                        <img src='<%# Eval("imagePath") %>' style="max-width: 200px;max-height:280px;" />
                        <br />
                        <br />
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="delete" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
     <div class="panel panel-primary">
        <div class="panel-heading">
            Fingerprints
        </div>
        <div class="panel-body">
            <asp:DataList ID="dgFingerprint" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" OnDeleteCommand="dgFingerprint_DeleteCommand">
                <ItemTemplate>
                    <div style="text-align:center;padding:10px;background:#d4d4d4;border-radius:3px;margin:0 8px 8px 0">
                        <img src='<%# Eval("imagePath") %>' style="max-width: 200px;max-height:280px;" />
                        <br />
                        <br />
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="delete" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
