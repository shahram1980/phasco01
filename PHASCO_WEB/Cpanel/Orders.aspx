<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/admin.Master"
    Codebehind="Orders.aspx.cs" Inherits="phasco_webproject.Cpanel.Orders" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="JavaScript">
<!-- Begin
var checkflag = "false";
function check(field) {
if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
return "Uncheck All"; }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return "Check All"; }
}
//  End -->
    </script>

    <script language="C#" runat="server">
        public string Date_Fa(DateTime val)
        {
            string ret_ = "";
            System.Globalization.PersianCalendar pc = new System.Globalization.PersianCalendar();
            DateTime Gettime = Convert.ToDateTime(val);

            ret_ = pc.GetYear(Gettime).ToString() + "/" + pc.GetMonth(Gettime).ToString() + "/" + pc.GetDayOfMonth(Gettime).ToString();
            return ret_;
        }
        public string Set_Price(string price, string count)
        {
            string ret_ = "";
            if (price == null || price == "") ret_ = "0";
            else
            {
                Label_Total_Price.Text = Convert.ToString(Convert.ToInt32(Label_Total_Price.Text) + Convert.ToInt32(price) * Convert.ToInt32(count));
                ret_ = price.ToString();
            }

            return ret_;
        }
    </script>

    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="right" dir="rtl" style="width: 100%">
                            <asp:LinkButton ID="LinkButton_Back_To_List" runat="server" OnClick="LinkButton_Back_To_List_Click">برگشت به لیست</asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="width: 100%">
                            <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                DynamicLayout="False">
                                <progresstemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td align="center" style="width: 100%">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Cpanel/Images/loader.gif" /></td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width: 100%">
                                                سیستم در حال انجام عملیات</td>
                                        </tr>
                                    </table>
                                </progresstemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
<asp:MultiView id="MultiView1" runat="server"><asp:View id="View1" runat="server">
<TABLE style="WIDTH: 100%" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD style="WIDTH: 100%" dir=rtl align=center>
<asp:GridView id="GridView_Orders" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="90%">
                            <FooterStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="تاريخ ارسال">
                               <ItemTemplate>
                               <%# Date_Fa(Convert.ToDateTime(Eval("date_Shop")))%>
                               </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ساعت ارسال">
                                <ItemTemplate>
                                <%# Eval("time_Shop")%>
                                
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="سفارش دهنده">
                                <ItemTemplate>
                                <%# Eval("Name") %>  <%# Eval("famil") %>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="مشاهده">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton_View_Item" 
                                        CommandArgument='<%#DataBinder.Eval(Container,"DataItem.autoid","{0}") %>'
                                         runat="server" OnCommand="LinkButton_View_Item_Command">مشاهده</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                        </asp:GridView> </TD></TR></TBODY></TABLE></asp:View> <asp:View id="View2" runat="server">&nbsp;<TABLE style="WIDTH: 100%" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD style="WIDTH: 100%" align=center><TABLE style="BORDER-COLLAPSE: collapse" id="table38" borderColor=#000000 width=459 border=2><TBODY><TR><TD align=right width=447 bgColor=#000000><P dir=rtl><FONT face="Tahoma" color=#fae5b6 size=2><SPAN lang="en-us">..:: </SPAN>سفارشات<SPAN lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton id="LinkButton_Archive" onclick="LinkButton_Archive_Click" runat="server" __designer:wfdid="w38" ForeColor="White">آرشیو شود</asp:LinkButton></SPAN></FONT></P></TD></TR><TR><TD align=center width=467><DIV align=center><TABLE style="BORDER-RIGHT: #000000 1px dotted; BORDER-TOP: #000000 1px dotted; BORDER-LEFT: #000000 1px dotted; BORDER-BOTTOM: #000000 1px dotted; BORDER-COLLAPSE: collapse" dir=rtl id="table39" width="100%" border=0><TBODY><TR><TD align=right width=92 bgColor=#e0e0e0><FONT face="Tahoma" size=2>نام مرکز</FONT></TD><TD align=right bgColor=#e0e0e0>&nbsp;<asp:Label id="Label_Markaz" runat="server" __designer:wfdid="w1" Font-Size="X-Small" Font-Names="Tahoma"></asp:Label></TD></TR><TR style="FONT-SIZE: 10pt"><TD align=right width=92 bgColor=#e0e0e0><FONT face="Tahoma" size=2><SPAN style="BACKGROUND-COLOR: #e0e0e0">آدرس م</SPAN>رکز</FONT></TD><TD align=right bgColor=#e0e0e0>&nbsp;<asp:Label id="Label_Address" runat="server" __designer:wfdid="w2" Font-Size="X-Small" Font-Names="Tahoma"></asp:Label></TD></TR><TR><TD align=right width=92 bgColor=#e0e0e0><FONT face="Tahoma" size=2>تلفن مرکز</FONT></TD><TD align=right bgColor=#e0e0e0>&nbsp;<asp:Label id="Label_Tel" runat="server" __designer:wfdid="w3" Font-Size="X-Small" Font-Names="Tahoma"></asp:Label></TD></TR><TR><TD align=right width=92 bgColor=#e0e0e0><FONT face="Tahoma" size=2>تاریخ سفارش</FONT></TD><TD align=right bgColor=#e0e0e0>&nbsp;<asp:Label id="Label_Order_date" runat="server" __designer:wfdid="w4" Font-Size="X-Small" Font-Names="Tahoma"></asp:Label></TD></TR></TBODY></TABLE><TABLE style="BORDER-COLLAPSE: collapse" dir=rtl id="table40" borderColor=#000080 width="100%" border=1><TBODY><TR><TD><asp:GridView id="GridView_Order_List" runat="server" __designer:wfdid="w5" Width="100%" GridLines="Vertical" ForeColor="Black" CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="#999999" BackColor="White" AutoGenerateColumns="False">
                <FooterStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="چک">
                        <ItemTemplate>
                            <input id="chkBxMail" value=<%# Eval("AutoId") %>  runat="server" type="checkbox" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Title" HeaderText="محصول" />
                    <asp:BoundField DataField="Count_e" HeaderText="تعداد" />
                    <asp:TemplateField HeaderText="قيمت">
                        <ItemTemplate>
                            <%# Set_Price(Eval("Price_Kit").ToString(),Eval("Count_e").ToString()) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView> <TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 33%"><asp:Button id="Button_Check_Uncheck" onclick="Button_Check_Uncheck_Click" runat="server" __designer:wfdid="w6" Font-Size="X-Small" Font-Names="Tahoma" Text="انتخاب همه"></asp:Button> </TD><TD style="WIDTH: 39%" align=left>قيمت کل :</TD><TD style="WIDTH: 33%"><asp:Label id="Label_Total_Price" runat="server" __designer:wfdid="w7" Text="0"></asp:Label></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR><TR><TD style="WIDTH: 100%; HEIGHT: 13px" align=center>&nbsp;<TABLE style="BORDER-COLLAPSE: collapse" id="table1" borderColor=#000000 width="80%" border=3><TBODY><TR><TD>&nbsp;<TABLE style="WIDTH: 90%" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD style="WIDTH: 10%" vAlign=top align=right></TD><TD style="WIDTH: 90%" vAlign=top align=right></TD></TR><TR><TD style="WIDTH: 10%" vAlign=top align=right><asp:RadioButton id="RadioButton1" runat="server" __designer:wfdid="w28" GroupName="R_Group"></asp:RadioButton></TD><TD style="WIDTH: 90%" vAlign=top align=right><asp:DropDownList id="DropDownList1" runat="server" __designer:wfdid="w29" Font-Size="X-Small" Font-Names="Tahoma"><asp:ListItem>فاکتور صادر شد</asp:ListItem>
<asp:ListItem>پيش فاکتور صادر شد</asp:ListItem>
</asp:DropDownList></TD></TR><TR><TD style="WIDTH: 10%" vAlign=top align=right><asp:RadioButton id="RadioButton2" runat="server" __designer:wfdid="w32" GroupName="R_Group"></asp:RadioButton></TD><TD style="WIDTH: 90%" vAlign=top align=right><asp:DropDownList id="DropDownList2" runat="server" __designer:wfdid="w33" Font-Size="X-Small" Font-Names="Tahoma"><asp:ListItem>از طریق واحد ارسال سفارشات شرکت فاسکو</asp:ListItem>
<asp:ListItem>از طریق تحویل حضوری</asp:ListItem>
<asp:ListItem>از طریق پیک</asp:ListItem>
<asp:ListItem>از طریق شرکت تعاونی مسافربری ترمینال شرق</asp:ListItem>
<asp:ListItem>از طریق شرکت تعاونی مسافربری ترمینال غرب</asp:ListItem>
<asp:ListItem>از طریق شرکت تعاونی مسافربری ترمینال جنوب</asp:ListItem>
<asp:ListItem>از طریق شرکت تعاونی مسافربری ترمینال آرژانتین</asp:ListItem>
<asp:ListItem>از طریق تی پاکس</asp:ListItem>
<asp:ListItem>از طریق هواپیمایی</asp:ListItem>
</asp:DropDownList></TD></TR><TR><TD style="WIDTH: 10%" vAlign=top align=right><asp:RadioButton id="RadioButton3" runat="server" __designer:wfdid="w35" GroupName="R_Group"></asp:RadioButton></TD><TD style="WIDTH: 90%" vAlign=top align=right>تحويل گيرنده <asp:TextBox id="TextBox_Tahvil" runat="server" __designer:wfdid="w36" Font-Size="X-Small" Font-Names="Tahoma"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 10%; HEIGHT: 33px" vAlign=top align=right><asp:RadioButton id="RadioButton4" runat="server" __designer:wfdid="w30" GroupName="R_Group"></asp:RadioButton></TD><TD style="WIDTH: 90%; HEIGHT: 33px" vAlign=top align=right><asp:DropDownList id="DropDownList3" runat="server" __designer:wfdid="w31" Font-Size="X-Small" Font-Names="Tahoma"><asp:ListItem>حواله سفارش صادر شد</asp:ListItem>
<asp:ListItem>سفارش آماده ارسال است</asp:ListItem>
<asp:ListItem>سفارش آماده تحویل است</asp:ListItem>
</asp:DropDownList></TD></TR><TR><TD style="WIDTH: 10%" vAlign=top align=right></TD><TD style="WIDTH: 90%" vAlign=top align=right><asp:TextBox id="TextBox_4_Content" runat="server" __designer:wfdid="w34" Width="100%" Font-Size="X-Small" Font-Names="Tahoma" TextMode="MultiLine" Height="50px"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 10%; HEIGHT: 18px" vAlign=top align=right></TD><TD style="WIDTH: 90%; HEIGHT: 18px" vAlign=top align=right><asp:DropDownList id="DropDownList_M" runat="server" __designer:wfdid="w3" Font-Size="X-Small" Font-Names="Tahoma"><asp:ListItem>0</asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>13</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem>
<asp:ListItem>18</asp:ListItem>
<asp:ListItem>19</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
<asp:ListItem>21</asp:ListItem>
<asp:ListItem>22</asp:ListItem>
<asp:ListItem>23</asp:ListItem>
<asp:ListItem>24</asp:ListItem>
<asp:ListItem>25</asp:ListItem>
<asp:ListItem>26</asp:ListItem>
<asp:ListItem>27</asp:ListItem>
<asp:ListItem>28</asp:ListItem>
<asp:ListItem>29</asp:ListItem>
<asp:ListItem>30</asp:ListItem>
<asp:ListItem>31</asp:ListItem>
<asp:ListItem>32</asp:ListItem>
<asp:ListItem>33</asp:ListItem>
<asp:ListItem>34</asp:ListItem>
<asp:ListItem>35</asp:ListItem>
<asp:ListItem>36</asp:ListItem>
<asp:ListItem>37</asp:ListItem>
<asp:ListItem>38</asp:ListItem>
<asp:ListItem>39</asp:ListItem>
<asp:ListItem>40</asp:ListItem>
<asp:ListItem>41</asp:ListItem>
<asp:ListItem>42</asp:ListItem>
<asp:ListItem>43</asp:ListItem>
<asp:ListItem>44</asp:ListItem>
<asp:ListItem>45</asp:ListItem>
<asp:ListItem>46</asp:ListItem>
<asp:ListItem>47</asp:ListItem>
<asp:ListItem>48</asp:ListItem>
<asp:ListItem>49</asp:ListItem>
<asp:ListItem>50</asp:ListItem>
<asp:ListItem>51</asp:ListItem>
<asp:ListItem>52</asp:ListItem>
<asp:ListItem>53</asp:ListItem>
<asp:ListItem>54</asp:ListItem>
<asp:ListItem>55</asp:ListItem>
<asp:ListItem>56</asp:ListItem>
<asp:ListItem>57</asp:ListItem>
<asp:ListItem>58</asp:ListItem>
<asp:ListItem>59</asp:ListItem>
</asp:DropDownList>&nbsp;| <asp:DropDownList id="DropDownList_H" runat="server" __designer:wfdid="w4" Font-Size="X-Small" Font-Names="Tahoma"><asp:ListItem>0</asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>13</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem>
<asp:ListItem>18</asp:ListItem>
<asp:ListItem>19</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
<asp:ListItem>21</asp:ListItem>
<asp:ListItem>22</asp:ListItem>
<asp:ListItem>23</asp:ListItem>
</asp:DropDownList></TD></TR><TR><TD style="WIDTH: 10%" vAlign=top align=right></TD><TD style="WIDTH: 90%" vAlign=top align=right><asp:Button id="Button_Insert_Order" onclick="Button_Insert_Order_Click" runat="server" __designer:wfdid="w1" Font-Size="X-Small" Font-Names="Tahoma" Text="ثبت شود"></asp:Button></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR><TR><TD style="WIDTH: 100%; HEIGHT: 57px" align=center><asp:GridView id="GridView_Do" runat="server" __designer:wfdid="w9" Width="100%" GridLines="Vertical" ForeColor="Black" CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="#999999" BackColor="White" AutoGenerateColumns="False">
<FooterStyle BackColor="#CCCCCC"></FooterStyle>
<Columns>
<asp:BoundField DataField="Title" HeaderText="محصول"></asp:BoundField>
<asp:BoundField DataField="Now_Do" HeaderText="وضعيت"></asp:BoundField>
<asp:TemplateField HeaderText="تاريخ"><ItemTemplate>
<%# Date_Fa(Convert.ToDateTime(Eval("Date_do"))) %>
</ItemTemplate>
</asp:TemplateField>
</Columns>

<SelectedRowStyle BackColor="#000099" ForeColor="White" Font-Bold="True"></SelectedRowStyle>

<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center"></PagerStyle>

<HeaderStyle BackColor="Black" ForeColor="White" Font-Bold="True"></HeaderStyle>

<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
</asp:GridView></TD></TR><TR><TD style="WIDTH: 100%; HEIGHT: 13px" align=center></TD></TR></TBODY></TABLE></asp:View> </asp:MultiView> <asp:HiddenField id="HiddenField_Visit_Id" runat="server" __designer:dtid="562971428257805" __designer:wfdid="w41"></asp:HiddenField><asp:HiddenField id="HiddenField_Time" runat="server" __designer:dtid="562971428257806" __designer:wfdid="w42"></asp:HiddenField><asp:HiddenField id="HiddenField_Date" runat="server" __designer:dtid="562971428257807" __designer:wfdid="w43"></asp:HiddenField> <asp:HiddenField id="HiddenField_Uid" runat="server" __designer:wfdid="w8"></asp:HiddenField> 
</contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
            </td>
        </tr>
    </table>
    &nbsp;
</asp:Content>
