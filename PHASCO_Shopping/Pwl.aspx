<%@ Page Language="C#"  MasterPageFile="~/Template/PHASCO_Shopping.Master"  AutoEventWireup="true" CodeBehind="Pwl.aspx.cs" Inherits="PHASCO_Shopping.Pwl1" %>

 <%@ Register Src="UC/LeftCat.ascx" TagName="LeftCat" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
 
        public string Set_Image(int image, string image_Name)
        {
            if (image == 1) return "MyPHASCO_Shopping/Pupload/sm_" + image_Name;
            else if (image == 0) return "MyPHASCO_Shopping/Pupload/None/NONE.jpg";
            return "MyPHASCO_Shopping/Pupload/None/NONE.jpg";
        }
    </script>
    <div class="direction">
    </div>
    <div class="direction">
        <table style="width: 900px;">
            <tr>
                <td style="width: 240; vertical-align: top;">
                    &nbsp;
                </td>
                <td style="width: 660; vertical-align: top;">
                    <asp:ListView ID="ListView1" runat="server" GroupItemCount="2">
                        <LayoutTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0">
                                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <GroupTemplate>
                            <tr>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <td style="vertical-align: top;">
                                <center>
                                    <div width="300px" style="border: 2px #C0C0C0 solid;" onmouseover="this.style.borderColor='red'"
                                        onmouseout="this.style.borderColor='#C0C0C0'">
                                        <table border="0" height="170" width="300px" id="table2" style="border-collapse: collapse;">
                                            <tr>
                                                <td class="td_register">
                                                    <a href='C-p/Productdetails.aspx?pid=<%#Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%#Eval("Produc_Name")%>'>
                                                        <img width="70" src='<%# Set_Image(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%>' />
                                                    </a>
                                                </td>
                                                <td class="td_register_de">
                                                    <a href='C-p/Productdetails.aspx?pid=<%#Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%#Eval("Produc_Name")%>'>
                                                        <%#Eval("Produc_Name")%>
                                                    </a>
                                                    <br />
                                                    <br />
                                                    <a href='inquiry.aspx?pid=<%#Eval("id")%>' title='<%#Eval("Produc_Name")%>'>
                                                        <asp:Literal ID="Literal1" Text="<%$ Resources:Resource, inquire_Now %>" runat="server" />
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_register_de" colspan="2">
                                                    <%#Eval("Description")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </center>
                            </td>
                        </ItemTemplate>
                    </asp:ListView>
                    <center>
                        <table style="width: 40%">
                            <tr>
                                <td class="td_register">
                                    Page :
                                </td>
                                <td class="td_register_de">
                                    <asp:DataPager runat="server" ID="DataPager1" PagedControlID="ListView1" PageSize="26"
                                        QueryStringField="paging">
                                        <Fields>
                                            <asp:NumericPagerField PreviousPageText="&lt; Prev" NextPageText="Next &gt;" ButtonCount="10"
                                                NextPreviousButtonCssClass="PrevNext" CurrentPageLabelCssClass="CurrentPage"
                                                NumericButtonCssClass="PageNumber" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </center>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>