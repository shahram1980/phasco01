<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="QC.aspx.cs" Inherits="PHASCO_WEB.QC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
    <style type="text/css">
        .style18
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc_Mid" runat="server">

    <table  style="direction:ltr ;width:100%">
        <tr>
            <td style="width:30%;vertical-align:top;text-align:left;">
                Brand :
                <asp:DropDownList ID="DropDownList_Brand" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource_Brand" DataTextField="Brand" DataValueField="id" 
                    onselectedindexchanged="DropDownList_Brand_SelectedIndexChanged">
                    <asp:ListItem>-----------</asp:ListItem>
                </asp:DropDownList>
            </td>
              <td style="width:30%;vertical-align:top;text-align:left;">
                  Product :
                  <asp:DropDownList ID="DropDownList_Product" runat="server" Enabled="False" 
                      onselectedindexchanged="DropDownList_Product_SelectedIndexChanged" 
                      AutoPostBack="True">
                      <asp:ListItem>-----------</asp:ListItem>
                  </asp:DropDownList>
            </td>
                <td style="width:30%;vertical-align:top;text-align:left;">
                    Lot No :
                    <asp:DropDownList ID="DropDownList_LotExpr" runat="server" Enabled="False" 
                        onselectedindexchanged="DropDownList_LotExpr_SelectedIndexChanged" 
                        AutoPostBack="True">
                        <asp:ListItem>-----------</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width:30%;vertical-align:top;text-align:left;">
                <asp:SqlDataSource ID="SqlDataSource_Brand" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:phasco.Properties.Settings.Phasco_NetConnectionString %>" 
                    SelectCommand="SELECT [Brand], [id] FROM [TBL_QC_BRANDS] ORDER BY [Brand]">
                </asp:SqlDataSource>
            </td>
              <td style="width:30%;vertical-align:top;text-align:left;">
                  &nbsp;</td>
                <td style="width:30%;vertical-align:top;text-align:left;">
                    &nbsp;</td>
        </tr>
    </table>

    <asp:Panel ID="Panel_Quntitative" runat="server" 
        BackColor="#CCCCCC" Visible="False">
        <table class="style18">
            <tr>
                <td style="width:35%;vertical-align:top;">
                    <asp:Panel ID="Panel_Quantitative_Test" runat="server" GroupingText="  Quantitative Test  " 
                       style="margin-bottom: 0px" Height="220px"> 
                    <table class="style18">
                        <tr>
                            <td>
                                A</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxA" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                B</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                C</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxC" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                D</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxD" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                E</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxE" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                F</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxF" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                G</td>
                            <td align="left">
                                <asp:TextBox ID="TextBoxG" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right">
                                <br />
                                <asp:Button ID="Button_Process" runat="server" Text="ارسال شود" Width="107px" 
                                    onclick="Button_Process_Click" />
                            </td>
                        </tr>
                    </table>
                      </asp:Panel>
                </td>
                <td style="width:65%;vertical-align:top;">
                 <asp:Panel ID="Panel_QC_Controls" runat="server" GroupingText="  QC Controls  " 
                       style="margin-bottom: 0px"> 
                        <div style="direction:rtl;text-align:justify;">
               
                                 کاربر گرامی :<br /> در صورت تمایل به مشارکت در طرح کنترل کیفی فاسکو و گرفتن 
                                 گواهی کنترل کیفی از کمپانی
                               
                                 Calbiotech&nbsp; کشور آمریکا ، نتایج حاصل از سرم کنترل های&nbsp; Bio-Rad را در بخش زیر 
                                 وارد نمائید.<br />
                                 </div><hr />
                    <table  style="direction:ltr ;width:100%">
                        <tr>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                Brand :<br />
                                <asp:DropDownList ID="DropDownList_BranDQC" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource_Brand0" DataTextField="Brand" DataValueField="id" 
                    onselectedindexchanged="DropDownList_Brand2_SelectedIndexChanged">
                                    <asp:ListItem>-----------</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                Product :<br />
                                <asp:DropDownList ID="DropDownList_Product2" runat="server" Enabled="False" 
                      onselectedindexchanged="DropDownList_Product2_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>-----------</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                Lot No :<br />
                                <asp:DropDownList ID="DropDownList_LotExpr2" runat="server" Enabled="False" 
                        onselectedindexchanged="DropDownList_LotExpr2_SelectedIndexChanged">
                                    <asp:ListItem>-----------</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                <asp:SqlDataSource ID="SqlDataSource_Brand0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:phasco.Properties.Settings.Phasco_NetConnectionString %>" 
                    SelectCommand="SELECT [Brand], [id] FROM [TBL_QC_BRANDS] ORDER BY [Brand]">
                                </asp:SqlDataSource>
                            </td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                        </tr>
                                          <tr>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                Level 1</td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                              </td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                        </tr>
                                          <tr>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                Level 2</td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                              </td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                Level 3</td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                            </td>
                            <td style="width:30%;vertical-align:top;text-align:left;">
                                &nbsp;</td>
                        </tr>
                    </table>
                   </asp:Panel>
                 
      
                </td>
            </tr>
        </table>
    </asp:Panel>
 
    </asp:Content>
