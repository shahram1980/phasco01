<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="FAQList.aspx.cs" Inherits="PHASCO_WEB.FAQList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

    <h3>پرسش و پاسخ </h3>

    <div class="">

        <p class="alert alert-success " style="direction:rtl;">

            <strong>کاربر گرامی   !</strong>
            برای طرح پرسش ، اول گروه پرسش را انتخاب  و سپس کادر موضوع و متن پریش را تایپ کنید.
        </p>
    </div>
    <div class="">
        <div class="comment-form">


            <div class="row">

                <div class="col-md-4 col-xs-12 pull-left">
             
                </div>
                <div class="col-md-8  col-xs-12 pull-right">
					       <asp:DropDownList ID="DropDownList_Group" runat="server">
                    </asp:DropDownList>
                    <asp:TextBox ID="TextBox_Title" placeholder="موضوع پرسش" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox_Body" runat="server"
                        TextMode="MultiLine" placeholder="متن پرسش را اینجا تایپ کنید"></asp:TextBox>
                    <asp:Button ID="Button_sendAue" CssClass="pull-left" runat="server"
                        OnClick="Button_sendAue_Click" Text="ثبت پرسش" />
                    <h4>
                        <a class="btn btn-default" onclick="return openLoginModal();" id="Button_register" cssclass="pull-left btn btn-default" runat="server">ابتدا وارد سایت شوید
                        </a>

                    </h4>
                    <script>

                        function openLoginModal() {
                            $('#membership-modal').modal('show');


                        }
                    </script>
                    <%-- <asp:Button ID="Button_register" CssClass="pull-left" runat="server"
                         OnClientClick="return openLoginModal();" Text="لطفا ابتدا لاگین کنید" />--%>
                    <p>
                        <asp:Label ID="Label_Ques_Alarm" runat="server"></asp:Label>
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div class="row margin-top-5">
        <div class="col-md-4">

            <div class="shop-widget">
                <h4>موضوعات</h4>
                <ul class="widget-item">

                    <asp:Repeater ID="DataList_Qu_List" runat="server">
                        <ItemTemplate>
                            <li>
                                <h6>
                                    <i class="fa fa-question-circle margin-left-5"></i>
                                    <a href="faq.aspx?subid=<%# Eval("id") %>" title="<%# Eval("title")%>"><%# Eval("title")%>  (<%# Eval("count")%>)</a>
                                </h6>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <div class="shop-widget">
                <h4>جدید ترین پرسش ها</h4>
                <ul class="widget-item faq article">

                    <asp:Repeater ID="GridView_Top10Qu" runat="server">
                        <ItemTemplate>

                            <li>
                                <a href="faq.aspx?subid=<%# Eval("ans_Id") %>&mode=quview&id=<%# Eval("id") %>">
                                    <h6 class="text-right">
                                        <%# Eval("title") %></h6>
                                </a>


                                <p style="width: 100%;" class="text-justify">
                                    <%# Eval("text") %>
                                </p>

                                <p>
                                    <i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(Eval("date").ToString())%>   </i><i class="seprator margin-left-5 margin-right-5 pull-right">| </i><i class="fa fa-reply"></i><i class="pull-right"><%# Eval("ans_Count") %> </i><i class="seprator margin-left-5 margin-right-5 pull-right">| </i><i class="fa fa-user"></i><i class="pull-right"><%# Set_User(int.Parse(Eval("sender_Id").ToString()))%></i>
                                </p>

                                <span class="button-wrapper text-center">
                                    <%# Set_Url(Eval("text").ToString(), int.Parse(Eval("id").ToString()), Eval("ans_Id").ToString())%>
                                </span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
