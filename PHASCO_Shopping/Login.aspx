<%@ Page Language="C#" MasterPageFile="~/Template/PHASCO_Shopping.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="PHASCO_Shopping.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 1000px; margin: 0px auto">
        <tr>
            <td class="reg-title">
                <table style="width: 100%">
                    <tr>
                        <td class="center-align">
                            &nbsp;
                        </td>
                        <td class="last-news-center">
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div class="cat-main">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 504px" class="center-align">
                                <br />
                                <br />
                                <img alt="" src="images/text-top-reg.jpg" width="481" height="41" /><br />
                                <br />
                                <br />
                                <a href="register.aspx">
                                    <img style="border: 0px;" alt="" src='<asp:Literal ID="li12500" Text="<%$ Resources:Resource, jonin-reg %>" runat="server" />' width="146" height="49" />
                                     
                                    </a>
                            </td>
                            <td style="width: 7px">
                                <img alt="" src="images/doter-reg.jpg" width="1" height="186" />
                            </td>
                            <td style="text-align:center;">
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton_Login">
                                 <div style="width: 300px; float: left;">
                                    <div style="float: left;">
                                        <img alt="" src='<asp:Literal ID="Literal65287400651" Text="<%$ Resources:Resource, Login_Id_img %>" runat="server" />'
                                            width="117" height="23" />
                                        
                                    </div>
                                    <div style="float: left;">
                                        <asp:TextBox ID="TextBox_Uid" runat="server" Height="21px"></asp:TextBox></div>
                                </div>
                                <div style="width: 300px; float: left; margin-top: 5px;">
                                    <div style="float: left;">
                                        <img alt="" src='<asp:Literal ID="Literal65287400lik90651" Text="<%$ Resources:Resource, Login_Pass_img %>" runat="server" />'
                                            width="83" height="23" />
                                    </div>
                                    <div style="float: left;">
                                        <asp:TextBox ID="TextBox_Pass" runat="server" TextMode="Password" Height="21px" 
                                            Width="165px"></asp:TextBox></div>
                                </div>
                                
                                <center>
                                <div style="float: left;width:100%;margin-top:5px;">
                                    <asp:ImageButton ID="ImageButton_Login" runat="server" OnClick="ImageButton_Login_Click"
                                        ImageUrl="<%$ Resources:Resource, sigin-buttom %>" />
                                        
                                          
                                </div>
                                      <div style="float: left;width:100%;margin-top:5px;">
                                    
                                    <a href="Login.aspx?s=forget" >
                                    <asp:Literal Text="<%$ Resources:Resource, Forget_Password %>" runat="server" ID="forgotpass001" />
                                       </a>   
                                </div>
                                </center>
                                        </asp:Panel>
                           
                                
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 504px" class="center-align">
                                
                            </td>
                            <td style="width: 7px">
                                <img alt="" src="images/doter-reg.jpg" width="1" height="186" />
                            </td>
                            <td style="text-align:center;">
                            
                           <asp:Panel ID="Panel_Fotget" runat="server" DefaultButton="ImageButton_Login">
                                 <div style="width: 300px; float: left;">
                                    <div style="float: left;">
                                        <img alt="" src='<asp:Literal ID="Literal6528e0527400651" Text="<%$ Resources:Resource, Login_Id_img %>" runat="server" />'
                                            width="117" height="23" />
                                        
                                    </div>
                                    <div style="float: left;">
                                        <asp:TextBox ID="TextBox_FotgetUId" runat="server" Height="21px"></asp:TextBox></div>
                                </div>
                                
                                
                                <center>
                                <div style="float: left;width:100%;margin-top:5px;">
                                    <asp:ImageButton ID="ImageButton_FORGET" runat="server" 
                                        ImageUrl="<%$ Resources:Resource, inq_sub_en %>" 
                                        onclick="ImageButton_FORGET_Click" s  Height="31px" 
                                        Width="102px" />
                                        
                                        <bt />
                                        <asp:Label ID="Lbl_Forget_Pass" runat="server" />  
                                </div>
                 
                                </center>
                                        </asp:Panel>
                                
                            </td>
                        </tr>
                    </table>
                    
                    
                </div>
            </td>
        </tr>
        <tr>
            <td class="footer-main-cat">
                &nbsp;
            </td>
        </tr>
    </table>
    
    
    
    
</asp:Content>
