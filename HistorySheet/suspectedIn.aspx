<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="suspectedIn.aspx.cs" Inherits="HistorySheet.suspectedIn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <br />

    <div class="panel panel-primary">
        <div class="panel-heading">Suspected In</div>
        <div class="panel-body">
            <div class="panel-row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtDistrict" CssClass="form-control" Placeholder="District"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDistrict" runat="server" ValidationGroup="suspect" Display="Dynamic" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtPS" CssClass="form-control" Placeholder="Police Station"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPS" runat="server" Display="Dynamic" ValidationGroup="suspect"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCaseNo" runat="server" CssClass="form-control" Placeholder="Case No"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCaseNo" runat="server" Display="Dynamic" ValidationGroup="suspect"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtCaseDate" CssClass="form-control" Placeholder="Case Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCaseDate" runat="server" Display="Dynamic" ValidationGroup="suspect"></asp:RequiredFieldValidator>
                    <ajax:CalendarExtender ID="CE1" runat="server" TargetControlID="txtCaseDate" Format="dd-MMM-yyyy" />
                </div>
                <div class="panel-row">
                    <asp:CheckBox Text="text" runat="server" ID="chkSR" AutoPostBack="true" OnCheckedChanged="chkSR_CheckedChanged"/>
                    <div class="col-sm-2">
                        <asp:TextBox runat="server" ID="txtSRNo" CssClass="form-control" Placeholder="SR No" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtPropertyKind" CssClass="form-control" runat="server" Placeholder="Type of Property" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtPropertyValue" CssClass="form-conrtol" runat="server" Placeholder="Value of Property" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" Placeholder="Remarks"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnAdd" Text="Add" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
