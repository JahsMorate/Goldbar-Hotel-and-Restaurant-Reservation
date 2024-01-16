using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Smart_Hotel_Restaurant
{
    public class Utils
    {
        public static string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value) // if waray pictures na e butang ang user , ang mo tunga kay ang default images
            {
                url1 = "../Images/NO_images.jpg"; // No_image.png ang default image.
            }
            else
            {
                url1 = string.Format("../{0}", url);
            }
            //return ResolveUrl(url1)
            return url1;
        }

        public static string PasswordsCrip(string password)
        {
            SHA1CryptoServiceProvider shaCrp = new SHA1CryptoServiceProvider();
            byte[] password_bytes = Encoding.ASCII.GetBytes(password);
            byte[] encrypted_byeSha = shaCrp.ComputeHash(password_bytes);
            return Convert.ToBase64String(encrypted_byeSha);
        }

        public static string ReleaseCrip(string Rdecryption)
        {
            byte[] b;
            string release;
            b = Convert.FromBase64String(Rdecryption);
            release = System.Text.ASCIIEncoding.ASCII.GetString(b);
            return release;
        }
    }
}