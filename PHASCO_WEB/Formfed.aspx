<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="Formfed.aspx.cs" Inherits="PHASCO_WEB.Formfed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="View1" runat="server">
            <table class="table table-sm no-border" border="0" cellpadding="0" cellspacing="0" style="width: 90%" id="TABLE1"
                language="javascript" onclick="return TABLE1_onclick()" align="center">
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%; height: 19px">
                        <asp:RadioButtonList ID="RadioButtonList_MOde" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">فرم ارسال OD</asp:ListItem>
                            <asp:ListItem Value="1">فرم رفع اشکال</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td align="left" dir="rtl" style="width: 20%; height: 19px">انتخاب&nbsp; فرم :
                    </td>
                </tr>
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%; height: 19px;">
                        <asp:TextBox ID="TextBox_Az_Name" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%; height: 19px;" align="left" dir="rtl">نام آزمايشگاه :
                    </td>
                </tr>
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%">
                        <asp:TextBox ID="TextBox_Mas_Test" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%" align="left" dir="rtl">مسئول انجام تست :
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; height: 20px;" dir="rtl">
                        <asp:TextBox ID="TextBox_Dafe_Estefade" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%; height: 20px;" align="left" dir="rtl">دفعه استفاده از کیت :
                    </td>
                    <td style="width: 30%; height: 20px;" dir="rtl">
                        <asp:TextBox ID="TextBox_Mas_Fani" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%; height: 20px;" align="left" dir="rtl">مسئول فنی آزمایشگاه :
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%" dir="rtl">
                        <asp:TextBox ID="TextBox_Tarikh" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%" align="left" dir="rtl">تاریخ انجام تست :
                    </td>
                    <td style="width: 30%" dir="rtl">
                        <asp:TextBox ID="TextBox_Tel" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%" align="left" dir="rtl">تلفن :
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; height: 20px;" dir="rtl">
                        <asp:TextBox ID="TextBox_Mark" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%; height: 20px;" align="left" dir="rtl">مارک کیت :
                    </td>
                    <td style="width: 30%; height: 20px;" dir="rtl">
                        <asp:TextBox ID="TextBox_Test_mored" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%; height: 20px;" align="left" dir="rtl">تست مورد نظر :
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%" dir="rtl">
                        <asp:TextBox ID="TextBox_Engeza_Tarikh" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%" align="left" dir="rtl">تاریخ انقضاء :
                    </td>
                    <td style="width: 30%" dir="rtl">
                        <asp:TextBox ID="TextBox_Seri_Sakht" runat="server" 
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="width: 20%" align="left" dir="rtl">سری ساخت :
                    </td>
                </tr>
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%">
                        <asp:TextBox ID="TextBox_Tozih" runat="server" 
                            Height="80px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td align="left" dir="rtl" style="width: 20%">توضيحات :
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="center" style="width: 7%"></td>
                    <td align="center" style="width: 7%">1
                    </td>
                    <td align="center" style="width: 7%">2
                    </td>
                    <td align="center" style="width: 7%">3
                    </td>
                    <td align="center" style="width: 7%">4
                    </td>
                    <td align="center" style="width: 7%">5
                    </td>
                    <td align="center" style="width: 7%">6
                    </td>
                    <td align="center" style="width: 7%">7
                    </td>
                    <td align="center" style="width: 7%">8
                    </td>
                    <td align="center" style="width: 7%">9
                    </td>
                    <td align="center" style="width: 7%">10
                    </td>
                    <td align="center" style="width: 7%">11
                    </td>
                    <td align="center" style="width: 7%">12
                    </td>
                    <td align="center" style="width: 7%"></td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%; height: 19px">A
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A1" runat="server" 
                            Width="90%" TabIndex="-1"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A2" runat="server" 
                            Width="90%" TabIndex="8"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A3" runat="server" 
                            Width="90%" TabIndex="16"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A4" runat="server" 
                            Width="90%" TabIndex="24"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A5" runat="server" 
                            Width="90%" TabIndex="32"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A6" runat="server" 
                            Width="90%" TabIndex="40"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A7" runat="server" 
                            Width="90%" TabIndex="48"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A8" runat="server" 
                            Width="90%" TabIndex="56"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A9" runat="server" 
                            Width="90%" TabIndex="64"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A10" runat="server" 
                            Width="90%" TabIndex="72"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A11" runat="server" 
                            Width="90%" TabIndex="80"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:TextBox ID="TextBox_A12" runat="server" 
                            Width="90%" TabIndex="88"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 19px">A
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">B
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B1" runat="server" 
                            Width="90%" TabIndex="1"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B2" runat="server" 
                            Width="90%" TabIndex="9"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B3" runat="server" 
                            Width="90%" TabIndex="17"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B4" runat="server" 
                            Width="90%" TabIndex="25"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B5" runat="server" 
                            Width="90%" TabIndex="33"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B6" runat="server" 
                            Width="90%" TabIndex="41"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B7" runat="server" 
                            Width="90%" TabIndex="49"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B8" runat="server" 
                            Width="90%" TabIndex="57"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B9" runat="server" 
                            Width="90%" TabIndex="65"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B10" runat="server" 
                            Width="90%" TabIndex="73"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B11" runat="server" 
                            Width="90%" TabIndex="81"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_B12" runat="server" 
                            Width="90%" TabIndex="89"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">B
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">C
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C1" runat="server" 
                            Width="90%" TabIndex="2"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C2" runat="server" 
                            Width="90%" TabIndex="10"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C3" runat="server" 
                            Width="90%" TabIndex="18"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C4" runat="server" 
                            Width="90%" TabIndex="26"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C5" runat="server" 
                            Width="90%" TabIndex="34"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C6" runat="server" 
                            Width="90%" TabIndex="42"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C7" runat="server" 
                            Width="90%" TabIndex="50"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C8" runat="server" 
                            Width="90%" TabIndex="58"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C9" runat="server" 
                            Width="90%" TabIndex="66"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C10" runat="server" 
                            Width="90%" TabIndex="74"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C11" runat="server" 
                            Width="90%" TabIndex="82"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_C12" runat="server" 
                            Width="90%" TabIndex="90"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">C
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%; height: 20px;">D
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D1" runat="server" 
                            Width="90%" TabIndex="3"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D2" runat="server" 
                            Width="90%" TabIndex="11"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D3" runat="server" 
                            Width="90%" TabIndex="19"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D4" runat="server" 
                            Width="90%" TabIndex="27"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D5" runat="server" 
                            Width="90%" TabIndex="35"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D6" runat="server" 
                            Width="90%" TabIndex="43"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D7" runat="server" 
                            Width="90%" TabIndex="51"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D8" runat="server" 
                            Width="90%" TabIndex="59"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D9" runat="server" 
                            Width="90%" TabIndex="67"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D10" runat="server" 
                            Width="90%" TabIndex="75"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D11" runat="server" 
                            Width="90%" TabIndex="83"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">
                        <asp:TextBox ID="TextBox_D12" runat="server" 
                            Width="90%" TabIndex="91"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%; height: 20px;">D
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">E
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E1" runat="server" 
                            Width="90%" TabIndex="4"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E2" runat="server" 
                            Width="90%" TabIndex="12"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E3" runat="server" 
                            Width="90%" TabIndex="20"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E4" runat="server" 
                            Width="90%" TabIndex="28"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E5" runat="server" 
                            Width="90%" TabIndex="36"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E6" runat="server" 
                            Width="90%" TabIndex="44"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E7" runat="server" 
                            Width="90%" TabIndex="52"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E8" runat="server" 
                            Width="90%" TabIndex="60"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E9" runat="server" 
                            Width="90%" TabIndex="68"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E10" runat="server" 
                            Width="90%" TabIndex="76"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E11" runat="server" 
                            Width="90%" TabIndex="84"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_E12" runat="server" 
                            Width="90%" TabIndex="92"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">E
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">F
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F1" runat="server" 
                            Width="90%" TabIndex="5"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F2" runat="server" 
                            Width="90%" TabIndex="13"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F3" runat="server" 
                            Width="90%" TabIndex="21"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F4" runat="server" 
                            Width="90%" TabIndex="29"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F5" runat="server" 
                            Width="90%" TabIndex="37"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F6" runat="server" 
                            Width="90%" TabIndex="45"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F7" runat="server" 
                            Width="90%" TabIndex="53"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F8" runat="server" 
                            Width="90%" TabIndex="61"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F9" runat="server" 
                            Width="90%" TabIndex="69"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F10" runat="server" 
                            Width="90%" TabIndex="77"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F11" runat="server" 
                            Width="90%" TabIndex="85"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_F12" runat="server" 
                            Width="90%" TabIndex="93"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">F
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">G
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G1" runat="server" 
                            Width="90%" TabIndex="6"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G2" runat="server" 
                            Width="90%" TabIndex="14"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G3" runat="server" 
                            Width="90%" TabIndex="22"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G4" runat="server" 
                            Width="90%" TabIndex="30"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G5" runat="server" 
                            Width="90%" TabIndex="38"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G6" runat="server" 
                            Width="90%" TabIndex="46"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G7" runat="server" 
                            Width="90%" TabIndex="54"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G8" runat="server" 
                            Width="90%" TabIndex="62"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G9" runat="server" 
                            Width="90%" TabIndex="70"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G10" runat="server" 
                            Width="90%" TabIndex="78"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G11" runat="server" 
                            Width="90%" TabIndex="86"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_G12" runat="server" 
                            Width="90%" TabIndex="94"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">G
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">H
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H1" runat="server" 
                            Width="90%" TabIndex="7"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H2" runat="server" 
                            Width="90%" TabIndex="15"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H3" runat="server" 
                            Width="90%" TabIndex="23"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H4" runat="server" 
                            Width="90%" TabIndex="31"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H5" runat="server" 
                            Width="90%" TabIndex="39"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H6" runat="server" 
                            Width="90%" TabIndex="47"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H7" runat="server" 
                            Width="90%" TabIndex="55"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H8" runat="server" 
                            Width="90%" TabIndex="63"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H9" runat="server" 
                            Width="90%" TabIndex="71"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H10" runat="server" 
                            Width="90%" TabIndex="79"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H11" runat="server" 
                            Width="90%" TabIndex="87"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">
                        <asp:TextBox ID="TextBox_H12" runat="server" 
                            Width="90%" TabIndex="95"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 7%">H
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%"></td>
                    <td align="center" style="width: 7%">1
                    </td>
                    <td align="center" style="width: 7%">2
                    </td>
                    <td align="center" style="width: 7%">3
                    </td>
                    <td align="center" style="width: 7%">4
                    </td>
                    <td align="center" style="width: 7%">5
                    </td>
                    <td align="center" style="width: 7%">6
                    </td>
                    <td align="center" style="width: 7%">7
                    </td>
                    <td align="center" style="width: 7%">8
                    </td>
                    <td align="center" style="width: 7%">9
                    </td>
                    <td align="center" style="width: 7%">10
                    </td>
                    <td align="center" style="width: 7%">11
                    </td>
                    <td align="center" style="width: 7%">12
                    </td>
                    <td align="center" style="width: 7%"></td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" style="width: 100%">
                        <asp:Button ID="Button_Insert" runat="server" Text="ثبت شود" OnClick="Button_Insert_Click"
                            CssClass="btn btn-primary" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="center" dir="rtl" style="width: 100%">باتشکر ازشما<br />
                        فرم شما باموفقيت ارسال شد.
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
