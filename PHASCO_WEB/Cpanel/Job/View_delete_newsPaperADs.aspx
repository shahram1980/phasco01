<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="View_delete_newsPaperADs.aspx.cs" Inherits="Rahbina.Administrator.Job.View_delete_newsPaperADs" %>
 

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
          <asp:GridView ID="GridView_NewsPaperAds" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="عنوان آگهي" DataField="AdTopic" />
       <asp:BoundField HeaderText="توضيحات " DataField="explenation" />
     
      <asp:TemplateField HeaderText="مهلت تماس">
      <ItemTemplate>
          <asp:Label ID="Label_TimeOutCall" runat="server" Text='<%#GetfarsiDate(Eval("TimeOutCall")) %>'></asp:Label>
      </ItemTemplate>
      </asp:TemplateField>
            <asp:BoundField HeaderText="روزنامه" DataField="newsPaperNmae" />
                  <asp:TemplateField HeaderText="مهلت تماس">
                      <ItemTemplate>
                          <asp:Label ID="Label_newsPaperDate" runat="server" Text='<%#GetfarsiDate(Eval("newsPaperDate")) %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
         
                 <asp:BoundField HeaderText="شماره روزنامه " DataField="number" />  
                 
                  <asp:TemplateField HeaderText="گزينه ها">
                  <ItemTemplate>
                      <asp:Label ID="Label_options" runat="server" Text='<%#Set_OptionsUrl(Eval("id")) %>'></asp:Label>
                  </ItemTemplate>
                  </asp:TemplateField>
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>
        
        <%--reporting--%>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label_report" runat="server" Text=""></asp:Label>
            <asp:HyperLink ID="HyperLink_return" runat="server"></asp:HyperLink>
        </asp:View>
        
    
    </asp:MultiView>

</asp:Content>

