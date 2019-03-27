<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using System.Web.SessionState;
public class Upload : IHttpHandler, IRequiresSessionState
{
    //EnableSession:=True
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;

        string[] words = context.Request.Params["Name"].ToString().Split('?');
        string filename_ = words[0];

        try
        {
            HttpPostedFile postedFile = context.Request.Files["Filedata"];
            string savepath = "";
            string tempPath = "";
            tempPath = @"\phascoupfile\Video\file\";
            savepath = context.Server.MapPath(tempPath);
            string filename = filename_ + ".flv";// postedFile.FileName;
            if (!Directory.Exists(savepath))
                Directory.CreateDirectory(savepath);

            postedFile.SaveAs(savepath + @"\" + filename);
            context.Response.Write(tempPath + "/" + filename);
            context.Response.StatusCode = 200;
        }
        catch (Exception ex) { context.Response.Write("Error: " + ex.Message); }
    }

    public bool IsReusable
    { get { return false; } }
}