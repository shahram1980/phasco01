<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailtoFriends.ascx.cs" Inherits="PHASCO_WEB.UI.EmailtoFriends" %>

<a href="#" data-toggle="modal" data-target="#myModal" title="ارسال به دوستان"><i class="fa fa-envelope"></i></a>


<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">ارسال به دوستان</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="email">ایمیل</label>
                        <asp:TextBox ID="TextBox_email" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="TextBox_email" ErrorMessage="*" ForeColor="Maroon"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="TextBox_email" Display="Dynamic"
                            ErrorMessage="پست الکترونیک معتبر نمی باشد" ForeColor="DarkRed"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>


                    </div>
                    <div class="form-group">
                        <label for="pwd">عنوان</label>
                        <asp:TextBox ID="TextBox_Title" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">خروج</button>
                <asp:Button ID="Button_sendemail" runat="server"
                    OnClick="Button_sendemail_Click" Text="  ارسال شود " CssClass="btn btn-success" />
                <asp:Label ID="Label_alarm" runat="server"  CssClass="lable lable-success" ></asp:Label>

            </div>
        </div>

    </div>
</div>

