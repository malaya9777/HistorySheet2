<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HistorySheet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="grdList" runat="server" GridLines="None" Width="100%" OnRowCommand="grdList_RowCommand" ShowHeader="false" OnPageIndexChanging="grdList_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="10" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="panel panel-<%# Eval("PanelColor") %>">
                        <div class="panel-heading">
                            <%# Eval("Name") +" @"+ Eval("Aliases") %>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <h1><%# Eval("Category") %></h1>
                                </div>
                                <div class="col-sm-2">

                                </div>
                                <div class="col-sm-2"></div>
                                <div class="col-sm-2"></div>
                            </div>                                                        
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</asp:Content>
