﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DAL;

namespace NewFifa.Admin.VideoManage
{
    public partial class UploadEngine : System.Web.UI.Page
    {
        #region Web Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                UploadDetail Upload = (UploadDetail)this.Session["UploadDetail"];
                //Let the webservie know that we are not yet ready
                Upload.IsReady = false;
                if (this.fileUpload.PostedFile != null && this.fileUpload.PostedFile.ContentLength > 0)
                {
                    //build the local path where upload all the files
                    string path = this.Server.MapPath(@"\UPFvideos\vfile");
                    string  fileName = Path.GetFileName(this.fileUpload.PostedFile.FileName);
                    string Extension = Path.GetExtension(path + fileName);

                    string fileNameuploadfile = this.Session["Uploadfv"] + Extension;
                    //Build the strucutre and stuff it into session
                    Upload.ContentLength = this.fileUpload.PostedFile.ContentLength;
                    Upload.FileName = fileNameuploadfile;
                    Upload.UploadedLength = 0;
                    //Let the polling process know that we are done initializing ...
                    Upload.IsReady = true;

                    //set the buffer size to something larger.
                    //the smaller the buffer the longer it will take to download, 
                    //but the more precise your progress bar will be.
                    int bufferSize = 1;
                    byte[] buffer = new byte[bufferSize];

                    //Writing the byte to disk
                    using (FileStream fs = new FileStream(Path.Combine(path, fileNameuploadfile), FileMode.Create))
                    {
                        //Aslong was we haven't written everything ...
                        while (Upload.UploadedLength < Upload.ContentLength)
                        {
                            //Fill the buffer from the input stream
                            int bytes = this.fileUpload.PostedFile.InputStream.Read(buffer, 0, bufferSize);
                            //Writing the bytes to the file stream
                            fs.Write(buffer, 0, bytes);
                            //Update the number the webservice is polling on to the session
                            Upload.UploadedLength += bytes;
                        }
                    }
                    //Call parent page know we have processed the uplaod
                    const string js = "window.parent.onComplete(1,'File uploaded successfully.','{0}','{1} of {2} Bytes');";
                    ScriptManager.RegisterStartupScript(this, typeof(UploadEngine), "progress", string.Format(js, fileNameuploadfile, Upload.UploadedLength, Upload.ContentLength), true);
                    tblVideo da_Video = new tblVideo();
                    int VID = int.Parse(this.Session["UploadvId"].ToString());
                    da_Video.tblVideo_SP(7, VID, fileNameuploadfile, 1);
                }
                else
                {
                    //Call parent page know we have processed the uplaod
                    const string js = "window.parent.onComplete(4, 'There was a problem with the file.','','0 of 0 Bytes');";
                    ScriptManager.RegisterStartupScript(this, typeof(UploadEngine), "progress", js, true);
                }
                //Let webservie know that we are not yet ready
                Upload.IsReady = false;
            }
        }
        #endregion


        
    }
}