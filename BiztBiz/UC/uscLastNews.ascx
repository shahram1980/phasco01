<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscLastNews.ascx.cs"
    Inherits="BiztBiz.UC.uscLastNews" %>
<table class="h-news" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 106px; height: 33px;">
            <img alt="" height="33" src="<%= ImgSiteFolder %>bg-scroll-news-right.jpg" width="106" />
        </td>
        <td class="h-news-bg">
            <span id="theTicker" style="color: #008ba2;font:11px tahoma;"></span>
        </td>
        <td style="width: 50px; height: 33px;">
            <img alt="" height="33" src="<%= ImgSiteFolder %>bg-scroll-news-left.jpg" width="50" />
        </td>
    </tr>
</table>
<script type="text/javascript">
    var theSummaries = new Array();
    var theSiteLinks = new Array();

    <%=GetTopNews()%>
</script>
<script type="text/javascript">
    var theCharacterTimeout = 50;
    var theStoryTimeout = 5000;
    var theWidgetOne = "_";
    var theWidgetTwo = "-";
    var theWidgetNone = "";
    var theItemCount = theSummaries.length;
    var NS6 = (document.getElementById && !document.all) ? true : false;
    function startTicker() {
        theCurrentStory = -1;
        theCurrentLength = 0;
        if (document.getElementById) {
            runTheTicker();
        }
        else {
            document.write("<style>.ticki{display:none;}.ticko{border:0px; padding:0px;}</style>");
            return true;
        }
    }
    function runTheTicker() {
        var myTimeout;
        if (theCurrentLength == 0) {
            theCurrentStory++;
            theCurrentStory = theCurrentStory % theItemCount;
            theStorySummary = theSummaries[theCurrentStory];
            theTargetLink = theSiteLinks[theCurrentStory];
        }
        var textTitle = theStorySummary.substring(0, theCurrentLength) + whatWidget();
        if (theTargetLink) {
            if (NS6) {
                document.getElementById("theTicker").innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + textTitle + '</a>';
            }
            else {
                document.all.theTicker.innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + '<font face="Tahoma" style="font-size: 8pt"><span style="text-decoration: none">' + textTitle + '</span></font>' + '</a>';
            }
        }
        else {
            if (NS6) {
                document.getElementById("theTicker").innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + '<span class="tickertext">' + textTitle + '</span>' + '</a>';
            }
            else {
                document.all.theTicker.innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + '<span class="tickertext">' + textTitle + '</span>' + '</a>';

            }
        }
        if (theCurrentLength != theStorySummary.length) {
            theCurrentLength++;
            myTimeout = theCharacterTimeout;
        }
        else {
            theCurrentLength = 0;
            myTimeout = theStoryTimeout;
        }
        setTimeout("runTheTicker()", myTimeout);
    }
    function whatWidget() {
        if (theCurrentLength == theStorySummary.length) {
            return theWidgetNone;
        }
        if ((theCurrentLength % 2) == 1) {
            return theWidgetOne;
        }
        else {
            return theWidgetTwo;
        }
    }
    startTicker();
</script>
