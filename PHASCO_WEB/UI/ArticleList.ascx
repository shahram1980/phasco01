<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArticleList.ascx.cs" Inherits="phasco_webproject.UI.ArticleList" %>
<script language="javascript" type="text/javascript" >
       
        var DetailBG_Color = '#ffffff';
        var Detal_Top_Botton = "<tr><td style='width: 10px; height: 5px' valign='top'></td><td valign='top'></td></tr>";
        var Back_Color1='#ffffff';
        var Back_Title='yellow';
        function GetData(Item , ID_Cat)
        {
            ColapseAll(Item);
           
            if( document.getElementById("Nav_Dav_" + Item).style.display == "none"  )
            {
                // Load Special Image when Click To Master 
                SetDefaultImage_Src();
                document.getElementById('Nav_IMG' + Item ).src = "Images/UP.gif";
                document.getElementById("Nav_Dav_" + Item).style.display = "block";

                if (document.getElementById("Nav_Dav_" + Item).innerHTML == "" )
                {
                    // Goto Server And Show Loadin In The Client Side
                    UseCallBack( ID_Cat , Item);
                    ShowLoading(Item , "Show");
                }
            }
            else
            {
                // Load Special Image - Close Image
                document.getElementById("Nav_Dav_" + Item).style.display = "none" ;
                SetDefaultImage_Src();
            }
        }       
        
        function SetDefaultImage_Src()
        {
            for (var i=1 ; i<= CountRow ; i++)
            {
                 document.getElementById('Nav_IMG' + i ).src = "Images/down.gif";
            }
        }
      
                
        function ShowLoading(ThisRow , State)
        {
            var This='none' , All='none';
            if (State == "Show")
            {
                This = "block"
            }
        
            for (var i=1 ; i<= CountRow ; i++)
            { 
                if (i != ThisRow)
                    document.getElementById("LoadingIMG_" + i).style.display = All ;
                else
                {
                    document.getElementById("LoadingIMG_" + i).style.display = This ;
                }                    
            }
        }
        
        function ColapseAll(ThisRow)
        {
            for (var i=1 ; i<= CountRow ; i++)
            { 
                if (i != ThisRow)
                    document.getElementById("Nav_Dav_" + i).style.display = "none";
            }
        } 
        

        function GetFromServer( Server_Str , context , align)
        {            
            var Array = Server_Str.split("@");
            var Count = Array.length;            
            var _String; 
            _String = "<table  border='0' cellpadding='0' cellspacing='0' background='#efe9d0' style='width: 100%;'>"  + Detal_Top_Botton ;
            for (var i=0 ; i< Array.length-1 ; i++)
            {
                var SmallArray = Array[i].split("#");
                _String += "<td style='width: 10%; valign='middle'><img src='Images/arrow1.gif' /></td><td background='#efe9d0' style='height: 26%; ' valign='middle'><font face='Tahoma' size='1'><a class='Link-5' href='/Article.aspx?articleid="+ SmallArray[1] +"' >"+SmallArray[0] +" </a></font></td></tr>";
            }
            _String += Detal_Top_Botton  + "</table>";    
            document.getElementById("Nav_Dav_" + context).innerHTML  = _String;
            // Hide Loading In The Client
            ShowLoading(context , "Hide");
        }
        
    </script>
<table id="table3" align="right"  dir="rtl" runat="server" border="0" cellpadding="0" cellspacing="0" width="200px">
    <tr>
        <td align="right" dir="rtl" valign="top" >        	
               <%= _MasterCat %>            
         </td>
    </tr>
</table>