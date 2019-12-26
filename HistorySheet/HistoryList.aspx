<%@ Page Title="History List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistoryList.aspx.cs" Inherits="HistorySheet.HistoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <asp:GridView ID="grdHistoryList" runat="server" AutoGenerateColumns="false" Font-Size="9" Width="100%" AllowPaging="true" PageSize="20" GridLines="Both" CellSpacing="5" CellPadding="5" BorderColor="#808080" CssClass="table-striped">
        <Columns>
            <asp:BoundField DataField="HistoryNo" HeaderText="History No" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Associates" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href='<%# "associates.aspx?H_Id="+Eval("Id") %>'>Associates</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Convictions" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href='<%# "convictions.aspx?H_Id="+Eval("Id") %>'>Conviction</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disposal Methods" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href='<%# "disposalMethods.aspx?H_Id="+Eval("Id") %>'>Disposal Methods</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enquiry Note" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href='<%# "enquiry.aspx?H_Id="+Eval("Id") %>'>Enquiry Note</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Past Arrest" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href='<%# "passtArrest.aspx?H_Id="+Eval("Id") %>'>Past Arrest</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Relatives" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href='<%# "relatives.aspx?H_Id="+Eval("Id") %>'>Relatives</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Residences" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="<%# "residences.aspx?H_Id="+Eval("Id") %>">Residences</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Suspected in" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                      <a href="<%# "suspectedIn.aspx?H_Id="+Eval("Id") %>">Suspected In</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Witness" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                      <a href="<%# "witnesses.aspx?H_Id="+Eval("Id") %>">Witness</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fingerprints & Photographs" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                      <a href="<%# "photos.aspx?H_Id="+Eval("Id") %>">Fingerprints & Photographs</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="More info" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                      <a href="<%# "moreInfo.aspx?H_Id="+Eval("Id") %>">More info</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
