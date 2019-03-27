using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;


namespace BiztBiz.Component
{
    public class ImageHelper
    {
        public static string UploadFile(string fileName, HttpPostedFile file, string savePath)
        {
            if (file.ContentLength != 0)
            {
                if (file.ContentType == "application/pdf")
                {
                    if (File.Exists(savePath + fileName))
                    {
                        Random rnd = new Random((int)DateTime.Now.Ticks);
                        int random = rnd.Next(0, 999999999);
                        fileName = random + fileName;
                    }
                    byte[] originaldata = new Byte[file.ContentLength];
                    file.InputStream.Read(originaldata, 0, file.ContentLength);
                    string stpath = savePath + fileName;
                    FileStream originalPic = new FileStream(savePath + fileName, FileMode.Create);
                    originalPic.Write(originaldata, 0, file.ContentLength);

                    originalPic.Close();
                }
            }
            return fileName;
        }

        public static string UploadAndResizeFlash(string filename, HttpPostedFile pic, string savePath)//Save Path Bayad Ba Server.MapPath Bashad
        {
            //string filename = string.Empty;
            if (pic.ContentLength != 0)
            {
                if (pic.ContentType == "application/octet-stream" || pic.ContentType == "application/x-shockwave-flash")
                {
                    //filename = pic.FileName;
                    //Check TheFileExist
                    if (File.Exists(savePath + filename))
                    {
                        Random rnd = new Random((int)DateTime.Now.Ticks);
                        int random = rnd.Next(0, 999999999);
                        filename = random + filename;
                    }
                    //original
                    byte[] originaldata = new Byte[pic.ContentLength];
                    pic.InputStream.Read(originaldata, 0, pic.ContentLength);
                    string stpath = savePath + filename;
                    FileStream originalPic = new FileStream(savePath + filename, FileMode.Create);
                    originalPic.Write(originaldata, 0, pic.ContentLength);

                    //change size
                    //byte[] smalldata = ResizeFromStream(width, height, originalPic, filename);
                    //FileStream smallPic = new FileStream(savePath + filename, FileMode.Create);
                    //smallPic.Write(smalldata, 0, smalldata.Length);
                    //smallPic.Close();

                    //close
                    originalPic.Close();

                }
            }
            return filename;
        }

        public static string UploadAndResizeImage(string filename, HttpPostedFile pic, string savePath, int width, int height)//Save Path Bayad Ba Server.MapPath Bashad
        {
            //string filename = string.Empty;
            if (pic.ContentLength != 0)
            {
                if (pic.ContentType == "image/jpeg" || pic.ContentType == "image/pjpeg" || pic.ContentType == "image/x-png" || pic.ContentType == "image/gif" || pic.ContentType == "image/png" || pic.ContentType == "image/tiff")
                {
                    //filename = pic.FileName;
                    //Check TheFileExist
                    if (File.Exists(savePath + filename))
                    {
                        Random rnd = new Random((int)DateTime.Now.Ticks);
                        int random = rnd.Next(0, 999999999);
                        filename = random + filename;
                    }
                    //original
                    byte[] originaldata = new Byte[pic.ContentLength];
                    pic.InputStream.Read(originaldata, 0, pic.ContentLength);
                    string stpath = savePath + filename;
                    FileStream originalPic = new FileStream(savePath + "temp/" + filename, FileMode.Create);
                    originalPic.Write(originaldata, 0, pic.ContentLength);

                    //change size
                    byte[] smalldata = ResizeFromStream(width, height, originalPic, filename);
                    FileStream smallPic = new FileStream(savePath + filename, FileMode.Create);
                    smallPic.Write(smalldata, 0, smalldata.Length);
                    smallPic.Close();

                    //close
                    originalPic.Close();

                }
            }
            return filename;
        }

        public static string UploadAndResizeImage(string filename, HttpPostedFile pic, string savePath)//Save Path Bayad Ba Server.MapPath Bashad
        {
            //string filename = string.Empty;
            if (pic.ContentLength != 0)
            {
                if (pic.ContentType == "image/jpeg" || pic.ContentType == "image/pjpeg" || pic.ContentType == "image/x-png" || pic.ContentType == "image/gif" || pic.ContentType == "image/png" || pic.ContentType == "image/tiff")
                {
                    //filename = pic.FileName;
                    //Check TheFileExist
                    if (File.Exists(savePath + "original\\" + filename))
                    {
                        Random rnd = new Random((int)DateTime.Now.Ticks);
                        int random = rnd.Next(0, 999999999);
                        filename = random + filename;
                    }
                    //original
                    byte[] originaldata = new Byte[pic.ContentLength];
                    pic.InputStream.Read(originaldata, 0, pic.ContentLength);
                    string stpath = savePath + "original\\" + filename;
                    FileStream originalPic = new FileStream(savePath + "original\\" + filename, FileMode.Create);
                    originalPic.Write(originaldata, 0, pic.ContentLength);

                    //small  --> 100*80
                    byte[] smalldata = ResizeFromStream(100, 80, originalPic, filename);
                    FileStream smallPic = new FileStream(savePath + "small\\" + filename, FileMode.Create);
                    smallPic.Write(smalldata, 0, smalldata.Length);
                    smallPic.Close();


                    //medium  --> 220*180
                    byte[] mediumdata = ResizeFromStream(220, 180, originalPic, filename);
                    FileStream mediumPic = new FileStream(savePath + "medium\\" + filename, FileMode.Create);
                    mediumPic.Write(mediumdata, 0, mediumdata.Length);
                    mediumPic.Close();

                    //large  --> 550*450
                    byte[] largedata = ResizeFromStream(550, 450, originalPic, filename);
                    FileStream largePic = new FileStream(savePath + "large\\" + filename, FileMode.Create);
                    largePic.Write(largedata, 0, largedata.Length);
                    largePic.Close();

                    //close
                    originalPic.Close();

                }
            }
            return filename;
        }

        public static byte[] ResizeFromStream(int intNewWidth, int intNewHeight, Stream Buffer, string fileName)
        {
            byte[] byteArray = null;  // really make this an error gif 

            try
            {

                Bitmap bitMap = new Bitmap(Buffer);
                int intOldWidth = bitMap.Width;
                int intOldHeight = bitMap.Height;


                Size ThumbNailSize = new Size(intNewWidth, intNewHeight);
                System.Drawing.Image oImg = System.Drawing.Image.FromStream(Buffer);
                System.Drawing.Image oThumbNail = new Bitmap(ThumbNailSize.Width, ThumbNailSize.Height);

                Graphics oGraphic = Graphics.FromImage(oThumbNail);
                oGraphic.CompositingQuality = CompositingQuality.HighQuality;
                oGraphic.SmoothingMode = SmoothingMode.HighQuality;
                oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                Rectangle oRectangle = new Rectangle
                    (0, 0, ThumbNailSize.Width, ThumbNailSize.Height);

                oGraphic.DrawImage(oImg, oRectangle);

                MemoryStream ms = new MemoryStream();
                oThumbNail.Save(ms, ImageFormat.Jpeg);
                byteArray = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length));

                oGraphic.Dispose();
                oImg.Dispose();
                ms.Close();
                ms.Dispose();
            }
            catch (Exception)
            {
                Bitmap bitMap = new Bitmap(intNewWidth, intNewHeight);
                Graphics g = Graphics.FromImage(bitMap);
                g.FillRectangle(new SolidBrush(Color.Gray), new Rectangle(0, 0, intNewWidth, intNewHeight));

                Font font = new Font("Courier", 8);
                SolidBrush solidBrush = new SolidBrush(Color.Red);
                g.DrawString("Failed File", font, solidBrush, 10, 5);
                g.DrawString(fileName, font, solidBrush, 10, 50);

                MemoryStream ms = new MemoryStream();
                bitMap.Save(ms, ImageFormat.Jpeg);
                byteArray = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length));

                ms.Close();
                ms.Dispose();
                bitMap.Dispose();
                solidBrush.Dispose();
                g.Dispose();
                font.Dispose();

            }
            return byteArray;
        }

        public static Bitmap CreateThumbnail(string lcFilename, int lnWidth, int lnHeight)
        {

            System.Drawing.Bitmap bmpOut = null;

            try
            {
                Bitmap loBMP = new Bitmap(lcFilename);
                ImageFormat loFormat = loBMP.RawFormat;

                decimal lnRatio;
                int lnNewWidth = 0;
                int lnNewHeight = 0;

                if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)
                    return loBMP;

                if (loBMP.Width > loBMP.Height)
                {
                    lnRatio = (decimal)lnWidth / loBMP.Width;
                    lnNewWidth = lnWidth;
                    decimal lnTemp = loBMP.Height * lnRatio;
                    lnNewHeight = (int)lnTemp;
                }
                else
                {
                    lnRatio = (decimal)lnHeight / loBMP.Height;
                    lnNewHeight = lnHeight;
                    decimal lnTemp = loBMP.Width * lnRatio;
                    lnNewWidth = (int)lnTemp;
                }


                bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
                Graphics g = Graphics.FromImage(bmpOut);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
                g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);

                loBMP.Dispose();
            }
            catch
            {
                return null;
            }
            return bmpOut;
        }

        public static byte[] ResizeFromByteArray(int intNewWidth, int intNewHeight, Byte[] byteArrayIn, string fileName)
        {
            byte[] byteArray = null;  // really make this an error gif
            MemoryStream ms = new MemoryStream(byteArrayIn);
            byteArray = ResizeFromStream(intNewWidth, intNewHeight, ms, fileName);

            return byteArray;
        }

        public static byte[] ResizeFromStream(int MaxSideSize, Stream Buffer, string fileName)
        {
            byte[] byteArray = null;  // really make this an error gif 

            try
            {

                Bitmap bitMap = new Bitmap(Buffer);
                int intOldWidth = bitMap.Width;
                int intOldHeight = bitMap.Height;

                int intNewWidth;
                int intNewHeight;

                int intMaxSide;

                if (intOldWidth >= intOldHeight)
                {
                    intMaxSide = intOldWidth;
                }
                else
                {
                    intMaxSide = intOldHeight;
                }

                if (intMaxSide > MaxSideSize)
                {
                    //set new width and height
                    double dblCoef = MaxSideSize / (double)intMaxSide;
                    intNewWidth = Convert.ToInt32(dblCoef * intOldWidth);
                    intNewHeight = Convert.ToInt32(dblCoef * intOldHeight);
                }
                else
                {
                    intNewWidth = intOldWidth;
                    intNewHeight = intOldHeight;
                }

                Size ThumbNailSize = new Size(intNewWidth, intNewHeight);
                System.Drawing.Image oImg = System.Drawing.Image.FromStream(Buffer);
                System.Drawing.Image oThumbNail = new Bitmap(ThumbNailSize.Width, ThumbNailSize.Height);

                Graphics oGraphic = Graphics.FromImage(oThumbNail);
                oGraphic.CompositingQuality = CompositingQuality.HighQuality;
                oGraphic.SmoothingMode = SmoothingMode.HighQuality;
                oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                Rectangle oRectangle = new Rectangle
                    (0, 0, ThumbNailSize.Width, ThumbNailSize.Height);

                oGraphic.DrawImage(oImg, oRectangle);

                MemoryStream ms = new MemoryStream();
                oThumbNail.Save(ms, ImageFormat.Jpeg);
                byteArray = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length));

                oGraphic.Dispose();
                oImg.Dispose();
                ms.Close();
                ms.Dispose();
            }
            catch (Exception)
            {
                int newSize = MaxSideSize - 20;
                Bitmap bitMap = new Bitmap(newSize, newSize);
                Graphics g = Graphics.FromImage(bitMap);
                g.FillRectangle(new SolidBrush(Color.Gray), new Rectangle(0, 0, newSize, newSize));

                Font font = new Font("Courier", 8);
                SolidBrush solidBrush = new SolidBrush(Color.Red);
                g.DrawString("Failed File", font, solidBrush, 10, 5);
                g.DrawString(fileName, font, solidBrush, 10, 50);

                MemoryStream ms = new MemoryStream();
                bitMap.Save(ms, ImageFormat.Jpeg);
                byteArray = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length));

                ms.Close();
                ms.Dispose();
                bitMap.Dispose();
                solidBrush.Dispose();
                g.Dispose();
                font.Dispose();

            }
            return byteArray;
        }

    }
}
