<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuDownload.ascx.cs" Inherits="PHASCO_WEB.UI.Page.MenuDownload" %>
<script type="text/javascript">
    hs.graphicsDir = 'java/graphics/';
    hs.align = 'center';
    hs.transitions = ['expand', 'crossfade'];
    hs.outlineType = 'glossy-dark';
    hs.fadeInOut = true;
    //hs.dimmingOpacity = 0.75;

    // Add the controlbar
    if (hs.addSlideshow) hs.addSlideshow({
        //slideshowGroup: 'group1',
        interval: 5000,
        repeat: false,
        useControls: true,
        fixedControls: true,
        overlayOptions: {
            opacity: .6,
            position: 'top center',
            hideOnMouseOut: true
        }
    });
</script>
<script type="text/javascript">
    hs.registerOverlay({
        overlayId: 'closebutton',
        position: 'top right',
        fade: 2 // fading the semi-transparent overlay looks bad in IE
    });

    hs.graphicsDir = 'java/graphics/';
</script>
<style type="text/css">
    .highslide-wrapper div
    {
        font-family: Verdana, Helvetica;
        font-size: 10pt;
    }
    .highslide
    {
        cursor: url(java/graphics/zoomin.cur), pointer;
        outline: none;
        text-decoration: none;
    }
    .highslide img
    {
        border: 2px solid silver;
    }
    .highslide:hover img
    {
        border-color: gray;
    }
    
    .highslide-active-anchor img, .highslide-active-anchor:hover img
    {
        border-color: black;
    }
    .highslide-image
    {
        border-width: 2px;
        border-style: solid;
        border-color: black black #202020 black;
        background: gray;
    }
    .highslide-wrapper, .glossy-dark
    {
        background: #111;
    }
    .highslide-image-blur
    {
    }
    .highslide-caption
    {
        display: none;
        border-top: none;
        font-size: 1em;
        padding: 5px;
        color: white;
        background: #111;
    }
    .highslide-heading
    {
        display: none;
        color: white;
        font-size: 1.2em;
        font-weight: bold;
        margin-bottom: 0.4em;
    }
    .highslide-dimming
    {
        position: absolute;
        background: black;
    }
    .highslide-loading
    {
        display: block;
        color: white;
        font-size: 9px;
        font-weight: bold;
        text-transform: uppercase;
        text-decoration: none;
        padding: 3px;
        border-top: 1px solid white;
        border-bottom: 1px solid white;
        background-color: black; /*
	padding-left: 22px;
	background-image: url(java/graphics/loader.gif);
	background-repeat: no-repeat;
	background-position: 3px 1px;
	*/
    }
    a.highslide-credits, a.highslide-credits i
    {
        padding: 2px;
        color: silver;
        text-decoration: none;
        font-size: 10px;
    }
    a.highslide-credits:hover, a.highslide-credits:hover i
    {
        color: white;
        background-color: gray;
    }
    .highslide-move a
    {
        cursor: move;
    }
    
    
    
    .highslide-controls
    {
        width: 195px;
        height: 40px;
        background: url(java/graphics/controlbar-black-border.gif) 0 -90px no-repeat;
        margin-right: 15px;
        margin-bottom: 10px;
        margin-top: 20px;
    }
    .highslide-controls ul
    {
        position: relative;
        left: 15px;
        height: 40px;
        list-style: none;
        margin: 0;
        padding: 0;
        background: url(java/graphics/controlbar-black-border.gif) right -90px no-repeat;
    }
    .highslide-controls li
    {
        float: left;
        padding: 5px 0;
    }
    .highslide-controls a
    {
        background: url(java/graphics/controlbar-black-border.gif);
        display: block;
        float: left;
        height: 30px;
        width: 30px;
        outline: none;
    }
    
    
    .highslide-controls a.disabled
    {
        cursor: default;
    }
    .highslide-controls a span
    {
        /* hide the text for these graphic buttons */
        display: none;
    }
    
    /* The CSS sprites for the controlbar */
    .highslide-controls .highslide-previous a
    {
        background-position: 0 0;
    }
    .highslide-controls .highslide-previous a:hover
    {
        background-position: 0 -30px;
    }
    .highslide-controls .highslide-previous a.disabled
    {
        background-position: 0 -60px !important;
    }
    .highslide-controls .highslide-play a
    {
        background-position: -30px 0;
    }
    .highslide-controls .highslide-play a:hover
    {
        background-position: -30px;
    }
    .highslide-controls .highslide-play a.disabled
    {
        background-position: -30px -60px !important;
    }
    .highslide-controls .highslide-pause a
    {
        background-position: -60px 0;
    }
    .highslide-controls .highslide-pause a:hover
    {
        background-position: -60px -30px;
    }
    .highslide-controls .highslide-next a
    {
        background-position: -90px 0;
    }
    .highslide-controls .highslide-next a:hover
    {
        background-position: -90px -30px;
    }
    .highslide-controls .highslide-next a.disabled
    {
        background-position: -90px -60px !important;
    }
    .highslide-controls .highslide-move a
    {
        background-position: -120px 0;
    }
    .highslide-controls .highslide-move a:hover
    {
        background-position: -120px -30px;
    }
    .highslide-controls .highslide-full-expand a
    {
        background-position: -150px 0;
    }
    .highslide-controls .highslide-full-expand a:hover
    {
        background-position: -150px -30px;
    }
    .highslide-controls .highslide-full-expand a.disabled
    {
        background-position: -150px -60px !important;
    }
    .highslide-controls .highslide-close a
    {
        background-position: -180px 0;
    }
    .highslide-controls .highslide-close a:hover
    {
        background-position: -180px -30px;
    }
</style>
<style type="text/css">
    .highslide-active-anchor img
    {
        visibility: hidden;
    }
    .highslide img
    {
        border: 2px solid gray;
    }
    .highslide:hover img
    {
        border-color: silver;
    }
    
    .highslide-wrapper, .drop-shadow
    {
        background: white;
    }
    .highslide-image
    {
        border-bottom: 1px solid white;
    }
    .highslide-image-blur
    {
    }
    .highslide-caption
    {
        display: none;
        border-bottom: 1px solid white;
        font-family: Verdana, Helvetica;
        font-size: 10pt;
        padding: 5px;
        background-color: silver;
    }
    .highslide-loading
    {
        display: block;
        color: black;
        font-size: 8pt;
        font-family: sans-serif;
        font-weight: bold;
        text-decoration: none;
        padding: 2px;
        border: 1px solid black;
        background-color: white;
        padding-left: 22px;
        background-image: url(java/graphics/loader.white.gif);
        background-repeat: no-repeat;
        background-position: 3px 1px;
    }
    
    a.highslide-credits, a.highslide-credits i
    {
        padding: 2px;
        color: silver;
        text-decoration: none;
        font-size: 10px;
    }
    a.highslide-credits:hover, a.highslide-credits:hover i
    {
        color: white;
        background-color: gray;
    }
    a.highslide-full-expand
    {
        background: url(java/graphics/fullexpand.gif) no-repeat;
        display: block;
        margin: 0 10px 10px 0;
        width: 34px;
        height: 34px;
    }
    .highslide-overlay
    {
        display: none;
    }
    
    /* Mac-style close button */
    .closebutton
    {
        position: relative;
        top: -15px;
        left: 15px;
        width: 30px;
        height: 30px;
        cursor: hand; /* ie */
        cursor: pointer; /* w3c */
        background: url(java/graphics/close.png); /* For IE6, remove background and add filter */
        _background: none;
        _filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='java//close.png', sizingMethod='scale');
    }
</style>
<script language="javascript">
    function changeOff(DivId) {
        document.all[DivId].style.visibility = "hidden";
    }
    function changeOn(DivId) {
        document.all[DivId].style.visibility = 'visible';
    }
</script>
<script language="C#" runat="server">
    public string Ex_Icom(string val)
    {
        string ret_ = "";
        switch (val)
        {
            case ".ram":
                ret_ = "/images/Doc_Icon/real.gif";
                break;
            case ".ra":
                ret_ = "/images/Doc_Icon/real.gif";
                break;
            case ".pdf":
                ret_ = "/images/Doc_Icon/pdf.gif";
                break;
            case ".doc":
                ret_ = "/images/Doc_Icon/Word.gif";
                break;
            case ".txt":
                ret_ = "/images/Doc_Icon/txt.gif";
                break;
            case ".ppt":
                ret_ = "/images/Doc_Icon/power.gif";
                break;
            case ".mpg":
                ret_ = "/images/Doc_Icon/movi.gif";
                break;

            case ".mpeg":
                ret_ = "/images/Doc_Icon/movi.gif";
                break;
            case ".wmv":
                ret_ = "/images/Doc_Icon/movi.gif";
                break;
            case ".avi":
                ret_ = "/images/Doc_Icon/avi.gif";
                break;
            case ".jpeg":
                ret_ = "/images/Doc_Icon/jpeg.gif";
                break;
            case ".jpg":
                ret_ = "/images/Doc_Icon/jpeg.gif";
                break;
            case ".gif":
                ret_ = "/images/Doc_Icon/Gif.gif";
                break;

            case ".html":
                ret_ = "/images/Doc_Icon/html.gif";
                break;
            case ".htm":
                ret_ = "/images/Doc_Icon/html.gif";
                break;
            case ".swf":
                ret_ = "/images/Doc_Icon/swf.gif";
                break;
            case ".xls":
                ret_ = "/images/Doc_Icon/excel.gif";
                break;
            default:
                ret_ = "/images/Doc_Icon/none.gif";
                break;
        }
        return ret_;
    }             
</script>
<asp:Panel ID="Panel1" runat="server" GroupingText="  پیوست ها  " Direction="RightToLeft">
<asp:DataList ID="Datalist_Doc" runat="server" RepeatColumns="5">
    <ItemTemplate>
        <table id="table1" border="0" dir="rtl" width="100%">
            <tr>
                <td align="right">
                <img border="0" src='<%# Ex_Icom(Convert.ToString(Eval("ex_")))%>' width="20" />
                    <%# Eval("Commnet")%>
                    <asp:LinkButton ID="DOwn" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                        OnCommand="DOwn_Command"> 
                                  [دانلود]
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
</asp:Panel>
