using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

namespace PHASCO_Shopping.Component
{
    public class MyFileUploader
    {
        public static string SaveFile(FileUpload fileUpload, string Folder_, int id_, string Standard_Exception1, string Standard_Exception2, string Standard_Exception3, HttpServerUtility Server)
        {
            try
            {
                string file_name = "";
                if (fileUpload.HasFile)
                {
                    string ext_ = System.IO.Path.GetExtension(fileUpload.FileName);

                    if (ext_ == Standard_Exception1 || ext_ == Standard_Exception2 || ext_ == Standard_Exception3 || Standard_Exception1 == "*")
                    {
                        file_name = Convert.ToString(id_) + Convert.ToString((id_ * 4)) + ext_;
                        file_name = Server.MapPath("~\\" + Folder_ + "\\" + file_name);
                        fileUpload.SaveAs(file_name);
                    }
                    else
                    {
                        return "فرمت فایل ارسالی استادارد این وب سایت نمی باشد";
                    }
                }
                return file_name;
            }
            catch (NotSupportedException nse)
            {
                return "فرمت فایل ارسالی استادارد این وب سایت نمی باشد";
            }
            catch (System.IO.IOException ioe)
            {
                return "مسیر ذخیره سازی فایل پیدا نمی شود";
            }
            catch (ApplicationException ae)
            {
                throw ae;
            }

        }
        public static int SaveFile_MyFileName(FileUpload fileUpload, string Folder_, string filename, string Standard_Exception1, string Standard_Exception2, string Standard_Exception3, HttpServerUtility Server)
        {
            try
            {
                string file_name = "";
                if (fileUpload.HasFile)
                {
                    string ext_ = System.IO.Path.GetExtension(fileUpload.FileName);

                    if (ext_ == Standard_Exception1 || ext_ == Standard_Exception2 || ext_ == Standard_Exception3 || Standard_Exception1 == "*")
                    {
                        file_name = Server.MapPath(Folder_ + "\\" + filename);
                        fileUpload.SaveAs(file_name);
                        file_name = "فایل با موفقيت ارسال گرديد.";
                        return 0;
                    }
                    else
                    {
                        file_name = "فرمت فایل ارسالی استادارد این وب سایت نمی باشد";
                        return 1; // "فرمت فایل ارسالی استادارد این وب سایت نمی باشد";
                    }
                }
                return 0;
            }
            catch (NotSupportedException nse)
            {
                return 2;
                // "فرمت فایل ارسالی استادارد این وب سایت نمی باشد";
            }
            catch (System.IO.IOException ioe)
            {
                return 3;
                //"مسیر ذخیره سازی فایل پیدا نمی شود"; 
            }
            catch (ApplicationException ae)
            { throw ae; }

        }
        public string DeleteFile(HttpServerUtility server, string Folder_, string FileName)
        {
            try
            {
                string path = Folder_ + FileName;
                using (StreamWriter sw = File.CreateText(path)) { }
                if (File.Exists(path))
                {
                    File.Delete(path);
                    return "فایل مورد نظر با موفقيت حذف گردید";
                }
                else
                    return "فایل مورد نظر پیدا نشد";
            }
            catch (Exception e)
            {
                Console.WriteLine("The process failed: {0}", e.ToString());
            }
            throw new System.NotImplementedException();
        }
        public static bool IsHasFile(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
                return true;
            else
                return false;

        }
        public static string IsExtension(FileUpload fileUpload)
        {
            return System.IO.Path.GetExtension(fileUpload.FileName);
        }
        public static string GetImageName(string Folder_, int Id_Image, string ext_)
        {

            string file_name = Folder_ + "/" + Convert.ToString(Id_Image) + Convert.ToString((Id_Image * 4)) + ext_;
            return file_name;
            throw new System.NotImplementedException();
        }
        public static string GetImageSingleName(int Id_Image, string ext_)
        {

            string file_name = Convert.ToString(Id_Image) + Convert.ToString((Id_Image * 4)) + ext_;
            return file_name;
            throw new System.NotImplementedException();
        }
        public static bool IsExtensionTrue(FileUpload fileUpload, string Extension)
        {
            string Ext = System.IO.Path.GetExtension(fileUpload.FileName).ToUpper();
            if (Ext == Extension.ToUpper())
                return true;
            else
                return false;
            return false;
        }
        public static string GetImageSingleName_calcul(int Id_Image, string ext_)
        {

            string file_name = Convert.ToString(Id_Image) + Convert.ToString((Id_Image * 4)) + ext_;
            return file_name;
            throw new System.NotImplementedException();
        }
        public static bool ResizeImage(string OriginalFile, string NewFile, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
        {
            System.Drawing.Image FullsizeImage = System.Drawing.Image.FromFile(OriginalFile);

            // Prevent using images internal thumbnail
            FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
            FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);

            if (OnlyResizeIfWider)
            {
                if (FullsizeImage.Width <= NewWidth)
                {
                    NewWidth = FullsizeImage.Width;
                }
            }
            int NewHeight = FullsizeImage.Height * NewWidth / FullsizeImage.Width;
            if (NewHeight > MaxHeight)
            {
                // Resize with height instead
                NewWidth = FullsizeImage.Width * MaxHeight / FullsizeImage.Height;
                NewHeight = MaxHeight;
            }
            System.Drawing.Image NewImage = FullsizeImage.GetThumbnailImage(NewWidth, NewHeight, null, IntPtr.Zero);
            // Clear handle to original file so that we can overwrite it if necessary
            FullsizeImage.Dispose();
            // Save resized picture
            NewImage.Save(NewFile);
            return true;
        }
        public static bool Delete_File(string OriginalFile)
        {
            try
            {
                File.Delete(OriginalFile);
                return true;
            }
            catch (Exception)
            { return false; }
            return false;
        }
    }
}
