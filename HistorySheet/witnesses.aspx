﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="witnesses.aspx.cs" Inherits="HistorySheet.witnesses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding:0;margin:0;font-size:15px"></p>
        <p id="category" runat="server" style="padding:0;margin:0;font-size:15px"></p>
    </div>
    <br />
    <br />

    <div class="panel panel-primary">
        <div class="panel-heading">Details of Witness</div>
        <div class="panel-body">
            <div class="panel-row">
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Width="100%" placeholder="Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtName" runat="server" ID="rfv1" ValidationGroup="witness" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:DropDownList runat="server" ID="ddlGender" Width="100%" placeholder="Gender">
                        <asp:listitem>--Select--</asp:listitem>
                        <asp:listitem>Male</asp:listitem>
                        <asp:listitem>Female</asp:listitem>
                        <asp:listitem>Trans</asp:listitem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="*" ID="rfv2" ForeColor="Red" ControlToValidate="ddlGender" runat="server" ValidationGroup="witness"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" Width="100%" placeholder="Date of Birth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDOB" runat="server" ValidationGroup="witness"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtFName" CssClass="form-control" Width="100%" placeholder="Father Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFName" ValidationGroup="witness" runat="server" ></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" Width="100%" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv5" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress" ValidationGroup="witness" runat="server" ></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox runat="server" ID="txtImage" CssClass="form-control" Width="100%" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv6" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtImage" ValidationGroup="witness" runat="server" ></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="btnAdd" Text="Add" runat="server" CssClass="btn btn-primary" ValidationGroup="witness" OnClick="btnAdd_Click"/>
            </div>
        </div>
    </div>
    <br />
    <br />

    <asp:GridView ID="grdWitness" runat="server" Width="100%" CssClass="table-striped" GridLines="None" Font-Size="10" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowCommand="grdWitness_RowCommand">
        <Columns>
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
        </Columns>
    </asp:GridView>
</asp:Content>
