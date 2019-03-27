<%@ Control Language="C#" AutoEventWireup="true" Codebehind="ProductGallery.ascx.cs"
    Inherits="PHASCO_WEB.UI.ProductGallery" %>


</script>


                        <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="2">
                            <ItemTemplate>
                              
                                    <a class="highslide" href='../phascoupfile/Productgallery/b<%# Eval("small")%>' onclick="return hs.expand(this)">
                                        <img alt="Highslide JS" src='../phascoupfile/Productgallery/s<%# Eval("small")%>'
                                            title="Click to enlarge" />
                                    </a>
                         
                            </ItemTemplate>
                        </asp:DataList>
    

