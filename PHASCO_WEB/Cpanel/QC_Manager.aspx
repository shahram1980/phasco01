<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="QC_Manager.aspx.cs" Inherits="PHASCO_WEB.Cpanel.QC_Manager" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
   
            در حال بارگزاری ...........
        </ProgressTemplate>
    </asp:UpdateProgress>
 <asp:UpdatePanel 
        ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style3" dir="rtl">
        <tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
                برند :
                <asp:TextBox ID="TextBox_Brand" runat="server"></asp:TextBox>
                <asp:Button ID="Button_Brand" runat="server" Text=" ثبت شود  " 
                    onclick="Button_Brand_Click" />
                <asp:Button ID="Button_Edit_Barnd" runat="server" 
                    onclick="Button_Edit_Barnd_Click" Text="ویرایش شود" Visible="False" />
                <asp:HiddenField ID="HiddenField_Brand_ID" runat="server" />
            </td>
            <td style="width:50%;vertical-align:top;text-align:right;">
                <table class="style3" dir="rtl">
                    <tr>
                        <td style="width:20%;vertical-align:top;text-align:right;">
                            نام محصول :</td>
                      <td style="width:80%;vertical-align:top;text-align:right;">
                <asp:TextBox ID="TextBox_ProductName" runat="server"></asp:TextBox>
                          <asp:Label ID="Label_BarandName" runat="server" Font-Bold="True" 
                              Font-Size="Small" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                     <td style="width:20%;vertical-align:top;text-align:right;">
                            نوع تست :</td>
                        <td style="width:80%;vertical-align:top;text-align:right;">
                <asp:HiddenField ID="HiddenField_Product_ID" runat="server" />
                            <asp:RadioButtonList ID="RadioButtonList_TestStatus" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Quantitative Test</asp:ListItem>
                                <asp:ListItem Value="2">Qualitative Test</asp:ListItem>
                                <asp:ListItem Value="3">QC Controls</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                     <td style="width:20%;vertical-align:top;text-align:right;">
                            &nbsp;</td>
                        <td style="width:80%;vertical-align:top;text-align:right;">
                <asp:Button ID="Button_Product" runat="server" Text=" ثبت شود  " 
                                onclick="Button_Product_Click" style="height: 29px" />
                <asp:Button ID="Button_Edit_Product" runat="server" 
                    onclick="Button_Edit_Product_Click" Text="ویرایش شود" Visible="False" />
                        </td>
                    </tr>
                </table>
            </td></tr>
                        <tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
                <asp:GridView ID="GridView_Brand" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_Brand" EnableModelValidation="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Brand" />
                        <asp:TemplateField>
                        <ItemTemplate>
                        
                        [    <asp:LinkButton ID="LinkButton_Brand_Edit" runat="server" ForeColor="#339933" OnCommand="LinkButton_Brand_Edit_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'>ویرایش</asp:LinkButton>
                            ][
                              <asp:LinkButton ID="LinkButton_Brand_SubList"  OnCommand="LinkButton_Brand_SubList_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' runat="server">زیرگروه</asp:LinkButton>
                         ][
                                <asp:LinkButton ID="LinkButton_Brand_Delete" runat="server" 
                                ForeColor="#993333" OnCommand="LinkButton_Brand_Delete_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'>حذف</asp:LinkButton>]
                        
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                            </td>
            <td style="width:50%;vertical-align:top;text-align:right;">
                <asp:GridView ID="GridView_Product" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="ProductName" />
                        <asp:TemplateField>
                        <ItemTemplate>
                        
                        <%# SetstatusMode(Eval("TestStatus").ToString())%>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                        <ItemTemplate>
                        
                        [    <asp:LinkButton ID="LinkButton_Product_EDIT" runat="server" ForeColor="#339933"
                        OnCommand="LinkButton_Product_EDIT_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                        Enabled="false" >ویرایش</asp:LinkButton>
                            ][
                              <asp:LinkButton ID="LinkButton_Product_standard"  OnCommand="LinkButton_Product_standard_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                runat="server">Lot/Expire</asp:LinkButton>
                         ][
                                <asp:LinkButton ID="LinkButton_Product_Delete" runat="server" 
                                ForeColor="#993333" OnCommand="LinkButton_Product_Delete_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' >حذف</asp:LinkButton>]
                        
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                            </td></tr>
        <tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
                <asp:SqlDataSource ID="SqlDataSource_Brand" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:phasco.Properties.Settings.Phasco_NetConnectionString %>" 
                    SelectCommand="SELECT [Brand], [id] FROM [TBL_QC_BRANDS] ORDER BY [Brand]">
                </asp:SqlDataSource>
            </td>
            <td style="width:50%;vertical-align:top;text-align:right;">
                <asp:HiddenField ID="HiddenField_BrandID" runat="server" />
            </td></tr>        <tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
            <td style="width:50%;vertical-align:top;text-align:right;">
                &nbsp;<tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
                &nbsp;<td style="width:50%;vertical-align:top;text-align:right;">
                &nbsp;</td>
        <tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
                &nbsp;<td style="width:50%;vertical-align:top;text-align:right;">
                &nbsp;<tr>
            <td style="vertical-align:top;text-align:right;" colspan="2">
                <asp:Panel ID="Panel_LotExpr" runat="server" Visible="false" 
                    BackColor="#999999" Font-Bold="False">
                    <table class="style3">
                        <tr>
                                <td style="width:50%;vertical-align:top;text-align:right;">
                                    <table class="style3" dir="ltr">
                                        <tr>
                                            <td style="width:20%;vertical-align:top;text-align:right;">
                                                &nbsp;</td>
                                            <td style="width:80%;vertical-align:top;text-align:right;">
                                                <asp:Label ID="Label_LotExpt_Valid" runat="server" 
                                                    Text="این کد و تاریخ قبلا ثبت شده است" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:20%;vertical-align:top;text-align:right;">
                                                Lot NO</td>
                                            <td style="width:80%;vertical-align:top;text-align:left;">
                                                <asp:TextBox ID="TextBox_LotNO" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:20%;vertical-align:top;text-align:right;">
                                                Exr Date</td>
                                            <td style="width:80%;vertical-align:top;text-align:left;">
                                                <asp:TextBox ID="TextBox_Expire" runat="server" Enabled="False"></asp:TextBox>
                                                <asp:Calendar ID="Calendar_ExprDate" runat="server" 
                                                    onselectionchanged="Calendar_ExprDate_SelectionChanged"></asp:Calendar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:20%;vertical-align:top;text-align:right;">
                                                &nbsp;</td>
                                            <td style="width:80%;vertical-align:top;text-align:right;">
                                                <asp:HiddenField ID="HiddenField_Product_ID_ForLotExrDateInsert" 
                                                    runat="server" />
                                                <asp:HiddenField ID="HiddenField_Product_TestStatus" runat="server" />
                                                <br />
                                                <asp:HiddenField ID="HiddenField_LotExprEditID" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:20%;vertical-align:top;text-align:right;">
                                                &nbsp;</td>
                                            <td style="width:80%;vertical-align:top;text-align:left;">
                                                <asp:Button ID="Button_ExpireLot_Insert" runat="server" 
                                                    onclick="Button_ExpireLot_Insert_Click" style="height: 29px" 
                                                    Text=" ثبت شود  " />
                                                <asp:Button ID="Button_Edit_LotExpr" runat="server" 
                                                    onclick="Button_Edit_LotExpr_Click" Text="ویرایش شود" Visible="False" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            <td style="width:50%;vertical-align:top;text-align:right;direction:ltr;">
                                <asp:GridView ID="GridView_LOTEXPR" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                                    GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                [
                                                <asp:LinkButton ID="LinkButton_LotExp_Edit" runat="server" 
                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                   ForeColor="#339933" OnCommand="LinkButton_LotExp_Edit_Command">ویرایش</asp:LinkButton>
                                                ][
                                                <asp:LinkButton ID="LinkButton_LotExp_Standard" runat="server" 
                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                    OnCommand="LinkButton_LotExp_Edit_Standard">استانداردها</asp:LinkButton>
                                                ][
                                                <asp:LinkButton ID="LinkButton_LotExp_Delete" runat="server" 
                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                    ForeColor="#993333" OnCommand="LinkButton_LotExp_Delete_Command">حذف</asp:LinkButton>
                                                ]
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Expire" HeaderText="Expire" />
                                        <asp:BoundField DataField="LotNO" HeaderText="Lot No." />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
        <tr>
            <td style="vertical-align:top;text-align:right;" colspan="2">
                &nbsp;<tr>
            <td style="vertical-align:top;text-align:right;" colspan="2">
                <asp:Panel ID="Panel_Quantitative" runat="server" Visible="False" 
                    BackColor="#666666">
                    <table class="style3" dir="rtl">
                        <tr>
                            <td style="width:50%;vertical-align:top;text-align:right">
                                <table class="style3" dir="ltr">
                    <tr>
                        <td style="width:27%; vertical-align:top;text-align:right;">
                            Standards</td>
                      <td style="width:80%;vertical-align:top;text-align:left">
                          <asp:RadioButtonList ID="RadioButtonList_Standards" runat="server" 
                              RepeatDirection="Horizontal">
                              <asp:ListItem>A</asp:ListItem>
                              <asp:ListItem>B</asp:ListItem>
                              <asp:ListItem>C</asp:ListItem>
                              <asp:ListItem>D</asp:ListItem>
                              <asp:ListItem>E</asp:ListItem>
                              <asp:ListItem>F</asp:ListItem>
                              <asp:ListItem>G</asp:ListItem>
                          </asp:RadioButtonList>
                        </td>
                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            &nbsp;</td>
                                        <td style="width:80%;vertical-align:top;text-align:left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            Standard Concentration</td>
                                        <td style="width:80%;vertical-align:top;text-align:left">
                                            <asp:TextBox ID="TextBox_StandardRange" runat="server" Width="107px"></asp:TextBox>
                                        </td>
                                    </tr>
                    <tr>
                     <td style="width:27%; vertical-align:top;text-align:right;">
                            UNIT </td>
                        <td style="width:80%;vertical-align:top;text-align:left">
                            <asp:TextBox ID="TextBox_UNIT" runat="server" Width="104px"></asp:TextBox>
                            &nbsp; </td>
                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            QC TEST Abs</td>
                                        <td align="left" style="width:80%;vertical-align:top;text-align:left;">
                                            <asp:TextBox ID="TextBox_Formula" runat="server" Width="107px"></asp:TextBox>
                                            &nbsp;A/B or B/C+E/F</td>
                                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            Low&nbsp; Specifications </td>
                                        <td align="left" style="width:80%;vertical-align:top;text-align:left;">
                                            <asp:TextBox ID="TextBox_Specifications_Low" runat="server" Width="107px"></asp:TextBox>
                                            &nbsp; &gt;&nbsp; or &gt;=&nbsp;&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            High&nbsp; Specifications
                                        </td>
                                        <td align="left" style="width:80%;vertical-align:top;text-align:left;">
                                            <asp:TextBox ID="TextBox_Specifications_High" runat="server" Width="107px"></asp:TextBox>
                                            &lt;&nbsp; or &lt;=</td>
                                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            PHASCO OD</td>
                                        <td align="left" style="width:80%;vertical-align:top;text-align:left;">
                                            <asp:TextBox ID="TextBox_Phasco_OD" runat="server" Width="107px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:27%; vertical-align:top;text-align:right;">
                                            Company OD</td>
                                        <td align="left" style="width:80%;vertical-align:top;text-align:left;">
                                            <asp:TextBox ID="TextBox_CompanyOD" runat="server" Width="107px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="vertical-align:top;text-align:right;">
                                   
                                            <asp:HiddenField ID="HiddenField_Quntive_Id" runat="server" />
                                   
                                        </td>
                                    </tr>
                    <tr>
                     <td style="width:27%; vertical-align:top;text-align:right;">
                            &nbsp;</td>
                        <td style="width:80%;vertical-align:top;text-align:left;">
                <asp:Button ID="Button_Quantitative" runat="server" Text=" Submit  " 
                                style="height: 29px" onclick="Button_Quantitative_Click" />
                            <asp:Button ID="Button_Quntive_Edit" runat="server" 
                                onclick="Button_Quntive_Edit_Click" Text="-- Edit --" Visible="False" />
                        </td>
                    </tr>
                </table></td>
                      
                                     <td style="width:50%;vertical-align:top;text-align:right;direction:ltr;">
                                         
                            </td>
                        </tr>
                    </table>
                </asp:Panel><asp:GridView ID="GridView_Quantitative" runat="server" 
                                             AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" 
                                             ForeColor="#333333" GridLines="None">
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                             <Columns>
                                                 <asp:BoundField DataField="Standards" HeaderText="Standards" />
                                                 <asp:BoundField DataField="StandardRange" HeaderText="StandardRange" />
                                                 <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                                 <asp:BoundField DataField="Formula" HeaderText="Formula" />
                                                 <asp:BoundField DataField="Specifications_Low" 
                                                     HeaderText="Specifications_Low" />
                                            
                                                 <asp:BoundField DataField="Specifications_High" 
                                                     HeaderText="Specifications_High" />
                                            
                                                 <asp:BoundField DataField="PHASCO_OD" HeaderText="PHASCO_OD" />
                                                 <asp:BoundField DataField="Company_OD" HeaderText="Company_OD" />
                                            
                                                 <asp:TemplateField>
                                                     <ItemTemplate>
                                                          
                                                         <asp:LinkButton ID="LinkButton_Quantive_Edit" runat="server" ForeColor="#339933" 
                                                         CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                     OnCommand="LinkButton_Quantive_Edit_Command">ویرایش</asp:LinkButton>
                                                        <br />
                                                         <asp:LinkButton ID="LinkButton_Quantive_Delete" runat="server" 
                                                             ForeColor="#993333"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                     OnCommand="LinkButton_Quantive_Delete_Delete_Command">حذف</asp:LinkButton>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                             </Columns>
                                             <EditRowStyle BackColor="#999999" />
                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                         </asp:GridView>
            </td>
            </tr>

<%# SetstatusMode(Eval("TestStatus").ToString())%>
                
                
                </td></tr>

        <tr>
            <td style="width:50%;vertical-align:top;text-align:right;">
                <asp:HiddenField ID="HiddenField_ProductID" runat="server" />
            </td>
            <td style="width:50%;vertical-align:top;text-align:right;">
                &nbsp;</td></tr>

                <tr>
                    <td style="width:50%;vertical-align:top;text-align:right;">
                        &nbsp;</td>
                    <td style="width:50%;vertical-align:top;text-align:right;">
                        &nbsp;</td>
                </tr>

                </table>
            <asp:Panel ID="Panel_QC_Controls" runat="server" BackColor="#E2E7F3" 
                Visible="False">
                <table class="style3">
                    <tr>
                     <td style="width:50%;vertical-align:top;text-align:right;">
                            <table class="style3">
                                <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:TextBox ID="TextBox_level_1_Low" runat="server"></asp:TextBox>
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               level_1_Low</td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:TextBox ID="TextBox_level_2_Low" runat="server"></asp:TextBox>
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               level_2_Low</td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:TextBox ID="TextBox_level_3_Low" runat="server"></asp:TextBox>
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               level_3_Low</td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:TextBox ID="TextBox_level_1_High" runat="server"></asp:TextBox>
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               level_1_High</td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:TextBox ID="TextBox_level_2_High" runat="server"></asp:TextBox>
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               level_2_High</td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:TextBox ID="TextBox_level_3_High" runat="server"></asp:TextBox>
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               level_3_High</td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                        <asp:Button ID="Button_Insert_QcControl" runat="server" 
                                            onclick="Button_Insert_QcControl_Click" Text="Insert" />
                                        <asp:Button ID="Button_Edit_QcControl" runat="server" 
                                            onclick="Button_Edit_QcControl_Click" Text="-- Edit --" />
                                        <asp:HiddenField ID="HiddenField_LotExprID_QCControls" runat="server" />
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                               <asp:HiddenField ID="HiddenField_ID_QCControlsEdit" runat="server" />
                                        </td>
                                </tr>
                                     <tr>
                                    <td style="width:70%;vertical-align:top;text-align:left;">
                                      </td>
                                           <td style="width:30%;vertical-align:top;text-align:right;">
                                        </td>
                                </tr>
                            </table>
                        </td>
                            <td style="width:50%;vertical-align:top;text-align:right;">
                                &nbsp;</td>
                      
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

 
</asp:Content>
