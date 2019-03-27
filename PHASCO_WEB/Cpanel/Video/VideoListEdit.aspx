<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/admin.Master"
    CodeBehind="VideoListEdit.aspx.cs" Inherits="NewFifa.Admin.VideoManage.VideoListEdit" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
<!--
        function popitup(url) {
            newwindow = window.open(url, 'name', 'height=280,width=490');
            if (window.focus) { newwindow.focus() }
            return false;
        }

// -->
    </script>
 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table cellpadding="2" class="style3" dir="rtl">
        <tr>
            <td>
                &nbsp;&nbsp; ا<a href="formdatavideo.aspx">ضافه کردن ویدیو جدید</a>&nbsp;&nbsp;&nbsp; 
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="VideoListEdit.aspx">لیست ویدیوها&nbsp;</a>
                
                       |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="VideoListEdit.aspx?Status=New">لیست ویدیوها ارسال کاربران&nbsp;</a>
                </td>
        </tr>
    </table>
    <table class="style1" dir="rtl">
        <tr>
            <td>
                <asp:Repeater ID="Repeater_CAT" runat="server">
                    <ItemTemplate>
                        <a href="VideoListEdit.aspx?CATID=<%#Eval("ID") %>" title="  <%#Eval("Categorie_Name")%> ">
                            <%#Eval("Categorie_Name")%>
                            (<%#Eval("VideoCount")%>) </a>&nbsp;| &nbsp;
                    </ItemTemplate>
                </asp:Repeater>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
   <asp:DataList ID="DataList_Video" runat="server" RepeatColumns="5" EnableTheming="false">
                    <ItemTemplate>
                    <div style="border:1px solid #000">
                        <table class="style1">
                            <tr>
                                <td style="text-align:center;vertical-align:top">
                                     <a href="#" onclick="javascript:popitup('VideoPlayer.aspx?filename=<%# Eval("VideoFilename")%>&img=<%# Eval("VideoPhotoname")%>&f=<%# Eval("VideoName")%>');">
                                      <img src='/phascoupfile/Video/thumbnail/Small/<%# Eval("VideoPhotoname")%>' width="150" /> 
                                       </a> 
                                       
                                       </td>
                               
                            </tr>
                                <tr>
                                   <td style="text-align:center;vertical-align:top">
                                    <%# Eval("VideoName")%>
                                         <br> 
                                           <%# Eval("VideoDescription")%>
                                         <br> 
                                                <%# Eval("VideoTag")%>
                                         <br> 
                                           وضعیت : 
                                           
                                          <%# SetStatus(Eval("Status").ToString())%>
                                           <br> 
                                           <asp:LinkButton runat="server" CommandArgument='<%#Eval("VideoID") %>'   OnCommand="btnEdit_Command">
                                          ویرایش
                                          </asp:LinkButton>
                                            | 
                                          <asp:LinkButton runat="server" CommandArgument='<%#Eval("VideoID") %>' OnCommand="btndelete_Command">
                                          حذف
                                          </asp:LinkButton>
                                         </td>
                               
                            </tr>
                        </table></div>
                    </ItemTemplate>
                </asp:DataList>
 
            </td>
        </tr>
    </table>
</asp:Content>
 
