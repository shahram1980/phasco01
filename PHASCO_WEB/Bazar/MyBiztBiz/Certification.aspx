<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="Certification.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Certification" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script language="C#" runat="server">
        public string image_view(string imagename)
        {
            if (imagename == "none.jpg") return "None/none.jpg";
            if (imagename != "none.jpg") return "sm_" + imagename; ;
            return "none.jpg";
        }
    </script>
    <div class="direction">
        <table style="width: 95%">
            <tr>
                <td>
                    <img src="../images/plusicon.jpg" />
                    <a href="Certification.aspx?status=Insnew">
                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, Post_a_Certificate %>" />
                    </a>
                </td>
            </tr>
        </table>
        <br />
        <hr style="background: #ccc" />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table class="style1">
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, name %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:DropDownList ID="DropDownList_Name" runat="server">
                                <asp:ListItem Value="0">----- Please Select -----</asp:ListItem>
                                <asp:ListItem Value="iso9000">iso9000</asp:ListItem>
                                <asp:ListItem Value="iso9001">iso9001</asp:ListItem>
                                <asp:ListItem Value="ISO">ISO</asp:ListItem>
                                <asp:ListItem Value="ISO9001-2000">ISO9001-2000</asp:ListItem>
                                <asp:ListItem Value="ISO9001:2000">ISO9001:2000</asp:ListItem>
                                <asp:ListItem Value="ISO9000">ISO9000</asp:ListItem>
                                <asp:ListItem Value="ISO8402">ISO8402</asp:ListItem>
                                <asp:ListItem Value="ISO9000-1">ISO9000-1</asp:ListItem>
                                <asp:ListItem Value="ISO9000-2">ISO9000-2</asp:ListItem>
                                <asp:ListItem Value="ISO9000-3">ISO9000-3</asp:ListItem>
                                <asp:ListItem Value="ISO9000-4">ISO9000-4</asp:ListItem>
                                <asp:ListItem Value="ISO9001">ISO9001</asp:ListItem>
                                <asp:ListItem Value="ISO9002">ISO9002</asp:ListItem>
                                <asp:ListItem Value="ISO9003">ISO9003</asp:ListItem>
                                <asp:ListItem Value="ISO9004-1">ISO9004-1</asp:ListItem>
                                <asp:ListItem Value="ISO9004-2">ISO9004-2</asp:ListItem>
                                <asp:ListItem Value="ISO9004-3">ISO9004-3</asp:ListItem>
                                <asp:ListItem Value="ISO9004-4">ISO9004-4</asp:ListItem>
                                <asp:ListItem Value="ISO10005">ISO10005</asp:ListItem>
                                <asp:ListItem Value="ISO10006">ISO10006</asp:ListItem>
                                <asp:ListItem Value="ISO10007">ISO10007</asp:ListItem>
                                <asp:ListItem Value="ISO10011-1">ISO10011-1</asp:ListItem>
                                <asp:ListItem Value="ISO10011-2">ISO10011-2</asp:ListItem>
                                <asp:ListItem Value="ISO10011-3">ISO10011-3</asp:ListItem>
                                <asp:ListItem Value="ISO10012-1">ISO10012-1</asp:ListItem>
                                <asp:ListItem Value="ISO10012-2">ISO10012-2</asp:ListItem>
                                <asp:ListItem Value="ISO10013">ISO10013</asp:ListItem>
                                <asp:ListItem Value="ISO/TR10014">ISO/TR10014</asp:ListItem>
                                <asp:ListItem Value="ISO10015">ISO10015</asp:ListItem>
                                <asp:ListItem Value="ISO/TR10017">ISO/TR10017</asp:ListItem>
                                <asp:ListItem Value="ISO19011">ISO19011</asp:ListItem>
                                <asp:ListItem Value="ISO14000">ISO14000</asp:ListItem>
                                <asp:ListItem Value="ISO14001">ISO14001</asp:ListItem>
                                <asp:ListItem Value="ISO14004">ISO14004</asp:ListItem>
                                <asp:ListItem Value="ISO14010">ISO14010</asp:ListItem>
                                <asp:ListItem Value="ISO14011">ISO14011</asp:ListItem>
                                <asp:ListItem Value="ISO14012">ISO14012</asp:ListItem>
                                <asp:ListItem Value="ISO14040">ISO14040</asp:ListItem>
                                <asp:ListItem Value="SA8000">SA8000</asp:ListItem>
                                <asp:ListItem Value="AAA">AAA</asp:ListItem>
                                <asp:ListItem Value="AAAA">AAAA</asp:ListItem>
                                <asp:ListItem Value="SA">SA</asp:ListItem>
                                <asp:ListItem Value="IEC">IEC</asp:ListItem>
                                <asp:ListItem Value="CB">CB</asp:ListItem>
                                <asp:ListItem Value="FM">FM</asp:ListItem>
                                <asp:ListItem Value="IAPMO">IAPMO</asp:ListItem>
                                <asp:ListItem Value="OHSMS">OHSMS</asp:ListItem>
                                <asp:ListItem Value="IQNET">IQNET</asp:ListItem>
                                <asp:ListItem Value="5S">5S</asp:ListItem>
                                <asp:ListItem Value="IECQ">IECQ</asp:ListItem>
                                <asp:ListItem Value="IECQ-HSPM">IECQ-HSPM</asp:ListItem>
                                <asp:ListItem Value="QC0">QC0</asp:ListItem>
                                <asp:ListItem Value="COC">COC</asp:ListItem>
                                <asp:ListItem Value="TL">TL</asp:ListItem>
                                <asp:ListItem Value="CE">CE</asp:ListItem>
                                <asp:ListItem Value="EC">EC</asp:ListItem>
                                <asp:ListItem Value="5EMC7">EMC</asp:ListItem>
                                <asp:ListItem Value="E-mark">E-mark</asp:ListItem>
                                <asp:ListItem Value="EEC">EEC</asp:ListItem>
                                <asp:ListItem Value="RoHS">RoHS</asp:ListItem>
                                <asp:ListItem Value="WEEE">WEEE</asp:ListItem>
                                <asp:ListItem Value="ECE">ECE</asp:ListItem>
                                <asp:ListItem Value="CENELEC">CENELEC</asp:ListItem>
                                <asp:ListItem Value="CEN">CEN</asp:ListItem>
                                <asp:ListItem Value="HAR">HAR</asp:ListItem>
                                <asp:ListItem Value="CECC">CECC</asp:ListItem>
                                <asp:ListItem Value="COS">COS</asp:ListItem>
                                <asp:ListItem Value="ENEC">ENEC</asp:ListItem>
                                <asp:ListItem Value="NCS">NCS</asp:ListItem>
                                <asp:ListItem Value="BSI">BSI</asp:ListItem>
                                <asp:ListItem Value="BS">BS</asp:ListItem>
                                <asp:ListItem Value="BEAB">BEAB</asp:ListItem>
                                <asp:ListItem Value="ASTA">ASTA</asp:ListItem>
                                <asp:ListItem Value="BABT">BABT</asp:ListItem>
                                <asp:ListItem Value="BEB">BEB</asp:ListItem>
                                <asp:ListItem Value="UKAS">UKAS</asp:ListItem>
                                <asp:ListItem Value="GS">GS</asp:ListItem>
                                <asp:ListItem Value="VDE">VDE</asp:ListItem>
                                <asp:ListItem Value="TUV">TUV</asp:ListItem>
                                <asp:ListItem Value="LFGB/LMBG">LFGB/LMBG</asp:ListItem>
                                <asp:ListItem Value="NF">NF</asp:ListItem>
                                <asp:ListItem Value="ACS">ACS</asp:ListItem>
                                <asp:ListItem Value="BV">BV</asp:ListItem>
                                <asp:ListItem Value="CCP">CCP</asp:ListItem>
                                <asp:ListItem Value="TSE">TSE</asp:ListItem>
                                <asp:ListItem Value="AENOR">AENOR </asp:ListItem>
                                <asp:ListItem Value="CEBEC">CEBEC</asp:ListItem>
                                <asp:ListItem Value="APRAGAZ">APRAGAZ</asp:ListItem>
                                <asp:ListItem Value="HRD">HRD</asp:ListItem>
                                <asp:ListItem Value="DEMKO">DEMKO</asp:ListItem>
                                <asp:ListItem Value="ELOT">ELOT</asp:ListItem>
                                <asp:ListItem Value="9GOST2">GOST</asp:ListItem>
                                <asp:ListItem Value="PCT">PCT</asp:ListItem>
                                <asp:ListItem Value="IMQ">IMQ</asp:ListItem>
                                <asp:ListItem Value="IG">IG</asp:ListItem>
                                <asp:ListItem Value="KEMA">KEMA</asp:ListItem>
                                <asp:ListItem Value="KIMA">KIMA</asp:ListItem>
                                <asp:ListItem Value="S-Mark">S-Mark </asp:ListItem>
                                <asp:ListItem Value="MEEI">MEEI</asp:ListItem>
                                <asp:ListItem Value="NEMKO">NEMKO</asp:ListItem>
                                <asp:ListItem Value="DNV">DNV</asp:ListItem>
                                <asp:ListItem Value="NSAI">NSAI</asp:ListItem>
                                <asp:ListItem Value="OVE">OVE</asp:ListItem>
                                <asp:ListItem Value="PCBC">PCBC</asp:ListItem>
                                <asp:ListItem Value="BBJ">BBJ</asp:ListItem>
                                <asp:ListItem Value="SEMKO">SEMKO</asp:ListItem>
                                <asp:ListItem Value="SEV">SEV</asp:ListItem>
                                <asp:ListItem Value="SII">SII</asp:ListItem>
                                <asp:ListItem Value="EZU">EZU</asp:ListItem>
                                <asp:ListItem Value="CCC/3C">CCC/3C</asp:ListItem>
                                <asp:ListItem Value="GB">GB</asp:ListItem>
                                <asp:ListItem Value="CQC">CQC</asp:ListItem>
                                <asp:ListItem Value="CCEE">CCEE</asp:ListItem>
                                <asp:ListItem Value="CCIC">CCIC</asp:ListItem>
                                <asp:ListItem Value="CCIB">CCIB</asp:ListItem>
                                <asp:ListItem Value="CCAA">CCAA</asp:ListItem>
                                <asp:ListItem Value="QS">QS</asp:ListItem>
                                <asp:ListItem Value="JATE">JATE</asp:ListItem>
                                <asp:ListItem Value="VCCI">VCCI</asp:ListItem>
                                <asp:ListItem Value="JIS">JIS</asp:ListItem>
                                <asp:ListItem Value="JISC">JISC</asp:ListItem>
                                <asp:ListItem Value="PSE">PSE</asp:ListItem>
                                <asp:ListItem Value="T-MARK">T-MARK</asp:ListItem>
                                <asp:ListItem Value="S-Mark">S-Mark</asp:ListItem>
                                <asp:ListItem Value="JQA">JQA</asp:ListItem>
                                <asp:ListItem Value="JET">JET</asp:ListItem>
                                <asp:ListItem Value="EK-Mark">EK-Mark </asp:ListItem>
                                <asp:ListItem Value="K-Mark">K-Mark </asp:ListItem>
                                <asp:ListItem Value="KS">KS</asp:ListItem>
                                <asp:ListItem Value="KFDA">KFDA</asp:ListItem>
                                <asp:ListItem Value="HKSI">HKSI</asp:ListItem>
                                <asp:ListItem Value="HKSTC">HKSTC</asp:ListItem>
                                <asp:ListItem Value="BSMI">BSMI</asp:ListItem>
                                <asp:ListItem Value="NCC(DGT)">NCC(DGT)</asp:ListItem>
                                <asp:ListItem Value="SIRIM">SIRIM</asp:ListItem>
                                <asp:ListItem Value="PSB">PSB</asp:ListItem>
                                <asp:ListItem Value="SPRING">SPRING</asp:ListItem>
                                <asp:ListItem Value="STQC">STQC</asp:ListItem>
                                <asp:ListItem Value="BIS">BIS</asp:ListItem>
                                <asp:ListItem Value="ISI">ISI</asp:ListItem>
                                <asp:ListItem Value="TEC">TEC</asp:ListItem>
                                <asp:ListItem Value="ISIRI">ISIRI</asp:ListItem>
                                <asp:ListItem Value="VOC">VOC</asp:ListItem>
                                <asp:ListItem Value="SASO">SASO</asp:ListItem>
                                <asp:ListItem Value="UL">UL</asp:ListItem>
                                <asp:ListItem Value="FDA">FDA</asp:ListItem>
                                <asp:ListItem Value="ASTM">ASTM</asp:ListItem>
                                <asp:ListItem Value="EPA">EPA</asp:ListItem>
                                <asp:ListItem Value="HACCP">HACCP</asp:ListItem>
                                <asp:ListItem Value="NSF">NSF</asp:ListItem>
                                <asp:ListItem Value="CPSC">CPSC</asp:ListItem>
                                <asp:ListItem Value="DOT">DOT</asp:ListItem>
                                <asp:ListItem Value="ASME">ASME</asp:ListItem>
                                <asp:ListItem Value="API">API</asp:ListItem>
                                <asp:ListItem Value="ANSI">ANSI</asp:ListItem>
                                <asp:ListItem Value="FCC">FCC</asp:ListItem>
                                <asp:ListItem Value="USDA">USDA</asp:ListItem>
                                <asp:ListItem Value="EPA">EPA</asp:ListItem>
                                <asp:ListItem Value="CPSC">CPSC</asp:ListItem>
                                <asp:ListItem Value="FTC">FTC</asp:ListItem>
                                <asp:ListItem Value="SEI">SEI</asp:ListItem>
                                <asp:ListItem Value="ECCB">ECCB</asp:ListItem>
                                <asp:ListItem Value="16EIA3">EIA</asp:ListItem>
                                <asp:ListItem Value="CARB">CARB</asp:ListItem>
                                <asp:ListItem Value="ELT">ELT</asp:ListItem>
                                <asp:ListItem Value="CSA">CSA</asp:ListItem>
                                <asp:ListItem Value="QMI">QMI</asp:ListItem>
                                <asp:ListItem Value="CMVSS">CMVSS</asp:ListItem>
                                <asp:ListItem Value="IC">IC</asp:ListItem>
                                <asp:ListItem Value="CUL">CUL</asp:ListItem>
                                <asp:ListItem Value="PMAC">PMAC</asp:ListItem>
                                <asp:ListItem Value="UC">UC</asp:ListItem>
                                <asp:ListItem Value="INMETRO">INMETRO</asp:ListItem>
                                <asp:ListItem Value="UCIEE">UCIEE</asp:ListItem>
                                <asp:ListItem Value="ANAC">ANAC</asp:ListItem>
                                <asp:ListItem Value="NOM">NOM</asp:ListItem>
                                <asp:ListItem Value="IRAM">IRAM</asp:ListItem>
                                <asp:ListItem Value="S-Mark">S-Mark </asp:ListItem>
                                <asp:ListItem Value="SAA">SAA</asp:ListItem>
                                <asp:ListItem Value="C&#65293;tick">C&#65293;tick</asp:ListItem>
                                <asp:ListItem Value="SAI">SAI</asp:ListItem>
                                <asp:ListItem Value="AQIS">AQIS</asp:ListItem>
                                <asp:ListItem Value="TGA">TGA</asp:ListItem>
                                <asp:ListItem Value="MEPS">MEPS</asp:ListItem>
                                <asp:ListItem Value="TCA">TCA</asp:ListItem>
                                <asp:ListItem Value="Q-BASE">Q-BASE</asp:ListItem>
                                <asp:ListItem Value="SONCAP">SONCAP</asp:ListItem>
                                <asp:ListItem Value="SABS">SABS</asp:ListItem>
                                <asp:ListItem Value="MCC">MCC</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, No %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_NO" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Issued_Date %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Issued_Date" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, Expired_Date %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Expired_Date" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Valid_Area %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Valid_Area" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Photo %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:FileUpload ID="FileUpload_Photo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            <asp:Image ID="Image_Photo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Issued_Bureau %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Issued_Bureau" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            <asp:ImageButton ID="ImageButton_Insert" ImageUrl="<%$ Resources:Resource, Submit_Img %>"
                                runat="server" OnClick="ImageButton_Insert_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table border="0" dir="ltr" cellpadding="0" style="width: 550px; height: 20px; border-collapse: collapse;
                    background: transparent url(  '../images/bg_Panel_title.jpg' ) repeat-x scroll center top;">
                    <tr>
                        <td width="5%">
                        </td>
                        <td align="left" width="19%" valign="top">
                        </td>
                        <td align="left" width="19%" valign="top">
                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource, Name %>" />
                        </td>
                        <td align="left" width="19%" valign="top">
                            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource, No %>" />
                        </td>
                        <td align="left" width="19%" valign="top">
                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Resource, Expired_Date %>" />
                        </td>
                        <td align="left" width="19%" valign="top">
                            <asp:Literal Text="<%$ Resources:Resource, Operate %>" runat="server" ID="Literal9" />
                        </td>
                    </tr>
                </table>
                <br />
                <table cellspacing="1" class="style1">
                    <tr>
                        <td>
                            <asp:ListView ID="listItems" runat="server" OnPagePropertiesChanging="listItems_PagePropertiesChanging">
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <table id="table2" border="0" cellpadding="0" dir="ltr" style="border-collapse: collapse"
                                        width="550">
                                        <tr>
                                            <td align="center" valign="top" width="19%" style="padding: 5px;">
                                                <img alt="<%# Eval("Name") %>" src="cepload\<%# image_view(Eval("Photo").ToString()) %>" />
                                            </td>
                                            <td align="left" valign="top" width="19%">
                                                <%# Eval("Name")%>
                                            </td>
                                            <td align="left" valign="top" width="19%">
                                                <%# Eval("No")%>
                                            </td>
                                            <td align="left" valign="top" width="19%">
                                                <%# Eval("date_ins")%>
                                            </td>
                                            <td align="left" valign="top" width="19%">
                                                <a href='Certification.aspx?status=edit&id=<%# Eval("Id") %>'>
                                                    <asp:Literal ID="lit2" runat="server" Text="<%$ Resources:Resource, edit %>" />
                                                </a>
                                            </td>
                                            <td width="5%">
                                                <input id="chkBxMail" runat="server" class="filename" name="checked[]" type="checkbox"
                                                    value='<%# Eval("id")%>' />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemSeparatorTemplate>
                                    <hr />
                                </ItemSeparatorTemplate>
                            </asp:ListView>
                        </td>
                    </tr>
                    <tr>
                        <td class="direction_Align">
                            <asp:Button ID="Button_Delete" runat="server" OnClick="Button_Delete_Click" Text="   <%$ Resources:Resource, Delete %>   " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center>
                                <div style="border: 1px solid #ccc; width: 350px; height: 30px; text-align: center">
                                    <asp:DataPager PagedControlID="listItems" runat="server" ID="dataPager">
                                        <Fields>
                                            <asp:NumericPagerField />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </center>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
