<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="HistorySheet.History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>History Sheet</title>
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="heading">
                <div id="left">
                    <p>Surveillance</p>
                    <p>E-Surveillance</p>
                </div>

                <div id="mid-left">
                    <p>History No</p>
                    <asp:Label Text="text" runat="server" />
                </div>

                <div id ="mid-right">
                    <p>Home District</p>
                    <asp:Label Text="text" runat="server" />
                    <p>Police Station</p>
                    <asp:Label Text="text" runat="server" />
                </div>

                <div id="right">
                    <p>Date of Opening</p>
                    <asp:Label Text="text" runat="server" />
                </div>
            </div>

            <div class="cont-1">
                <table>
                    <tr>
                        <td>Name</td>
                        <asp:Label Text="text" runat="server" />

                        <td>@ Name</td>
                        <asp:Label Text="text" runat="server" />
                    </tr>

                    <tr>
                        <td>Father's Name/ Husband's Name</td>
                        <asp:Label Text="text" runat="server" />
                    </tr>
                </table>
            </div>
            <div class="">
                <table>
                    <tr>
                        <td>
                            <p>Trade or Profession</p>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td>Description</td>
                    </tr>
                    <tr>
                        <td>Year of Birth</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Height</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Hair</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Eyebrow</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Forehead</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Eyes</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Nose</td>
                        <td>
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Mouth</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Chin</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Teeth</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="box">Fingers</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Ears</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Face</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Complexion</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Hair on Face</td>
                        <td class="box">
                            <asp:Label Text="text" runat="server" /></td>
                    </tr>
                </table>
            </div>

        </div>
    </form>
</body>
</html>
