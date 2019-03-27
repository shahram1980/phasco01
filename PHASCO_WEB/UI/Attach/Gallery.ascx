<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Gallery.ascx.cs" Inherits="phasco_webproject.UI.Attach.Gallery" %>
<script src="JSLoader/function.js" language="JavaScript" type="text/javascript"></script>

<script language="JavaScript"><!--

function changeLinkHref(id,newHref,oldHref) {
  if (document.links.length > 0) {
    if (document.getElementById) {
      document.getElementById(id).href = 'javascript:popUp("'+newHref+'")';
    }
    else if (document.all) {
      document.all[id].href = 'javascript:popUp("'+newHref+'")';
    }
    else {
      var index = findLinkByHref(oldHref);
      if (index > -1)
        document.links[index].href = 'javascript:popUp("'+newHref+'")';
    }
  }
}
//--></script>

<script language="javascript">
function changeOff(DivId){
document.all[DivId].style.visibility="hidden";
}
function changeOn(DivId){
document.all[DivId].style.visibility = 'visible';
}
</script>

<script language="javascript">
<!--
function popUp(N) {
newWindow = window.open(N, 'popUp','toolbar=no,menubar=no,resizable=yes,scrollbars=yes,status=no,location=no,width=770,height=650');
}
//-->
</script>

<div style="text-align: center">
    <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="2">
                            <ItemTemplate>
                                <td>
                                    
                                    <a href="javascript:popUp('ImageSHow.aspx?img=b<%# Eval("small")%>')" class="thumbnail" >
                                    <img src='phascoupfile/Productgallery/s<%# Eval("small")%>' border="0" />
                                    <span>
                                    <img src='phascoupfile/Productgallery/m<%# Eval("small")%>' /><br />
                                    </span>
                                    </a>
                                </td>
                            </ItemTemplate>
                        </asp:DataList>
</div>
