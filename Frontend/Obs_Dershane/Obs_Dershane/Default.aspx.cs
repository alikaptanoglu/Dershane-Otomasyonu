using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Obs_Dershane
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString);
        
        protected void btn_login_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            SqlDataReader oku;
            komut.CommandText = "SELECT * FROM ogrenci WHERE ogr_id=" +ogr_no.Text.ToString() + " AND ogr_tc=" + ogr_tc.Text.ToString();
            komut.Connection = baglanti;
           
            try
            {
                oku = komut.ExecuteReader();
                if (oku.Read())
                {
                    string id = oku[0].ToString();
                    Server.Transfer("ObsControl.aspx?ogr_no=" + id);
                    oku.Close();
                }
                else
                {
                    uyari.Visible = true;
                    hataligiris.Text = "Öğrenci Bulunamadı";
                    // Response.Write("<script LANGUAGE='JavaScript' >alert('Kayıtlı Öğrenci Bulunamadı. Bilgilerinizi tekrar kontrol ediniz.')</script>");
                }
                baglanti.Close();
            }
            catch(Exception ex)
            {
                    uyari.Visible = true;
                     hataligiris.Text = "Öğrenci Bulunamadı";
                //   Response.Write("<script LANGUAGE='JavaScript' >alert('Kayıtlı Öğrenci Bulunamadı. Bilgilerinizi tekrar kontrol ediniz...')</script>");   
            }
            baglanti.Close();
        }

        protected void ogr_no_bul_Click(object sender, EventArgs e)
        {
            
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            SqlDataReader oku;
            komut.CommandText = "SELECT ogr_id FROM ogrenci WHERE ogr_tc=" +ogr_tc_okul_no.Text.ToString();
            komut.Connection = baglanti;
            try
            {
                oku = komut.ExecuteReader();
                if (oku.Read())
                {
                    ogr_no.Text = oku[0].ToString();
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Kayıtlı Öğrenci Bulunamadı. Bilgilerinizi tekrar kontrol ediniz.')</script>");
                }
            }
            catch
            {
                
                Response.Write("<script LANGUAGE='JavaScript' >alert('Kayıtlı Öğrenci Bulunamadı. Bilgilerinizi tekrar kontrol ediniz.')</script>");
            }
            baglanti.Close();
        }
    }
}