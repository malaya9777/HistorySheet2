<%@ Page Title="History List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistoryList.aspx.cs" Inherits="HistorySheet.HistoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <asp:GridView ID="grdHistoryList" runat="server" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" Font-Size="8" Width="100%" AllowPaging="true" PageSize="20" GridLines="None" CellSpacing="5" CellPadding="5" BorderColor="#808080" CssClass="table-striped">
        <Columns>
            <asp:BoundField DataField="HistoryNo" HeaderText="History No"/>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
            <asp:TemplateField HeaderText="Associates" >
                <ItemTemplate>
                    <a href='<%# "associates.aspx?H_Id="+Eval("Id") %>'>Associates</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Convictions" >
                <ItemTemplate>
                    <a href='<%# "convictions.aspx?H_Id="+Eval("Id") %>'>Conviction</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disposal Methods" >
                <ItemTemplate>
                    <a href='<%# "disposalMethods.aspx?H_Id="+Eval("Id") %>'>Disposal Methods</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enquiry Note" >
                <ItemTemplate>
                    <a href='<%# "enquiry.aspx?H_Id="+Eval("Id") %>'>Enquiry Note</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Past Arrest" >
                <ItemTemplate>
                    <a href='<%# "passtArrest.aspx?H_Id="+Eval("Id") %>'>Past Arrest</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Relatives" >
                <ItemTemplate>
                    <a href='<%# "relatives.aspx?H_Id="+Eval("Id") %>'>Relatives</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Residences" >
                <ItemTemplate>
                    <a href="<%# "residences.aspx?H_Id="+Eval("Id") %>">Residences</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Suspected in" >
                <ItemTemplate>
                      <a href="<%# "suspectedIn.aspx?H_Id="+Eval("Id") %>">Suspected In</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Witness" >
                <ItemTemplate>
                      <a href="<%# "witnesses.aspx?H_Id="+Eval("Id") %>">Witness</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fingerprints & Photographs" >
                <ItemTemplate>
                      <a href="<%# "photos.aspx?H_Id="+Eval("Id") %>">Fingerprints & Photographs</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="More info" >
                <ItemTemplate>
                      <a href="<%# "moreInfo.aspx?H_Id="+Eval("Id") %>">More info</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
