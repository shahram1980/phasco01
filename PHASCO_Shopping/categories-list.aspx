<%@ Page Language="C#"   MasterPageFile="~/Template/Biztbiz.Master"   AutoEventWireup="true" CodeBehind="categories-list.aspx.cs" Inherits="PHASCO_Shopping.categories_list" %>


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
                    <uc1:LeftCat ID="LeftCat1" runat="server" />
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
                                    <table style="width: 300px; margin: 5px; border: 1px solid #E2E2E2;">
                                        <tr>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 123px">
                                                            <a href='C-p/Productdetails.aspx?pid=<%#Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%#Eval("Produc_Name")%>'>
                                                                <img width="70" src='<%# Set_Image(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%>'
                                                                    style="padding: 5px; border: 1px #CCCCCC solid; margin: 5px" />
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <div style="padding: 5px; margin: 2px; border: 1px #e2e2e2 solid; height: 40px; width: 80%;
                                                                color: gray; font-family: Arial, Helvetica, sans-serif; float: left">
                                                                <a href='C-p/Productdetails.aspx?pid=<%#Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%#Eval("Produc_Name")%>'>
                                                                    <%#Eval("Produc_Name")%>
                                                                </a>
                                                            </div>
                                                            <div style="padding: 7px 0 0 0; margin: 2px; text-align: center; height: 31px; width: 102px;
                                                                font-size: 11px; color: white; font-family: Tahoma; float: left; background: transparent url('images/inq-b.jpg') no-repeat scroll center top;">
                                                                <a href='inquiry.aspx?pid=<%#Eval("id")%>' title='<%#Eval("Produc_Name")%>'>
                                                                    <asp:Literal ID="Literal1" Text="<%$ Resources:Resource, inquire_Now %>" runat="server" />
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <div style="background-color: #EBEBEB; padding: 5px; margin: 2px; border: 1px #e2e2e2 solid;
                                                                height: 100px; width: 250px; float: left; color: #666666; font-size: 12px; overflow: auto">
                                                                <%#Eval("Description")%>
                                                            </div>
                                                            <div style="background-color: #EBEBEB; border: 1px #e2e2e2 solid; height: 2px; width: 260px;
                                                                margin: 0px 0px 0px 2px; float: left">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
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
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
