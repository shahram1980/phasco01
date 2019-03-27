using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;


namespace NewFifa
{
    public class ImageHelper
    {

        public static string UploadAndResizeImage(HttpPostedFile pic, string savePath, string filename, int width, int height)//Save Path Bayad Ba Server.MapPath Bashad
        {
          
            if (pic.ContentLength != 0)
            {
                if (pic.ContentType == "image/jpeg" || pic.ContentType == "image/gif" || pic.ContentType == "image/png" || pic.ContentType == "image/tiff")
                {
                   // filename = pic.FileName;
                    //Check TheFileExist
                    //if (File.Exists(savePath + Folder + pic.FileName))
                    //{
                    //    Random rnd = new Random((int)DateTime.Now.Ticks);
                    //    int random = rnd.Next(0, 999999999);
                    //    filename = random + filename;
                    //}
                    //original
                    byte[] originaldata = new Byte[pic.ContentLength];
                    pic.InputStream.Read(originaldata, 0, pic.ContentLength);
                    FileStream originalPic = new FileStream(savePath + "\\Orginal\\" + filename, FileMode.Create);
                    originalPic.Write(originaldata, 0, pic.ContentLength);

                    ////small  --> 45*65
                    //byte[] smalldata = ResizeFromStream(45, 65, originalPic, filename);
                    //FileStream smallPic = new FileStream(savePath + Folder + filename, FileMode.Create);
                    //smallPic.Write(smalldata, 0, smalldata.Length);
                    //smallPic.Close();

                    ////medium  --> 90*120
                    //byte[] mediumdata = ResizeFromStream(90, 120, originalPic, filename);
                    //FileStream mediumPic = new FileStream(savePath + Folder + filename, FileMode.Create);
                    //mediumPic.Write(mediumdata, 0, mediumdata.Length);
                    //mediumPic.Close();

                    //large  --> 225*300
                    byte[] largedata = ResizeFromStream(width, height, originalPic, filename);
                    FileStream largePic = new FileStream(savePath  + "\\Small\\"+filename, FileMode.Create);
                    largePic.Write(largedata, 0, largedata.Length);
                    largePic.Close();

                    //close
                    originalPic.Close();
                }
            }
            return filename;
        }

        public static int SaveToDisk(HttpPostedFile pic)
        {
            return 0;
        }

        public static void UploadImage(string address, string filename)
        {
            //if (!Directory.Exists(MapPath(@"Uploaded-Files")))
            //{
            //    // If it doesn't then we just create it before going any further
            //    Directory.CreateDirectory(MapPath(@"Uploaded-Files"));
            //}

            // Specify the upload directory
            //string directory = Server.MapPath(@"Uploaded-Files\");

            // Create a bitmap of the content of the fileUpload control in memory
            Bitmap originalBMP = new Bitmap(filename);

            // Calculate the new image dimensions
            int origWidth = originalBMP.Width;
            int origHeight = originalBMP.Height;
            int sngRatio = origWidth / origHeight;
            int newWidth = 100;
            int newHeight = newWidth / sngRatio;

            // Create a new bitmap which will hold the previous resized bitmap
            Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
            // Create a graphic based on the new bitmap
            Graphics oGraphics = Graphics.FromImage(newBMP);

            // Set the properties for the new graphic file
            oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            // Draw the new graphic based on the resized bitmap
            oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

            // Save the new graphic file to the server
            newBMP.Save("" + "tn_" + filename);

            // Once finished with the bitmap objects, we deallocate them.
            originalBMP.Dispose();
            newBMP.Dispose();
            oGraphics.Dispose();

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
        public static byte[] AddWaterMark(Byte[] byteArrayIn, string watermarkText, Brush brushcolor)
        {
            byte[] byteArray = null;
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image img = System.Drawing.Image.FromStream(ms);

            ImageCodecInfo jgpEncoder = GetEncoder(ImageFormat.Jpeg);
            Encoder myEncoder = Encoder.Quality;
            EncoderParameters myEncoderParameters = new EncoderParameters(1);
            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 75L);
            myEncoderParameters.Param[0] = myEncoderParameter;

            Graphics gr = Graphics.FromImage(img);
            gr.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
            gr.DrawString(watermarkText, new Font("Tahoma", 10), brushcolor, new Point(0, 0));

            MemoryStream output = new MemoryStream();
            img.Save(output, jgpEncoder, myEncoderParameters);
            byteArray = new byte[output.Length];
            output.Position = 0;
            output.Read(byteArray, 0, Convert.ToInt32(output.Length));
            return byteArray;
        }
        public static byte[] AddWaterMarkWithQualitySetting(Byte[] byteArrayIn, string watermarkText, Brush brushcolor)
        {
            byte[] byteArray = null;
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image img = System.Drawing.Image.FromStream(ms);

            ImageCodecInfo jgpEncoder = GetEncoder(ImageFormat.Jpeg);
            Encoder myEncoder = Encoder.Quality;
            EncoderParameters myEncoderParameters = new EncoderParameters(1);
            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 75L); //%75
            myEncoderParameters.Param[0] = myEncoderParameter;

            Graphics gr = Graphics.FromImage(img);
            gr.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
            gr.DrawString(watermarkText, new Font("Tahoma", 10), brushcolor, new Point(0, 0));

            MemoryStream output = new MemoryStream();
            img.Save(output, jgpEncoder, myEncoderParameters);
            byteArray = new byte[output.Length];
            output.Position = 0;
            output.Read(byteArray, 0, Convert.ToInt32(output.Length));
            return byteArray;
        }
        private static ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();

            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }
    }
}
