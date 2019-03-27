<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/admin.Master"CodeBehind="add_JobGroups.aspx.cs" Inherits="Rahbina.Job.add_JobGroups" %>

 
<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--adding new job castegory or group--%>
<fieldset dir="rtl">

<legend>افزودن گروه جديد</legend>
<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="گروه"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_job_group" runat="server" ValidationGroup="AddGroup"></asp:TextBox>
</td>
<td>
    <asp:LinkButton ID="LinkButton_add_gr" runat="server" ValidationGroup="AddGroup"
        onclick="LinkButton_add_gr_Click">به گروه مشاغل اضافه شود</asp:LinkButton>
        
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="AddGroup"
     ErrorMessage="RequiredFieldValidator" Text="گروه را مشخص كنيد " ControlToValidate="TextBox_job_group"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="گروه هاي فعلي"></asp:Label>
</td>
<td>
    <asp:DropDownList ID="DropDownList_groups" runat="server"  DataTextField="CategoryName" DataValueField="CategoryID">
    </asp:DropDownList>
</td>
</tr>
</table>
</fieldset>
<%--adding subGroup to a specific group--%>
<fieldset dir="rtl">

<legend>افزودن زير گروه جديد</legend>
<table>
<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="زير گروه"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_subGroup" runat="server" ValidationGroup="AddSubGroup"></asp:TextBox>
    <asp:Label ID="Label5" runat="server" Text="به عنوان زير گروه"></asp:Label>
</td>
<td>
 <asp:DropDownList ID="DropDownList_groups2" runat="server"  ValidationGroup="AddSubGroup"
        DataTextField="CategoryName" DataValueField="CategoryID"  AutoPostBack="true"
        onselectedindexchanged="DropDownList_groups2_SelectedIndexChanged">
    </asp:DropDownList>
</td>
<td>
    <asp:LinkButton ID="LinkButton_addSubGroup" runat="server"  
        ValidationGroup="AddSubGroup" onclick="LinkButton_addSubGroup_Click">اضافه شود</asp:LinkButton>
        
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="AddSubGroup"
     ErrorMessage="RequiredFieldValidator" Text="زير گروه را مشخص كنيد " ControlToValidate="TextBox_subGroup"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label4" runat="server" Text="زير گروه هاي فعلي"></asp:Label>
</td>
<td>
    <asp:DropDownList ID="DropDownList_subCategory"  runat="server" DataTextField="CategoryName" DataValueField="CategoryID">
    </asp:DropDownList>
</td>
</tr>
</table>
</fieldset>

<%--delete a group--%>
<br />
<br />
<fieldset dir="rtl">
<legend>حذف گروه</legend>
<table>
<tr>
<td>
   <asp:Label ID="Label6" runat="server" Text="گروه"></asp:Label>
</td>
<td>
 <asp:DropDownList ID="DropDownList_group_deleting" runat="server"  ValidationGroup="DeleteGroup"
        DataTextField="CategoryName" DataValueField="CategoryID" 
        onselectedindexchanged="DropDownList_group_deleting_SelectedIndexChanged"  >

    </asp:DropDownList>
</td>
<td>
    <asp:LinkButton ID="LinkButton_deleteGroup" runat="server"  ValidationGroup="DeleteGroup"
    OnClientClick="return confirm('آيا مطمئن هستيد؟')" 
        onclick="LinkButton_deleteGroup_Click">حذف شود</asp:LinkButton>

</td>
</tr>
</table>
</fieldset>
<%--delete a Subgroup--%>
<br />
<br />
<fieldset dir="rtl">

<legend>حذف زير گروه </legend>
<table>
<tr>
<td>
    <asp:Label ID="Label7" runat="server" Text="از گروه"></asp:Label>
</td>
<td>
 <asp:DropDownList ID="DropDownList_group3" runat="server"  ValidationGroup="DeleteSubGroup"
        DataTextField="CategoryName" DataValueField="CategoryID"  AutoPostBack="true"
        onselectedindexchanged="DropDownList_group3_SelectedIndexChanged"     >
 
    </asp:DropDownList>
</td>
<td>
    <asp:Label ID="Label8" runat="server" Text="زير گروه"></asp:Label>
</td>

<td>
  <asp:DropDownList ID="DropDownList_deleting_subGr"  runat="server" DataTextField="CategoryName" 
   ValidationGroup="DeleteSubGroup" DataValueField="CategoryID">
    </asp:DropDownList>
</td>
<td>
    <asp:LinkButton ID="LinkButton_delete_subgroup"  OnClientClick="return confirm('آيا مطمئن هستيد؟')"
        ValidationGroup="DeleteSubGroup" runat="server" 
        onclick="LinkButton_delete_subgroup_Click">حذف شود</asp:LinkButton>
</td>
</tr>

</table>
<%--editing a geroup--%>
<fieldset>
<legend>ويرايش گروه</legend>
<table>
<tr>
<td>
  <asp:Label ID="Label9" runat="server" Text="گروه"></asp:Label>
</td>
<td>
 <asp:DropDownList ID="DropDownList_editing_group" runat="server"  ValidationGroup="EditeGroup"
        DataTextField="CategoryName" DataValueField="CategoryID"  
        AutoPostBack="true" onselectedindexchanged="DropDownList_editing_group_SelectedIndexChanged"
  >

    </asp:DropDownList>
</td>
<td>
  <asp:Label ID="Label10" runat="server" Text="ّبه"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_group" runat="server"></asp:TextBox>
</td>
<td>
    <asp:LinkButton ID="LinkButton_edit_group" runat="server" 
        onclick="LinkButton_edit_group_Click">تغيير يابد</asp:LinkButton>
</td>
</tr>

</table>

</fieldset>
</fieldset>
<fieldset>
<legend>ويرايش زير گروه</legend>
<table>
<tr>
<td>
  <asp:Label ID="Label11" runat="server" Text="از گروه"></asp:Label>
</td>
<td>
 <asp:DropDownList ID="DropDownList_editing_group2" runat="server"  ValidationGroup="EditeSubGroup"
        DataTextField="CategoryName" DataValueField="CategoryID"  
        AutoPostBack="true" onselectedindexchanged="DropDownList_editing_group2_SelectedIndexChanged" 
  >

    </asp:DropDownList>
    
</td>
<td>
 <asp:Label ID="Label12" runat="server" Text="زير گروه"></asp:Label>
</td>
<td>
 <asp:DropDownList ID="DropDownList_editing_Subgroup" runat="server"  ValidationGroup="EditeSubGroup"
        DataTextField="CategoryName" DataValueField="CategoryID"  
        AutoPostBack="true" onselectedindexchanged="DropDownList_editing_Subgroup_SelectedIndexChanged" 
  ></asp:DropDownList>
</td>
<td>
  <asp:Label ID="Label13" runat="server" Text="ّبه"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_SubGroup_edit" runat="server"></asp:TextBox>
</td>
<td>
    <asp:LinkButton ID="LinkButton_edit_SubGroup" runat="server" 
        onclick="LinkButton_edit_SubGroup_Click">تغيير يابد</asp:LinkButton>
</td>

</tr>
</table>
</fieldset>

<br />
    ---------------------------------------------------------------------------------------------<br />
    <br />
    <br />
    <br />
    <br />
<br />
<fieldset>
<legend>افزودن شهرستان</legend>
<table>
<tr>
<td>
  <asp:Label ID="Label14" runat="server" Text="ّشهر"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_city" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  Text=" مشخص كنيد" ValidationGroup="state" 
     ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox_city" Display="Dynamic"></asp:RequiredFieldValidator>
</td>
<td>
  <asp:Label ID="Label15" runat="server" Text="ّبه استان"></asp:Label>
</td>
<td>
    <asp:DropDownList ID="DropDownList_state" runat="server"   
        ValidationGroup="state" onselectedindexchanged="DropDownList_state_SelectedIndexChanged"  AutoPostBack="true"
        >
    <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
    <asp:ListItem Text="آذربایجان شرقی"></asp:ListItem>
    <asp:ListItem Text="آذربایجان غربی"></asp:ListItem>
    <asp:ListItem Text="اردبیل"></asp:ListItem>
    <asp:ListItem Text="اصفهان"></asp:ListItem>
    
    <asp:ListItem Text="ایلام"></asp:ListItem>
    <asp:ListItem Text="بوشهر"></asp:ListItem>
    <asp:ListItem Text="تهران"></asp:ListItem>
    <asp:ListItem Text="چهار محال و بختیاری"></asp:ListItem>
    <asp:ListItem Text="خراسان جنوبی"></asp:ListItem>
    <asp:ListItem Text="خراسان رضوی"></asp:ListItem>
    
    <asp:ListItem Text="خراسان شمالی"></asp:ListItem>
    <asp:ListItem Text="خورستان"></asp:ListItem>
    <asp:ListItem Text="زنجان"></asp:ListItem>
    <asp:ListItem Text="سمنان"></asp:ListItem>
    <asp:ListItem Text="سیستان و بلوچستان"></asp:ListItem>
    
    <asp:ListItem Text="فارس"></asp:ListItem>
    <asp:ListItem Text="قزوین"></asp:ListItem>
    <asp:ListItem Text="قم"></asp:ListItem>
    <asp:ListItem Text="کردستان"></asp:ListItem>
    
    <asp:ListItem Text="کرمان"></asp:ListItem>
    <asp:ListItem Text="کرمانشاه"></asp:ListItem>
    <asp:ListItem Text="کهکیلویه و بویر احمد"></asp:ListItem>
    <asp:ListItem Text="گلستان"></asp:ListItem>
        
    <asp:ListItem Text="گیلان"></asp:ListItem>
    <asp:ListItem Text="لرستان"></asp:ListItem>
    <asp:ListItem Text="مازندران"></asp:ListItem>
    <asp:ListItem Text="مرکزی"></asp:ListItem>
    
        
    <asp:ListItem Text="هرمزگان"></asp:ListItem>
    <asp:ListItem Text="همدان"></asp:ListItem>
    <asp:ListItem Text="یزد"></asp:ListItem>
 
    </asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_state"  ControlToValidate="DropDownList_state"
                    Text=" مشخص كنيد" ValidationGroup="state" InitialValue="--انتخاب كنيد--" Display="Dynamic"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator> 
</td>
<td>
    <asp:LinkButton ID="LinkButton_addCity" runat="server"  ValidationGroup="state" onclick="LinkButton_addCity_Click" 
       >اضافه شود</asp:LinkButton>
</td>
</tr>
<tr>
<td>
  <asp:Label ID="Label16" runat="server" Text="ّشهرستان هاي فعلي"></asp:Label>
</td>
<td>
     <asp:DropDownList ID="DropDownList_city" runat="server"  DataTextField="city" DataValueField="id">

         
    </asp:DropDownList>
</td>
</tr>
</table>
</fieldset>
<fieldset>
<legend>ويرايش شهرستان</legend>

<table>
<tr>
<td>
<td>
  <asp:Label ID="Label17" runat="server" Text="ّاز استان"></asp:Label>
</td>
</td>
<td> 
   <asp:DropDownList ID="DropDownList_state_edit" runat="server"   
        ValidationGroup="state"  AutoPostBack="true" onselectedindexchanged="DropDownList_state_edit_SelectedIndexChanged"
        >
    <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
    <asp:ListItem Text="آذربایجان شرقی"></asp:ListItem>
    <asp:ListItem Text="آذربایجان غربی"></asp:ListItem>
    <asp:ListItem Text="اردبیل"></asp:ListItem>
    <asp:ListItem Text="اصفهان"></asp:ListItem>
    
    <asp:ListItem Text="ایلام"></asp:ListItem>
    <asp:ListItem Text="بوشهر"></asp:ListItem>
    <asp:ListItem Text="تهران"></asp:ListItem>
    <asp:ListItem Text="چهار محال و بختیاری"></asp:ListItem>
    <asp:ListItem Text="خراسان جنوبی"></asp:ListItem>
    <asp:ListItem Text="خراسان رضوی"></asp:ListItem>
    
    <asp:ListItem Text="خراسان شمالی"></asp:ListItem>
    <asp:ListItem Text="خورستان"></asp:ListItem>
    <asp:ListItem Text="زنجان"></asp:ListItem>
    <asp:ListItem Text="سمنان"></asp:ListItem>
    <asp:ListItem Text="سیستان و بلوچستان"></asp:ListItem>
    
    <asp:ListItem Text="فارس"></asp:ListItem>
    <asp:ListItem Text="قزوین"></asp:ListItem>
    <asp:ListItem Text="قم"></asp:ListItem>
    <asp:ListItem Text="کردستان"></asp:ListItem>
    
    <asp:ListItem Text="کرمان"></asp:ListItem>
    <asp:ListItem Text="کرمانشاه"></asp:ListItem>
    <asp:ListItem Text="کهکیلویه و بویر احمد"></asp:ListItem>
    <asp:ListItem Text="گلستان"></asp:ListItem>
        
    <asp:ListItem Text="گیلان"></asp:ListItem>
    <asp:ListItem Text="لرستان"></asp:ListItem>
    <asp:ListItem Text="مازندران"></asp:ListItem>
    <asp:ListItem Text="مرکزی"></asp:ListItem>
    
        
    <asp:ListItem Text="هرمزگان"></asp:ListItem>
    <asp:ListItem Text="همدان"></asp:ListItem>
    <asp:ListItem Text="یزد"></asp:ListItem>
 
    </asp:DropDownList>
</td>
<td>
  <asp:Label ID="Label18" runat="server" Text="ّشهر"></asp:Label>     
</td>
<td>
<asp:DropDownList ID="DropDownList_city_edit" runat="server"  DataTextField="city" 
        DataValueField="id"  AutoPostBack="true"
        onselectedindexchanged="DropDownList_city_edit_SelectedIndexChanged">

         
    </asp:DropDownList>
</td>
<td>
 <asp:Label ID="Label19" runat="server" Text="ّبه"></asp:Label>  
</td>
<td>
    <asp:TextBox ID="TextBox_city_edit" runat="server"></asp:TextBox>
</td>
<td>
    <asp:LinkButton ID="LinkButton_edit_city" runat="server" 
        onclick="LinkButton_edit_city_Click">تغيير يابد</asp:LinkButton>
</td>
</tr>
</table>
</fieldset>
</asp:Content>
