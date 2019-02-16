using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Obs_Dershane
{
    public partial class ObsControl : System.Web.UI.Page
    {
        int ogr_id;
        string ogr_tc;
        string ogr_ad;
        string ogr_soyad;
        string ogr_veli_ad;
        string ogr_veli_soyad;
        string ogr_sube_harf;
        string ogr_sube_seviye;
        string ogr_alan;
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString);

        

        protected void Page_Load(object sender, EventArgs e)
        {
            ogr_id = Convert.ToInt32(Request.QueryString["ogr_no"]); //Öğrenci ID
            ogr_giris_no.Text = ogr_id.ToString();


            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            SqlDataReader oku;
            komut.CommandText = "SELECT o.ogr_tc , o.ogr_ad,o.ogr_soyad,v.veli_ad,v.veli_soyad,s.sube_harf,s.sube_seviye,a.alan_ad FROM ogrenci o inner join veli v on o.veli_id = v.veli_id inner join sube s on o.sube_id = s.sube_id inner join alan a on s.alan_id = a.alan_id where o.ogr_id =" + ogr_id.ToString();
            komut.Connection = baglanti;
            oku = komut.ExecuteReader();
            if (oku.Read())
            {
                ogr_tc = oku[0].ToString();
                ogr_ad = oku[1].ToString();
                ogr_soyad = oku[2].ToString();
                ogr_veli_ad = oku[3].ToString();
                ogr_veli_soyad = oku[4].ToString();
                ogr_sube_harf = oku[5].ToString();
                ogr_sube_seviye = oku[6].ToString();
                ogr_alan = oku[7].ToString();
                ogr_detay_ad.Text = ogr_ad.ToString();
                ogr_head_ad.Text = ogr_ad.ToString();
                ogr_head_ad1.Text = ogr_ad.ToString();
                ogr_detay_soyad.Text = ogr_soyad.ToString();
                ogr_detay_tc.Text = ogr_tc.ToString();
                ogr_detay_veli_ad.Text = ogr_veli_ad.ToString();
                ogr_detay_veli_soyad.Text = " " + ogr_veli_soyad.ToString();
                ogr_detay_sube_seviye.Text = ogr_sube_seviye.ToString();
                ogr_detay_sube_harf.Text = ogr_sube_harf.ToString();
                ogr_detay_sube_alan.Text = ogr_alan.ToString();
                ogr_detay_numara.Text = ogr_id.ToString();
                oku.Close();
            }
            komut.CommandText = "SELECT COUNT(ogr_id) FROM devamsizlik WHERE ogr_id=" + ogr_id.ToString();
            oku = komut.ExecuteReader();
            if (oku.Read())
            {
                Devamsizlik.Text = oku[0].ToString();
                Devamsizlik_kalan_gün.Text = (20 - Convert.ToInt32(oku[0].ToString())).ToString();
                if (Convert.ToInt32(Devamsizlik_kalan_gün.Text) <= 0)
                {
                    Devamsizlik_kalan_gün.Text = "DEVAMSIZLIK GÜN SINIRINI AŞTINIZ.";
                }
                oku.Close();
            }


            /// Deneme ve devamsızlık bilgileri getirme
            SqlDataAdapter adtr = new SqlDataAdapter("SELECT deneme_id AS 'Deneme no', ogrenci_deneme_id AS 'Öğr. Den. No' , turkce_net AS 'Türkçe Net' , matematik_net AS 'Matematik Net', sosyal_net AS 'Sosyal Net', fen_net AS 'Fen Net', puan_ygs_1 AS 'YGS 1', puan_ygs_2 AS 'YGS 2', puan_ygs_3 AS 'YGS 3', puan_ygs_4 AS 'YGS 4', puan_ygs_1 AS 'YGS 5', puan_ygs_6 AS 'YGS 6'  FROM ogrenci_deneme WHERE ogr_id=" + ogr_id.ToString(),baglanti);
            DataTable dTable = new DataTable();
           

            adtr.SelectCommand.ExecuteNonQuery(); // deneme
            adtr.Fill(dTable);
            ogr_deneme_bilgileri.DataSource = dTable;
            ogr_deneme_bilgileri.DataBind();
            baglanti.Close();



        }

      

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}