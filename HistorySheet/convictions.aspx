<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="convictions.aspx.cs" Inherits="HistorySheet.convictions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding:0;margin:0;font-size:15px"></p>
        <p id="category" runat="server" style="padding:0;margin:0;font-size:15px"></p>
    </div>
    <div class="form-row">
        <div class="col-sm-2">
            <asp:TextBox runat="server" id="txtSNNo" CssClass="form-control" Placeholder="SN No."></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtDist" CssClass="form-control" Placeholder="District"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtPS" CssClass="form-control" Placeholder="Police Station"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtCaseNo" CssClass="form-control" Placeholder="Case No"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtCaseDate" CssClass="form-control" Placeholder="Case Date"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtSection" CssClass="form-control" Placeholder="Section"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtMO" CssClass="form-control" Placeholder="MO"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtCourt" CssClass="form-control" Placeholder="Court"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtConviction" CssClass="form-control" Placeholder="Conviction"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtConvictionDate" CssClass="form-control" Placeholder="Conviction Date"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtConvictionSentence" CssClass="form-control" Placeholder="Conviction Sentence"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtFPBSerialNo" CssClass="form-control" Placeholder="FPB Serial No."></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtFPBDate" CssClass="form-control" Placeholder="FPB Date"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtIdentifyingWitness" CssClass="form-control" Placeholder="Identifying Witness"></asp:TextBox>
        </div>
        <div class="col-sn-2">
            <asp:TextBox runat="server" id="txtReleaseDate" CssClass="form-control" Placeholder="Release Date"></asp:TextBox>
        </div>
    </div>
</asp:Content>
