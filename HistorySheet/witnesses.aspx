<%@ Page Title="Add Witness" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="witnesses.aspx.cs" Inherits="HistorySheet.witnesses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">Details of Witness</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtName" runat="server" ID="rfv1" ValidationGroup="witness" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:DropDownList runat="server" ID="ddlGender" placeholder="Gender" CssClass="form-control">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Trans</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="*" ID="rfv2" ForeColor="Red" ControlToValidate="ddlGender" runat="server" ValidationGroup="witness"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" placeholder="Date of Birth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDOB" runat="server" ValidationGroup="witness"></asp:RequiredFieldValidator>
                    <ajax:CalendarExtender ID="CE1" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtDOB" />
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtFName" CssClass="form-control" placeholder="Father Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFName" ValidationGroup="witness" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv5" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress" ValidationGroup="witness" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:FileUpload runat="server" ID="fuImage" CssClass="form-control" placeholder="Image"></asp:FileUpload>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Button ID="btnAdd" Text="Insert" runat="server" CssClass="btn btn-primary" ValidationGroup="witness" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />

    <asp:GridView ID="grdWitness" runat="server" Width="100%" CssClass="table-striped" GridLines="None" Font-Size="10" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowCommand="grdWitness_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgWitness" ImageUrl='<%# "data:Image/jpg;base64,"+ Convert.ToBase64String((byte[]) Eval("Image")) %>' Width="100px"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" />
            <asp:BoundField DataField="FathersName" HeaderText="FathersName" />
            <asp:BoundField DataField="Address" HeaderText="Address" />

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" CssClass="btn btn-danger" Text="Delete" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
