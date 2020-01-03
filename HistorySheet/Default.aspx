<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HistorySheet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron">
        <div class="row">
            <asp:RadioButtonList ID="lstSearchTerm" runat="server" RepeatDirection="Vertical" CellPadding="20">
                <asp:ListItem Text="By Name" Value="Name"></asp:ListItem>
                <asp:ListItem Text="By Father's Name" Value="FName"></asp:ListItem>
                <asp:ListItem Text="By Bank Account" Value="Account"></asp:ListItem>
                <asp:ListItem Text="By Mobile" Value="Mobile"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <br />        
        <div class="row">
            <div class="col-sm-4">
                <asp:TextBox ID="txtSearchbox" runat="server" CssClass="form-control" placeholder="Search Term"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
            </div>
        </div>

    </div>
    <asp:GridView ID="grdList" runat="server" GridLines="None" Width="100%" OnRowCommand="grdList_RowCommand" ShowHeader="false" OnPageIndexChanging="grdList_PageIndexChanging" Font-Size="10" PagerSettings-PageButtonCount="10" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="panel panel-<%# Eval("PanelColor") %>"'>
                        <div class="panel-heading">
                            <h5><%# Eval("Name") +" @"+ Eval("Aliases") %></h5>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <h1><%# Eval("Category") %></h1>
                                </div>
                                <div class="col-sm-2" style="overflow: hidden">
                                    <asp:Image ID="img" runat="server" ImageUrl='<%# "data:Image/jpg;base64,"+Convert.ToBase64String((byte[]) Eval("Image")) %>' Height="150px" />
                                </div>
                                <div class="col-sm-4">
                                    <p><%# Eval("Prefix") %> Name: <%# Eval("FathersName") +" @"+Eval("FathersAliases") %></p>
                                    <p>Home District: <%# Eval("HomeDistrict") %></p>
                                    <p>Police Station: <%# Eval("PoliceStation") %></p>
                                    <p>Gender: <%# Eval("Gender") %></p>
                                    <p>Year of Birth: <%# Eval("YearBirth") %></p>
                                    <p>Last Enquiry Submitted on : <%# Eval("LastEnquiryDate") %></p>
                                    <lable class="lable lable-<%# Eval("pendingWarning") %>">Enquiry Pending (days) : <%# Eval("lastEnquiry") %></lable>
                                </div>
                                <div class="col-sm-2"></div>
                                <div class="col-sm-2">
                                    <a href='<%# "IndividualHistorySheet?H_ID="+Eval("ID") %>'>View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</asp:Content>
