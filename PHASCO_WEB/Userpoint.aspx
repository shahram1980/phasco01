<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userpoint.aspx.cs" Inherits="PHASCO_WEB.Userpoint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>امتیاز گیری فاسکو</title>
    <link rel="stylesheet" href="~/theme/css/bootstrap.css" type="text/css" media="screen" />
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="~/theme/css/fullwidth.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/settings.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="~/theme/css/magnific-popup.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/owl.carousel.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/owl.theme.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/jquery.bxslider.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/font-awesome.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/responsive.css" media="screen" />

    <script type="text/javascript" src="../theme/js/jquery.min.js"></script>
    <script type="text/javascript" src="../theme/js/bootstrap.js"></script>

</head>
<body style="background-color:#fff">
    <form id="form1" runat="server">

         <div class="container">
                <asp:DataGrid CssClass="table table-bordered table-striped table-hover rtl-text" ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                    GridLines="Vertical">
                    <HeaderStyle BackColor="#fff" Font-Size="18px" ForeColor="#000" />
                    <Columns>
                        <asp:BoundColumn DataField="piont" HeaderText="امتیاز"></asp:BoundColumn>
                        <asp:BoundColumn DataField="name" HeaderText="عنوان"></asp:BoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999"
                        Mode="NumericPages"></PagerStyle>
                </asp:DataGrid>
            </div>

    </form>
</body>
</html>
