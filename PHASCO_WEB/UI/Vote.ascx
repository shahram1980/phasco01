<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Vote.ascx.cs" Inherits="phasco_webproject.UI.Vote" %>
<script language="C#" runat="server">
    int Counter;
    public string Active_Check(Double val) 
    {
        string ret_ = "";
        Double e = 0;
        Double tov = Convert.ToDouble(total_vote.Value);

        e = val / tov * 100;
        ret_ = Math.Round(e,1).ToString();
        return ret_;
    }
    public string counter_()
    {
        string ret_ = "";
        Counter = Counter + 1;
        ret_ = Counter.ToString();
        return ret_;
    }
    
</script>
 <table border="0" cellpadding="0" cellspacing="0" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" runat="server"/>' style="width: 100%">
    <tr>
        <td style="width: 100%">
 
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
    <table border="0" style="width: 100%">
        <tr>
            <td width="100%">
                <asp:Label ID="Lbl_Alarm"  runat="server" Font-Overline="True"></asp:Label></td>
        </tr> 
        <tr>
            <td width="100%">
                <asp:Label ID="Lbl_Question" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server"/>' dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" runat="server"/>' width="100%">
                <asp:RadioButtonList ID="RadioButtonList_Item" runat="server">
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server"/>'
                dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" runat="server"/>' width="100%">
                <asp:LinkButton ID="LinkButton_View_Result" Text="<%$ Resources:Resource, Vote_Result %>" runat="server" OnClick="LinkButton_View_Result_Click"></asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" dir="ltr">
                <asp:Button ID="Button_INs" runat="server" OnClick="Button_INs_Click" Text="<%$ Resources:Resource, Reg_Form_Submit %>" Font-Names="Tahoma" Font-Size="XX-Small" /></td>
        </tr>
    </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table border="0" background="white"  style="width: 100%">


             <asp:HiddenField ID="total_vote" runat="server" />
                          <asp:HiddenField ID="total_item" runat="server" />
        <asp:Repeater ID="Repeater_Vote" runat="server">
 <ItemTemplate>
 
          <tr>
                <td height="10" width="10%">
                 <b><%# counter_()%></b>:
                </td>
                <td height="10" width="90%" align="<asp:Literal ID='aling001' Text='<%$ Resources:Resource, align %>' runat='server' />" >
                     <img src="../images/vote.jpg" width="<%# Active_Check(Convert.ToInt32(Eval("vote")))%>%" height="10"/><%# Active_Check(Convert.ToDouble(Eval("vote")))%>%
                </td>
          </tr>
 </ItemTemplate>
        </asp:Repeater>
<tr><td>
    <asp:LinkButton ID="LinkButton_Back_Vote" runat="server" OnClick="LinkButton_Back_Vote_Click"
        Text="<%$ Resources:Resource, Vote_Back %>"></asp:LinkButton></td></tr>
             </table>      </asp:View>
</asp:MultiView></td>
    </tr>
</table>
 