<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
	CodeBehind="FAQ.aspx.cs" Inherits="PHASCO_WEB.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="pagebanner" runat="server">
	<div class="page-banner">
		<div class="container">
			<h2>
				<asp:Label ID="Label_Title" runat="server"></asp:Label></h2>
			<ul class="page-tree rtl-text">
				<li><a href="FAQList.aspx">گروه های پرسش </a></li>
				<li><a runat="server" id="back_List">
					<asp:Label ID="Label_Title2" runat="server"></asp:Label></a></li>

			</ul>
		</div>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
	<h3>پرسش و پاسخ&nbsp; </h3>


	<asp:MultiView ID="MultiView1" runat="server">
		<asp:View ID="View1" runat="server">

			<div class="row">
				<div class="comment-form">

					<%--<div class="row">
                        <div class="col-md-6">
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <asp:Button ID="Button_Search" runat="server"
                                    Text="  جستجو   " OnClick="Button_Search_Click" />
                            </div>
                            <div class="col-md-9">

                                <asp:TextBox ID="TextBox_search" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>--%>
					<div class="alert alert-danger margin-top-5" id="alarmGrd" runat="server">
						<asp:Label ID="Label_alarm_Grd" runat="server"></asp:Label>
					</div>
				</div>
			</div>
			<div class="row margin-top-5">
				<div class="col-md-12">
					<div class="shop-widget">

						<ul class="widget-item faq article" id="faq-list">

							<asp:Repeater ID="GridView_Qu" runat="server">
								<ItemTemplate>

									<li style="display: none;">

										<h6 class="text-right">
											<%# Eval("title") %></h6>

										<p style="width: 100%;">
											<%# Eval("text") %>
										</p>
										<p>
											<i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(Eval("date").ToString())%>  </i><i class="seprator margin-left-5 margin-right-5 ">| </i><i class="fa fa-reply"></i><i class="pull-right"><%# Eval("ans_Count") %></i> <i class="seprator margin-left-5 margin-right-5">| </i><i class="fa fa-user"></i><%# Set_User(int.Parse(Eval("sender_Id").ToString()))%>
										</p>
										<span class="button-wrapper text-center">
											<%# Set_Url(Eval("text").ToString(), int.Parse(Eval("id").ToString()))%>
										</span>
									</li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
						<h4 id="faq-list-loadMore" class="text-center" style="cursor: pointer">نمایش بیشتر</h4>

						<script>

							$(document).ready(function () {
								var size_li = $("#faq-list li").size();
								var x = 20;
								$('#faq-list li:lt(' + x + ')').slideDown();
								$('#faq-list-loadMore').click(function () {
									x = (x + 20 <= size_li) ? x + 20 : size_li;
									$('#faq-list li:lt(' + x + ')').slideDown();
									if (x >= size_li)
										$('#faq-list-loadMore').hide();
								});

							});
						</script>
					</div>
				</div>
			</div>
		</asp:View>
		<asp:View ID="View2" runat="server">

			<div class="row">
				<div class="comment-form">

					<div class="row">

						<div class="col-md-12">
							<div class="alert alert-info">
								<p>
									<asp:Literal ID="Label_Qu_AnswerMode" runat="server"></asp:Literal>
								</p>

							</div>
							<asp:TextBox placeholder="عنوان پاسخ" ID="TextBox_Title" runat="server"></asp:TextBox>
							<asp:TextBox ID="TextBox_Body" runat="server" placeholder="متن پاسخ را اینجا تایپ کنید" TextMode="MultiLine"></asp:TextBox>
							<asp:Button ID="Button_sendAue" CssClass="pull-left" runat="server"
								OnClick="Button_sendAue_Click" Text="ثبت پاسخ" />
							<a visible="false" class="btn btn-default" onclick="return openLoginModal();" id="Button_register" cssclass="pull-left btn btn-default" runat="server">ابتدا وارد سایت شوید
							</a>
							<p style="padding:10px">    </p>
							<p>
								<asp:Label ID="Label_Ques_Alarm" runat="server"></asp:Label>
							</p>
						</div>
					</div>
				</div>
			</div>

			<script>

				function openLoginModal() {
					$('#membership-modal').modal('show');
				}
			</script>
		</asp:View>
		<asp:View ID="View3" runat="server">
			<div class="row">
				<div class="col-md-12">
					<div class="shop-widget">
						<h4>پرسش</h4>
						<ul class="widget-item faq article">
							<li>
								<h6 class="text-justify">
									<asp:Literal ID="Label_Text_title" runat="server"></asp:Literal>
								</h6>

								<p class="text-justify">
									<asp:Literal ID="Lable_Text" runat="server"></asp:Literal>
								</p>

								<span class="button-wrapper">
									<a runat="server" class="read-more" id="answer_Qu"><i class="fa fa-reply"></i>پاسخ به این پرسش</a>
								</span>
							</li>
						</ul>
					</div>
				</div>

				<div class="col-md-12">
					<div class="shop-widget">
						<h4>پاسخ های ارسالی برای این پرسش</h4>
						<ul class="widget-item faq article with-img">

							<asp:Repeater ID="GridView_Answer" runat="server" OnItemCommand="MyRepeater_ItemCommand">
								<ItemTemplate>

									<li>
										<%# SetUserImageView(BusinessAccessLayer.PHASCOUtility.ConverToNullableInt(Eval("sender_Id")))%>
										<h6 class="text-right">
											<%# Eval("title") %></h6>

										<p class="text-justify">
											<%# Eval("text") %>
										</p>

										<p class="pull-right">
											<i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(Eval("date").ToString())%></i>
											<i class="seprator margin-left-5 margin-right-5">| </i><i class="fa fa-star"></i><i class="pull-right"><%# Eval("Score")%></i>
											<i class="seprator margin-left-5 margin-right-5">| </i><i class="fa fa-user"></i><%# Set_User(int.Parse(Eval("sender_Id").ToString()))%>
										</p>
										<p></p>
										<span class="button-wrapper small-btn">
											<asp:LinkButton runat="server" CssClass="read-more score-color" ID="thanksLink" CommandArgument='<%# Eval("id") +";"+ Eval("sender_Id") %>'
												CommandName="thankscommand" ToolTip="از این کاربر تشکر کنید"><i class="fa fa-heart"></i><%# Eval("Thanks")%></asp:LinkButton>

											<asp:LinkButton ID="ImageButtonPlus" CssClass="read-more like-color" runat="server" CommandArgument='<%# Eval("id") +";"+ Eval("sender_Id") %>'
												CommandName="addScore" ToolTip="امتیاز دادن به این پاسخ"><i class="fa fa-thumbs-up"></i><%# Eval("ScoreUp")%></asp:LinkButton>

											<asp:LinkButton ID="ImageButtonminus" CssClass="read-more dislike-color" runat="server" CommandArgument='<%# Eval("id") +";"+ Eval("sender_Id") %>'
												CommandName="minusScore" ToolTip="کسر امتیاز از این پاسخ"><i class="fa fa-thumbs-down"></i><%# Eval("ScoreDown")%></asp:LinkButton>
										</span>
									</li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</div>
				</div>
			</div>
		</asp:View>
	</asp:MultiView>
</asp:Content>
