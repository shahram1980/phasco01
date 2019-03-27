using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using PHASCO_Shopping.BLL;
using System.IO;
using System.Text;

namespace PHASCO_Shopping.bizpanel
{
    public partial class CatManagerSub3 : System.Web.UI.Page
    {
        TBL_Categories DaCat = new TBL_Categories();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (adminUser.UserValid() == true)
            //{
                //DataTable dt = new DataTable();
                //dt = adminUser.check_Page(6, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), this.Title, 0, null);
                //if (dt.Rows.Count > 0)
                //{

                    if (!IsPostBack)
                    {
                        Set_Url();
                        if (Request.QueryString["status"] != null)
                        {
                            string status = Request.QueryString["status"].ToString();
                            switch (status)
                            {
                                case "Cat01true":
                                    {
                                        Lbl_Alarm.Text = "Categore Success Created";
                                        Bind_Grd();
                                        break;
                                    }
                                case "Edit":
                                    {
                                        Set_edit();
                                        Bind_Grd();
                                        break;
                                    }

                                default:
                                    break;
                            }
                        }
                        else Bind_Grd();
                    }
                //}
              //  else Response.Redirect("AccessDenied.aspx");
          //  }
            //else Response.Redirect("AccessDenied.aspx");

            Bind_Grd();
        }
        void Set_Url()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["subid"].ToString());
            dt = DaCat.TBL_Categories_Tra(id,"select_Path");
            Label_Nav.Text = "<a href='CatManager.aspx' >" + dt.Rows[0]["Subject_en2"] + "</a>><a href='CatManagerSub.aspx?subid="  + dt.Rows[0]["id2"]+ "' >"  + dt.Rows[0]["Subject_en"]+ "</a>";
        }
        void Bind_Grd()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["subid"].ToString());
            dt = DaCat.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            GridView_cats.DataSource = dt;
            GridView_cats.DataBind();
        }
        void Set_edit()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["id"].ToString());
            dt = DaCat.TBL_Categories_Tra(id, "select_Item", 0, "", "", "", 0);
           // TextBox_Ch.Text = dt.Rows[0]["Subject_ch"].ToString();
            TextBox_En.Text = dt.Rows[0]["Subject_en"].ToString();
            TextBox_Ir.Text = dt.Rows[0]["Subject_ir"].ToString();
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            if ( TextBox_En.Text == "" || TextBox_Ir.Text == "")
            { Lbl_Alarm.Text = "Please complete all textbox"; return; }
            int subid = int.Parse(Request.QueryString["subid"].ToString());
            if (Request.QueryString["status"] != null)
            {
                if (Request.QueryString["status"].ToString() == "Edit")
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    DaCat.TBL_Categories_Tra(id, "update", 0, TextBox_En.Text, "", TextBox_Ir.Text, 0);
                    Server.Transfer("CatManagerSub3.aspx?subid=" + Request.QueryString["subid"].ToString() + "&status=Cat01true");
                }
                else
                {
                    DaCat.TBL_Categories_Tra(0, "insert_l2", subid, TextBox_En.Text, "", TextBox_Ir.Text, 0);
                    Server.Transfer("CatManagerSub3.aspx?subid=" + Request.QueryString["subid"].ToString() + "&status=Cat01true");
                }
            }
            else
            {
                DaCat.TBL_Categories_Tra(0, "insert_l2", subid, TextBox_En.Text, "", TextBox_Ir.Text, 0);
                Server.Transfer("CatManagerSub3.aspx?subid=" + Request.QueryString["subid"].ToString() + "&status=Cat01true");
            }
        }

        protected void LinkButton_Create_File_Click(object sender, EventArgs e)
        {

            En_FileUpdate();
            FA_FileUpdate();
            CH_FileUpdate();
        }
        void En_FileUpdate()
        {
            DataTable dt;
            DataTable dt2;
            dt = DaCat.TBL_Categories_Tra(0, "select_en", 0, "", "", "", 0);

            TextWriter tw = new StreamWriter(Server.MapPath("~//Cat_Menu_Txt//ConHomeEN.txt"));

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                tw.WriteLine("<div style=\"margin:3px;float:left\" >");
                tw.WriteLine("<div style=\"background:url('images/mn-left.gif') no-repeat left top; width:6px ;height:29px;float:left;margin:0px;padding:0px\"></div>");
                tw.WriteLine("<div style=\"-moz-background-clip:border;-moz-background-inline-policy:continuous;-moz-background-origin:padding;background-attachment:scroll;background-color:transparent;background-image:url(images/mn-right.gif);background-position:right top;background-repeat:no-repeat;float:left;width:189px;;height:29px;margin-bottom:0;margin-left:0;margin-right:0;margin-top:0;padding-bottom:0;padding-left:0;padding-right:5px;padding-top:5px;vertical-align:middle; white-space:nowrap;\">");
                tw.WriteLine("<a href='#demo" + i + "' class='supernote-hover-demo" + i + "'>" + dt.Rows[i]["Subject_en"].ToString() + "</a>");
                tw.WriteLine("</div></div>");

                tw.WriteLine("<div style='left: 209px; top: 259px; visibility: hidden; opacity: 0;width:400px;' id='supernote-note-demo" + i + "' class='snp-mouseoffset pinnable notedefault'>");
                tw.WriteLine("<a name='demo" + i + "'></a><h5>" + dt.Rows[i]["Subject_en"].ToString() + "</h5>");
                dt2 = DaCat.TBL_Categories_Tra(0, "select", int.Parse(dt.Rows[i]["id"].ToString()), "", "", "", 0);
                for (int o = 0; o < dt2.Rows.Count; o++)
                {
                    tw.WriteLine("<a href='Categories.aspx?sid=" + dt2.Rows[o]["id"].ToString() + "'>" + dt2.Rows[o]["Subject_en"].ToString() + "</a>&nbsp; &nbsp; ");
                }
                tw.WriteLine("</div>");
                dt2.Dispose();
            }

            tw.Close();
        }

        void FA_FileUpdate()
        {
            DataTable dt;
            DataTable dt2;
            dt = DaCat.TBL_Categories_Tra(0, "select_fa", 0, "", "", "", 0);

            TextWriter tw = new StreamWriter(Server.MapPath("~//Cat_Menu_Txt//ConHomeFA.txt"), false, Encoding.Unicode);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                tw.WriteLine("<div style=\"margin:3px;float:left\" >");
                tw.WriteLine("<div style=\"background:url('images/mn-left.gif') no-repeat left top; width:6px ;height:29px;float:left;margin:0px;padding:0px\"></div>");
                tw.WriteLine("<div style=\"background:url('images/mn-right.gif') no-repeat right top;width:189px;;height:29px;vertical-align:middle ; float:left;margin:0px;padding:5px 5px 0px 0px\">");
                tw.WriteLine("<a href='#demo" + i + "' class='supernote-hover-demo" + i + "'>" + dt.Rows[i]["Subject_ir"].ToString() + "</a>");
                tw.WriteLine("</div></div>");
                tw.WriteLine("<div style='left: 209px; top: 259px; visibility: hidden; opacity: 0;width:400px;' id='supernote-note-demo" + i + "' class='snp-mouseoffset pinnable notedefault'>");
                tw.WriteLine("<a name='demo" + i + "'></a><h5>" + dt.Rows[i]["Subject_ir"].ToString() + "</h5>");
                dt2 = DaCat.TBL_Categories_Tra(0, "select", int.Parse(dt.Rows[i]["id"].ToString()), "", "", "", 0);
                for (int o = 0; o < dt2.Rows.Count; o++)
                {
                    tw.WriteLine("<a href='Categories.aspx?sid=" + dt2.Rows[o]["id"].ToString() + "'>" + dt2.Rows[o]["Subject_ir"].ToString() + "</a>&nbsp; &nbsp; ");
                }
                tw.WriteLine("</div>");
                dt2.Dispose();
            }
            tw.Close();
        }

        void CH_FileUpdate()
        {
            DataTable dt;
            DataTable dt2;
            dt = DaCat.TBL_Categories_Tra(0, "select_fa", 0, "", "", "", 0);
            TextWriter tw = new StreamWriter(Server.MapPath("~//Cat_Menu_Txt//ConHomeCH.txt"), false, Encoding.Unicode);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                tw.WriteLine("<div style=\"margin:3px;float:left\" >");
                tw.WriteLine("<div style=\"background:url('images/mn-left.gif') no-repeat left top; width:6px ;height:29px;float:left;margin:0px;padding:0px\"></div>");
                tw.WriteLine("<div style=\"background:url('images/mn-right.gif') no-repeat right top;width:189px;;height:29px;vertical-align:middle ; float:left;margin:0px;padding:5px 5px 0px 0px\">");
                tw.WriteLine("<a href='#demo" + i + "' class='supernote-hover-demo" + i + "'>" + dt.Rows[i]["Subject_ch"].ToString() + "</a>");
                tw.WriteLine("</div></div>");
                tw.WriteLine("<div style='left: 209px; top: 259px; visibility: hidden; opacity: 0;width:400px;' id='supernote-note-demo" + i + "' class='snp-mouseoffset pinnable notedefault'>");
                tw.WriteLine("<a name='demo" + i + "'></a><h5>" + dt.Rows[i]["Subject_ir"].ToString() + "</h5>");
                dt2 = DaCat.TBL_Categories_Tra(0, "select", int.Parse(dt.Rows[i]["id"].ToString()), "", "", "", 0);
                for (int o = 0; o < dt2.Rows.Count; o++)
                {
                    tw.WriteLine("<a href='Categories.aspx?sid=" + dt2.Rows[o]["id"].ToString() + "'>" + dt2.Rows[o]["Subject_ch"].ToString() + "</a>&nbsp; &nbsp; ");
                }
                tw.WriteLine("</div>");
                dt2.Dispose();
            }
            tw.Close();
            Server.Transfer("CatManager.aspx?status=CreateFileTrue");
        }

    }
}
