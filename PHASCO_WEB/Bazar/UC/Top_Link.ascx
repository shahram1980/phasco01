<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top_Link.ascx.cs" Inherits="BiztBiz.UC.Top_Link" %>

<div dir='<asp:Literal ID="Literal1" Text="<%$ Resources:Resource, dir %>" runat="server" />'>

 
<asp:Image ID="Image2" ImageUrl="~/images/b-1-top.jpg" runat="server" />
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" Text="<%$ Resources:Resource, Home %>"></asp:HyperLink>
&nbsp;&nbsp;
<asp:Image ID="Image1" ImageUrl="~/images/b-3-top.jpg" runat="server" />
<asp:HyperLink ID="HyperLink_Sign_in" runat="server" NavigateUrl="~/Login.aspx" Text="<%$ Resources:Resource, Sign_In %>"></asp:HyperLink>
&nbsp;&nbsp;
<asp:Image ID="Image100" ImageUrl="~/images/b2-top.jpg" runat="server" />
<asp:HyperLink ID="HyperLink_Hoin_Now" runat="server" NavigateUrl="~/register.aspx"
    Text="<%$ Resources:Resource, Join_Now %>"></asp:HyperLink>
&nbsp;&nbsp; </div>