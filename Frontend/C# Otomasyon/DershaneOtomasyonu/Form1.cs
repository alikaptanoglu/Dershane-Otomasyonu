using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DershaneOtomasyonu
{
    public partial class Form1 : Form
    {
        SqlConnection baglanti = new SqlConnection("Data Source = .; Initial Catalog = proje; Integrated Security = True");
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        byte[] yetki = {0,0,0,0,0,0,0};
        string[] kullaniciBilgi = { "" ,""};

        private void btn_GirisYap_Click(object sender, EventArgs e)
        {
         
            baglanti.Open();

            SqlCommand komut = new SqlCommand("select ogretmen_islemleri,veli_ogrenci_islemleri,ders_islemleri,sinav_islemleri,kullanici_islemleri,devamsizlik_islemleri,arsiv_islemleri,kullanici_ad,son_giris_tarih  from kullanicilar where (kullanici_ad = '" + txt_Kadi.Text.ToString() + "' and kullanici_sifre = '" + txt_Ksifre.Text.ToString() + "'  )", baglanti);
            SqlDataReader oku = komut.ExecuteReader();
            while (oku.Read())
            {
                yetki[0] = Convert.ToByte(oku[0]);
                yetki[1] = Convert.ToByte(oku[1]);
                yetki[2] = Convert.ToByte(oku[2]);
                yetki[3] = Convert.ToByte(oku[3]);
                yetki[4] = Convert.ToByte(oku[4]);
                yetki[5] = Convert.ToByte(oku[5]);
                yetki[6] = Convert.ToByte(oku[6]);
                kullaniciBilgi[0] = oku[7].ToString(); //kullanıcı adını aldık.
                kullaniciBilgi[1] = oku[8].ToString(); // son giris tarihi

               // MessageBox.Show("Giriş Başarılı, "+ kullaniciBilgi[0] + " olarak oturum açıldı.");

                YonetimPaneli gir = new YonetimPaneli(yetki,kullaniciBilgi);
                gir.Show();
                this.Hide();

            }

            baglanti.Close();
        }
    }
}
