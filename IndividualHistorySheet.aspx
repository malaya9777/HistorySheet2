<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndividualHistorySheet.aspx.cs" Inherits="HistorySheet.IndividualHistorySheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="StyleSheetHistory.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>HISTORY SHEET</h2>
                <p>(P.M. RULES 357 AND 1012)</p>
            </div>
            <div class="sub-head">
                <div class="surv">
                    <p>Surveillance</p>
                    <p style="border-top: 2px solid #000000;">Non-Surveillance</p>
                </div>
                <div>
                    <p>History No.<span id="historyNo" runat="server">123</span></p>
                </div>
                <div class="surv">
                    <p>Home district:<span id="homeDistrict" runat="server">Puri</span></p>
                    <p style="border-top: 2px solid #000000;">Police Station:<span id="policeStation" runat="server">Town</span></p>
                </div>
                <div>
                    <p>Date of opening:<span id="dateofOpening" runat="server">12.12.2019</span></p>
                </div>
            </div>
            &nbsp;&nbsp;
        <div class="sub-head-1">
            <div>
                <h4>1. Name: <span id="Name" runat="server">123</span></h4>
            </div>
            <div>
                <p>@ Name: <span id="Aname" runat="server">123</span></p>
            </div>
            &nbsp;
            <div class="surv">
                <p>2. Father's Name: <span id="FnameHname" runat="server">123</span></p>
                <p style="border-top: 2px solid #000000;">Husband's Name</p>
            </div>
            <div>
                <h4>3. Trade of Profession: <span id="Trade" runat="server">123</span></h4>
            </div>
        </div>
            &nbsp;&nbsp;
        <h4>4. Description</h4>
            <div class="sub-head-4">
                <div>
                    <p>Year of Birth: <span id="yearofbirth" runat="server">123</span></p>
                </div>
                <div>
                    <p>Height: <span id="Height" runat="server">123</span></p>
                </div>
                <div>
                    <p>Built: <span id="built" runat="server">123</span></p>
                </div>
                <div>
                    <p>Hair: <span id="hair" runat="server">123</span></p>
                </div>
                <div>
                    <p>Eyebrows: <span id="eyebrow" runat="server">123</span></p>
                </div>
                <div>
                    <p>Forehead: <span id="forehead" runat="server">123</span></p>
                </div>
                <div>
                    <p>Eyes: <span id="eyes" runat="server">123</span></p>
                </div>
                <div>
                    <p>Nose: <span id="nose" runat="server">123</span></p>
                </div>
                <div>
                    <p>Mouth: <span id="mouth" runat="server">123</span></p>
                </div>
                <div>
                    <p>Chin: <span id="chin" runat="server">123</span></p>
                </div>
                <div>
                    <p>Teeth: <span id="teeth" runat="server">123</span></p>
                </div>
                <div>
                    <p>Fingers: <span id="finger" runat="server">123</span></p>
                </div>
                <div>
                    <p>Ears: <span id="ears" runat="server">123</span></p>
                </div>
                <div>
                    <p>Face: <span id="face" runat="server">123</span></p>
                </div>
                <div>
                    <p>Complexion: <span id="complexion" runat="server">123</span></p>
                </div>
                <div>
                    <p>FacialHair: <span id="facialhair" runat="server">123</span></p>
                </div>
                <div>
                    <p>FacialHairType: <span id="facialhairtype" runat="server">123</span></p>
                </div>
                <div>
                    <p>Marks: <span id="marks" runat="server">123</span></p>
                </div>
                <div>
                    <p>Deformities: <span id="deformities" runat="server">123</span></p>
                </div>
                <div>
                    <p>Manners: <span id="manners" runat="server">123</span></p>
                </div>
                <div>
                    <p>Gait: <span id="gait" runat="server">123</span></p>
                </div>
                <div>
                    <p>Speech: <span id="speech" runat="server">123</span></p>
                </div>
                <div>
                    <p>Appearance: <span id="appearance" runat="server">123</span></p>
                </div>
                <div>
                    <p>Dressing: <span id="dressing" runat="server">123</span></p>
                </div>
                <div>
                    <p>Accomplishments: <span id="accomplishments" runat="server">123</span></p>
                </div>
                <div>
                    <p>Habits: <span id="habits" runat="server">123</span></p>
                </div>
                <div>
                    <p>Bad habits: <span id="badhabits" runat="server">123</span></p>
                </div>
                <div>
                    <p>OtherDescriptivePoints: <span id="otherDescriptivePoints" runat="server">123</span></p>
                </div>
            </div>

            <div class="sub-head-5">
                <div>
                    <h4>5. F.P. formula and photograph (if a convict)</h4>
                    <p>Cross references to other registers and C.D.</p>
                    <p>Images</p>
                    <div id="imgContainer" class="imageContainer" runat="server"></div>
                    <p>Fingerprints</p>
                    <div id="fingerprintContainer" class="imageContainer" runat="server"></div>
                </div>
            </div>

            <div class="sub-head-6">
                <div>
                    <h4>6. Identifying witnesses and their father's names and addresse.</h4>
                    <div id="witnessContainer" class="witnessContainer" runat="server">
                    </div>
                </div>
            </div>
            <div class="sub-head-7">
                <div>
                    <h4>7. Places of residence (All places in which he has ever resided and period </br>of residences also include places frequently visited).</h4>
                    <div id="residenceContainer" runat="server" class="residenceContainer">
                    </div>
                </div>
            </div>
            <div class="sub-head-8">
                <div>
                    <h4>8. Class of offender. (Append notes showing M.O. details, means of transport used,</br> kind property stolen. in all cases in which such features are distinctive and likely</br> to be of importance. How did he become addicted to crime ?)</h4>
                    <div id="offenceContainer" runat="server" class="offenceContainer">
                    </div>
                </div>
            </div>
            <div>
                <h4>9. Associates (Likely to be visited)</h4>
            </div>
            <div>
                <table class="tblborder" border="1" id="associateTable" runat="server">
                    <tr>
                        <td>Name, Father's name and caste</td>
                        <td>Residence</td>
                        <td>Occupation</td>
                        <td>Nature of association and refrence to History Sheet, if any.</td>
                    </tr>
                </table>
            </div>

            <div>
                <h4>10. Relates those(Likely to visit to be specified)</h4>
            </div>
            <div>
                <table class="tblborder" id="tblRelatives" border="1" runat="server">
                    <tr>
                        <td>Name and Relationship</td>
                        <td>Residence</td>
                        <td>Occupation</td>
                        <td>Reference to History Sheet, if any</td>
                    </tr>
                </table>
            </div>

            <div>
                <div class="sub-head-11">
                    <h4>11. Exact information regarding kown methods of disposal of stolen property (cite cases) ana names and residence of receivers.</h4>
                    <table id="tblDisposalMethod" runat="server" class="tblborder" border="1">
                        <thead>
                            <tr>
                                <td>Mehod</td>
                                <td>Receiver Name</td>
                                <td>Receiver Address</td>
                                <td>Is a History Sheeter</td>
                            </tr>
                        </thead>

                    </table>
                </div>
            </div>
            <div class="sub-head-12">
                <div>
                    <h4>12. Particulars of Past arrests, When, Where and by Whom harboured, Localities in which he has committed crime, citing offences.</h4>
                    <table id="tblPastArrest" runat="server" class="tblborder" border="1">
                        <thead>
                            <tr>
                                <td>Case Datails</td>
                                <td>Arrest Date</td>
                                <td>where arrested</td>
                            </tr>
                        </thead>
                    </table>
                </div>

            </div>
            <div>
                <h4>13. Cases in which suspected with clear reasons and miscellaneous information useful for a security case.</h4>
            </div>
            <div>
                <table class="tblborder" id="tblSuspected" runat="server" border="1">
                    <thead>
                        <tr>
                            <td>Section, modus operandi and any S.R. No.</td>
                            <td>District, station and crime number</td>
                            <td>Kind and value of property stolen</td>
                            <td>Remarks</td>
                        </tr>
                    </thead>
                </table>
            </div>

            <div>
                <h4>14. Particulars of convictions.</h4>
            </div>
            <div>
                <table class="tblborder" id="tblConviction" runat="server" border="1">
                    <thead>
                        <tr>
                            <td>Section, modus operandi and any S.R. No.</td>
                            <td>District, station and crime No.</td>
                            <td>Kind and value of property stolen and recovered</td>
                            <td>Court, conviction date and sentence.</td>
                            <td>F.P.B. Serial No. and date identifying witness date of release.</td>
                        </tr>
                    </thead>
                </table>
            </div>

            <div>
                <h4>15. Annual precis of entries in the Enquiry Note Sheets</h4>
                <h5 style="font-family: Calibri;">N.B--(1) Include details of livelihood of dependants, associates, absences and all information useful in a B.L. case</h5>
                <h5 style="font-weight: bold; font-family: Calibri;">(2) The Enwuiry Note Sheet will be kept loose in the folder.</h5>
            </div>

            <div>
                <table class="tblborder" id="tblEnquiryNote" runat="server" border="1">
                    <thead>
                        <tr>
                            <td>Date</td>
                            <td>Note</td>
                            <td>Initials</td>
                        </tr>
                    </thead>
                </table>
            </div>
            <div>
               <h4>16. Mobile Numbers</h4>
            </div>
            <div>
                <table class="tblborder" id="tblMobile" runat="server" border="1">
                    <thead>
                        <tr>
                            <td>Mobile Number</td>
                            <td>Operator</td>
                            <td>Status</td>
                            <td>Reported On</td>
                        </tr>
                    </thead>
                </table>
            </div>
            <div>
               <h4>17. Bank Account Nubmers</h4>
            </div>
            <div>
                <table id="tblAccount" runat="server" class="tblborder" border="1">
                    <thead>
                        <tr>
                            <td>Account Number</td>
                            <td>Bank Name</td>
                            <td>Balance</td>
                            <td>Reported On</td>
                        </tr>
                    </thead>
                </table>
            </div>
            <div>
               <h4>18. Political Links</h4>
            </div>
            <div>
                <table id="tblPoliticalLinks" runat="server" class="tblborder" border="1">
                    <thead>
                        <tr>
                            <td>Party Name</td>
                            <td>Status</td>
                            <td>Since</td>
                            <td>Reported On</td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
