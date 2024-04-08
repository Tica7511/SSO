using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Security.Cryptography;
using System.Text;
using WKF;
using AUTH;

/// <summary>
/// UOF_DAL 的摘要描述
/// </summary>
public class UOF_DAL
{
    XmlDocument xmlDoc = new XmlDocument();
    Wkf wkf = new Wkf();

    public UOF_DAL()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public XmlNode GetXmlNode(string fieldid)
    {
        return xmlDoc.SelectSingleNode(string.Format("/Form/FormFieldValue/FieldItem[@fieldId='{0}']", fieldid));
    }

    public XmlNode GetXmlNode(string xpath, string fieldid)
    {
        return xmlDoc.SelectSingleNode(string.Format(xpath + "[@fieldId='{0}']", fieldid));
    }

    public string GetToken(string account, string password)
    {
        Authentication auth = new Authentication();
        return auth.GetToken("EDE_UOF", RSAEncrypt(account), RSAEncrypt(password));
    }

    public string SendForm(string token, string xmlforminfo)
    {
        return wkf.SendForm(token, xmlforminfo);
    }

    public string GetTaskResult(string token, string taskid)
    {
        return wkf.GetTaskResult(token, taskid, "false");
    }

    private string RSAEncrypt(string crText)
    {
        //公鑰
        string publicKey = "PFJTQUtleVZhbHVlPjxNb2R1bHVzPm5QN1QwNEgzdXdodTQyVlhCMklkSUFneDAwVFB0VkFvblhla1M1TnkvWG16UStoSU1YYjgvczJFZXEzWTFxVkxrYWlRZE54bU56VWZZYmoySitPM3Z1bUYvOXNQdjFTSmpLRkl0K1oxeG5CZFVVOXh3ZHpPS0IyVktSWFFVdjZYSzd0eWVURHEyZFV3Znl0OGlDa0gzYVRQTnVTMmllR2I4cVU3czRDbGc1RT08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";

        RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
        byte[] base64PublicKey = Convert.FromBase64String(publicKey);
        rsa.FromXmlString(System.Text.Encoding.UTF8.GetString(base64PublicKey));
        byte[] ctTextArray = Encoding.UTF8.GetBytes(crText);
        byte[] decodeBs = rsa.Encrypt(ctTextArray, false);

        return Convert.ToBase64String(decodeBs);
    }
}