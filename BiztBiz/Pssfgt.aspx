<%@ Page Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Pssfgt.aspx.cs" Inherits="BiztBiz.Pssfgt" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <center>
        <table style="width: 600px" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div id="divMessage" runat="server" style="width: 500px; height: 30px; padding: 7px;
                        margin: 100px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
