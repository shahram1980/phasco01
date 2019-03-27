<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true" CodeBehind="employment.aspx.cs" Inherits="Rahbina.Job.employment" %>

<asp:Content ContentPlaceHolderID="head_Meta" ID="content1" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" ID="content3" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptMnager1"></asp:ScriptManager>
 
    <div class="shop-widget">
   <h4>درج ظرفیت شغلی</h4>
    <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
    <br />
   
<table class="table no-border table-responsive text-center text-right rtl-text form-group margin-top-10">
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">زمينه فعاليت </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_job_title" runat="server" 
            AppendDataBoundItems="true" AutoPostBack="true" DataTextField="CategoryName" 
            DataValueField="CategoryID" 
            OnSelectedIndexChanged="DropDownList_job_title_SelectedIndexChanged">
            <asp:ListItem Text="--انتخاب كنيد--" Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_job_title" 
            runat="server" ControlToValidate="DropDownList_job_title" 
            ErrorMessage="RequiredFieldValidator" Text="لطفا يك مورد را انتخاب كنيد" 
            ValidationGroup="company"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">زمينه تخصصي </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_specialty" runat="server" 
            DataTextField="CategoryName" DataValueField="CategoryID">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_specialty" 
            runat="server" ControlToValidate="DropDownList_specialty" 
            ErrorMessage="RequiredFieldValidator" Text="لطفا يك مورد را انتخاب كنيد" 
            ValidationGroup="company"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">نام&nbsp; محل کار </td>
    <td align="right" dir="rtl">
        <asp:TextBox ID="TextBox_coname" runat="server" MaxLength="48"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_coname" runat="server" 
            ControlToValidate="TextBox_coname" ErrorMessage="RequiredFieldValidator" 
            Text="نام موسسه را مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">مهلت تماس تا </td>
    <td align="right" dir="rtl">
        <asp:TextBox ID="TextBox_call_timeOut" runat="server"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">آدرس&nbsp; محل کار</td>
    <td align="right" dir="rtl">
        <asp:TextBox ID="TextBox_address" runat="server" Columns="40"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">استان محل كار </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_state" runat="server" AutoPostBack="True" 
            Font-Names="Tahoma" Font-Size="X-Small" 
            OnSelectedIndexChanged="DropDownList_state_SelectedIndexChanged">
            <asp:ListItem Value="0">انتخاب استان</asp:ListItem>
            <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
            <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
            <asp:ListItem Value="31">البرز</asp:ListItem>
            <asp:ListItem Value="3">اردبیل</asp:ListItem>
            <asp:ListItem Value="4">اصفهان</asp:ListItem>
            <asp:ListItem Value="5">ایلام</asp:ListItem>
            <asp:ListItem Value="6">بوشهر</asp:ListItem>
            <asp:ListItem Value="7">تهران</asp:ListItem>
            <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
            <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
            <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
            <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
            <asp:ListItem Value="12">خورستان</asp:ListItem>
            <asp:ListItem Value="13">زنجان</asp:ListItem>
            <asp:ListItem Value="14">سمنان</asp:ListItem>
            <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
            <asp:ListItem Value="16">فارس</asp:ListItem>
            <asp:ListItem Value="17">قزوین</asp:ListItem>
            <asp:ListItem Value="18">قم</asp:ListItem>
            <asp:ListItem Value="19">کردستان</asp:ListItem>
            <asp:ListItem Value="20">کرمان</asp:ListItem>
            <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
            <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
            <asp:ListItem Value="23">گلستان</asp:ListItem>
            <asp:ListItem Value="24">گیلان</asp:ListItem>
            <asp:ListItem Value="25">لرستان</asp:ListItem>
            <asp:ListItem Value="26">مازندران</asp:ListItem>
            <asp:ListItem Value="27">مرکزی</asp:ListItem>
            <asp:ListItem Value="28">هرمزگان</asp:ListItem>
            <asp:ListItem Value="29">همدان</asp:ListItem>
            <asp:ListItem Value="30">یزد</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_state" runat="server" 
            ControlToValidate="DropDownList_state" ErrorMessage="RequiredFieldValidator" 
            InitialValue="--انتخاب كنيد--" Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">شهر محل كار </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_city" runat="server" DataTextField="Satate" 
            DataValueField="id">
            <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="DropDownList_city" ErrorMessage="RequiredFieldValidator" 
            InitialValue="--انتخاب كنيد--" Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">مقطع تحصيلي </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_education_step" runat="server">
            <asp:ListItem Text="مهم نيست"></asp:ListItem>
            <asp:ListItem Text="زير ديپلم"></asp:ListItem>
            <asp:ListItem Text="ديپلم"></asp:ListItem>
            <asp:ListItem Text="فوق ديپلم"></asp:ListItem>
            <asp:ListItem Text="ليسانس"></asp:ListItem>
            <asp:ListItem Text="فوق ليسانس"></asp:ListItem>
            <asp:ListItem Text="دكترا"></asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">سابقه کار /&nbsp; سال</td>
    <td align="right" dir="rtl">
        <asp:TextBox ID="TextBox_experience" runat="server" Columns="2" MaxLength="2"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="TextBox_experience" ErrorMessage="CompareValidator" 
            Operator="DataTypeCheck" Text="فقط عدد وارد كنيد" Type="Double" 
            ValidationGroup="company"></asp:CompareValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">جنسيت </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_gender" runat="server">
            <asp:ListItem Text="مهم نيست"></asp:ListItem>
            <asp:ListItem Text="مرد"></asp:ListItem>
            <asp:ListItem Text="زن"></asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">وضعيت تاهل </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_marriage" runat="server">
            <asp:ListItem Text="مهم نيست"></asp:ListItem>
            <asp:ListItem Text="مجرد"></asp:ListItem>
            <asp:ListItem Text="متاهل"></asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">نظام وظیفه </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_service" runat="server">
            <asp:ListItem Text="مهم نيست"></asp:ListItem>
            <asp:ListItem Text="پايان خدمت"></asp:ListItem>
            <asp:ListItem Text="معافيت غير پزشكي"></asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">حداقل و حداكثر سن </td>
    <td align="right" dir="rtl">
        <asp:DropDownList ID="DropDownList_age" runat="server">
            <asp:ListItem Text="مهم نيست"></asp:ListItem>
            <asp:ListItem Text="بين 20 تا 30 سال"></asp:ListItem>
            <asp:ListItem Text="بين 30 تا 40 سال "></asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">تلفن هاي تماس </td>
    <td align="right" dir="rtl">
        <asp:TextBox ID="TextBox_phone" runat="server" Columns="40"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" 
            ControlToValidate="TextBox_phone" ErrorMessage="CompareValidator" 
            Operator="DataTypeCheck" Text="فقط عدد وارد كنيد" Type="Double" 
            ValidationGroup="company"></asp:CompareValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl" valign="top">توضيحات </td>
    <td align="right" dir="rtl">
        <asp:TextBox ID="TextBox_explenation" runat="server" Columns="32" Rows="5" 
            TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TextBox_explenation" ErrorMessage="RequiredFieldValidator" 
            Text="مشخص كنيد"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td align="left" class="style_Eplm_19" dir="rtl">&nbsp;</td>
    <td align="right" dir="rtl">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_insert_employment_ad" runat="server" 
            OnClick="Button_insert_employment_ad_Click" Text="درج آگهي" 
            ValidationGroup="company" />
      </td>
  </tr>
</table>
            <%--job title--%>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label4" runat="server" Text="آگهي شما با موفقيت درج شد"></asp:Label>
            <a href="employer.aspx">ادامه </a>
        </asp:View>
    </asp:MultiView>
    </div>
</asp:Content>
