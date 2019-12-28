<%@ Page Title="Conviction" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="convictions.aspx.cs" Inherits="HistorySheet.convictions" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4 id="Name" runat="server"></h4>
        <p id="fathersName" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
        <p id="category" runat="server" style="padding: 0; margin: 0; font-size: 15px"></p>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">Insert Convictions</div>
        <div class="panel-body">
            <div class="form-row">
                <div class="col-sm-2">
                    <br />
                    <asp:CheckBox ID="chkIsSR" runat="server" AutoPostBack="true" Text="Is SR" OnCheckedChanged="chkIsSR_CheckedChanged" />
                </div>
                <div class="col-sm-2">
                    <label for="txtSRNo">SR No</label>
                    <asp:TextBox ID="txtSRNo" runat="server" placeholder="SR No" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtDistrict">District</label>
                    <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" placeholder="District"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtDistrict" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="mannualInsert"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-2">
                    <label for="txtPS">Police Station</label>
                    <asp:TextBox ID="txtPS" runat="server" CssClass="form-control" placeholder="Police Station"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPS" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="mannualInsert"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-2">
                    <label for="CaseNo">Case No</label>
                    <asp:TextBox ID="txtCaseNo" runat="server" CssClass="form-control" placeholder="Case No"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCaseNo" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="mannualInsert"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-2">
                    <label for="txtCaseDate">Case Date</label>
                    <asp:TextBox ID="txtCaseDate" runat="server" CssClass="form-control" placeholder="Case Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCaseDate" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="mannualInsert"></asp:RequiredFieldValidator>

                    <ajax:CalendarExtender ID="ce1" runat="server" TargetControlID="txtCaseDate" Format="dd-MMM-yyyy" />
                </div>
                <div class="col-sm-2">
                    <label for="txtSection">Sections</label>
                    <asp:TextBox ID="txtSections" runat="server" CssClass="form-control" placeholder="Sections"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtMO">MO</label>
                    <asp:TextBox ID="txtMO" runat="server" CssClass="form-control" placeholder="MO"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtCourt">Court</label>
                    <asp:TextBox ID="txtCourt" runat="server" CssClass="form-control" placeholder="Court"></asp:TextBox>

                </div>
                <div class="col-sm-2">
                    <label for="txtConviction">Conviction</label>
                    <asp:TextBox ID="txtConviction" runat="server" CssClass="form-control" placeholder="Conviction"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtConvictionDate">conviction Date</label>

                    <asp:TextBox ID="txtConvictionDate" runat="server" CssClass="form-control" placeholder="Convition Date"></asp:TextBox>
                    <ajax:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtConvictionDate" Format="dd-MMM-yyyy" />
                </div>
                <div class="col-sm-2">
                    <label for="txtConvitionSentence">Conviction Sentence</label>
                    <asp:TextBox ID="txtConvitionSentence" runat="server" CssClass="form-control" placeholder="Convition Sentence"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtFPBSerialNo">FPB Serial No</label>
                    <asp:TextBox ID="txtFPBSerialNo" runat="server" CssClass="form-control" placeholder="FPB Serial No"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtFPBDate">FPB Date</label>
                    <asp:TextBox ID="txtFPBDate" runat="server" CssClass="form-control" placeholder="FPB Date"></asp:TextBox>
                    <ajax:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFPBDate" Format="dd-MMM-yyyy" />
                </div>
                <div class="col-sm-2">
                    <label for="txtWitness">Identifing Witness</label>
                    <asp:TextBox ID="txtWitness" runat="server" CssClass="form-control" placeholder="Identifing Witness"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <label for="txtReleaseDate">Release Date</label>
                    <asp:TextBox ID="txtReleaseDate" runat="server" CssClass="form-control" placeholder="Release Date"></asp:TextBox>
                    <ajax:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtReleaseDate" Format="dd-MMM-yyyy" />
                </div>
                <div class="col-sm-2">
                    <br />
                    <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="mannualInsert" />
                </div>

            </div>
        </div>
    </div>
    <asp:GridView ID="grdConvictions" runat="server" GridLines="None" Width="100%" CssClass="table-striped" PageSize="10" Font-Size="9" AutoGenerateColumns="false" OnRowCommand="grdConvictions_RowCommand" OnPageIndexChanging="grdConvictions_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="SRNo" HeaderText="SR No" />    
            <asp:TemplateField HeaderText="Case Details">
                <ItemTemplate>
                    <p><%# "Dist."+Eval("District") %></p>
                    <p><%# "PS."+Eval("PS") %></p>
                    <p><%# "Case No."+Eval("CaseNo") %></p>
                    <p><%# "Case Date."+Eval("CaseDate") %></p>
                    <p><%# "U/s."+Eval("Sections") %></p>
                    <p><%# "MO."+Eval("MO") %></p>
                </ItemTemplate>
            </asp:TemplateField>           
            <asp:BoundField DataField="Court" HeaderText="Court" />
            <asp:BoundField DataField="Conviction" HeaderText="Convitions" />
            <asp:BoundField DataField="ConvictionDate" HeaderText="Conviction Date" />
            <asp:BoundField DataField="ConvitionSentence" HeaderText="ConvitionSentence" />
            <asp:BoundField DataField="FPBSerialNo" HeaderText="FPB Serial No" />
            <asp:BoundField DataField="FPBDate" HeaderText="FPBDate" />
            <asp:BoundField DataField="IdentifyingWitness" HeaderText="Identifying Witness" />
            <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="remove" CommandArgument='<%# Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
    </asp:GridView>
</asp:Content>
