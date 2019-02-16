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
using System.Data.Common;
using System.Data.OleDb; // Excel Açma.
using Excel1 = Microsoft.Office.Interop.Excel; //excel export için.
using System.Net;
using System.IO;

namespace DershaneOtomasyonu
{
    public partial class YonetimPaneli : Form
    {
        
        SqlConnection baglanti = new SqlConnection("Data Source = .; Initial Catalog = proje; Integrated Security = True");
        string hoca_id;
        string ogr_id;
        string ders_id;
        string kitap_id;
        string devamsizlik_ogr_id_ekleme;
        string devamsizlik_ogr_id_sil;
        string devamsizlik_tarih_sil;
        string alan_ders_id;
        string kullanici_id;
        string silinen_ogrenci_id;
        string silinen_ogretmen_id;
        string sinif_id;
        string[] raporPaket = { "","","",""}; // RAPORA Gönderilecek String Değerler için String Dizisi Oluşturulur.
        

        byte[] kullaniciYetkileri = { 0, 0, 0, 0, 0, 0, 0 }; // kullancii yetkileri güncelleme için lazım.

        string hedef; //excel hedef yolu için.




        byte[] yetkimiz = {0,0,0,0,0,0,0 };
        string[] kullaniciBilgileri = { "" , "" };
        public YonetimPaneli(byte[] yetki, string[] kullaniciBilgi)
        {
            yetkimiz[0] = yetki[0];
            yetkimiz[1] = yetki[1];
            yetkimiz[2] = yetki[2];
            yetkimiz[3] = yetki[3];
            yetkimiz[4] = yetki[4];
            yetkimiz[5] = yetki[5];
            yetkimiz[6] = yetki[6];//yetkiler form1 den alındı

            kullaniciBilgileri[0] = kullaniciBilgi[0]; //kullanıcı adı ' aldık.
            kullaniciBilgileri[1] = kullaniciBilgi[1];

            InitializeComponent();
        }
        private void YonetimPaneli_Load(object sender, EventArgs e)
        {
            //kullanıcı bilgileri yüklenir.
            lblKullaniciBilgileri.Text = "Kullanıcı : "+ kullaniciBilgileri[0].ToUpper() + "        Son Giriş tarihi : "+ kullaniciBilgileri[1];


            //yetkiler kontrol edilip ona göre formları açılır / kapatılır
            if (yetkimiz[6] == 0)
            { tabControl1.TabPages.Remove(tabPage8); }
            if (yetkimiz[5] == 0)
            { tabControl1.TabPages.Remove(tabPage7); }
            if (yetkimiz[4] == 0)
            { tabControl1.TabPages.Remove(tabPage6); }
            if (yetkimiz[3] == 0)
            { tabControl1.TabPages.Remove(tabPage5); }
            if (yetkimiz[2] == 0)
            { tabControl1.TabPages.Remove(tabPage4); }
            if (yetkimiz[1] == 0)
            { tabControl1.TabPages.Remove(tabPage3); }
            if (yetkimiz[0] == 0)
            { tabControl1.TabPages.Remove(tabPage2); }

            Ogrenci_Getir();
            Ogretmen_Getir();
            Ders_Getir();
            Kitap_Getir();
            Kullanicilar_Getir();
            Silinen_Ogrenci_Getir();
            Silinen_Ogretmen_Getir();
            Islem_Kayit_Getir();
            Islem_Kayit_Getir2("");
            btnSiniflar_Click(sender, e);

        }
        private string XMLPOST(string PostAddress, string xmlData) // sms post işlemi
        {
            try
            {
                var res = "";
                byte[] bytes = Encoding.UTF8.GetBytes(xmlData);
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(PostAddress);

                request.Method = "POST";
                request.ContentLength = bytes.Length;
                request.ContentType = "text/xml";
                request.Timeout = 300000000;
                using (Stream requestStream = request.GetRequestStream())
                {
                    requestStream.Write(bytes, 0, bytes.Length);
                }

                // This sample only checks whether we get an "OK" HTTP status code back.
                // If you must process the XML-based response, you need to read that from
                // the response stream.
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    if (response.StatusCode != HttpStatusCode.OK)
                    {
                        string message = String.Format(
                        "POST failed. Received HTTP {0}",
                        response.StatusCode);
                        throw new ApplicationException(message);
                    }

                    Stream responseStream = response.GetResponseStream();
                    using (StreamReader rdr = new StreamReader(responseStream))
                    {
                        res = rdr.ReadToEnd();
                    }
                    MessageBox.Show("Mesajınız iletilmiştir.");
                    return res;
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("GÖNDERME İŞLEMİ BAŞARISIZ..." + ex.ToString());
                return "-1";
            }

        }
        public void Kullanicilar_Getir()
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Kullanicilar", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView7.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
        }
        public void Silinen_Ogretmen_Getir() {

            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Silinen_Ogretmen", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView11.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
        }
        private void button2_Click(object sender, EventArgs e)
        {
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
           
        }

        public void Ogrenci_Getir()
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Ogrenci", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView1.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            
        }
        public void Ogretmen_Getir()
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Ogretmen", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView3.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.

        }
        public void Ders_Getir()
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Ders", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView2.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
        }

        public void Kitap_Getir()
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Kitap", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.

        }
        public void Silinen_Ogrenci_Getir()
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Silinen_Ogrenci", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView10.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
        }
        public void Islem_Kayit(string islem_tip,string islem,DateTime zaman)
        {
            try
            {

            
            // kullaniciBilgileri[0] --> Kullanıcının adı.
            
            SqlCommand komut2 = new SqlCommand("insert into islemler values( '"+ kullaniciBilgileri[0] + "','"+ islem_tip + "','"+ islem + "' ,'" + zaman.ToString("yyyy-MM-dd HH:mm:ss") + "') ", baglanti);
            
            komut2.CommandType = CommandType.Text;
            komut2.ExecuteNonQuery();

            //ne baglanti.open yaptık ne de close  , çünkü bu fonksiyonu çağıran fonksiyonlar zaten en baş ve sonda open close yapıyor. burada yapmaya kalkarsak hata verir.

            btnIslemGecmisYenile_Click(null,null); // islemler butonuna tıklama gönderiyorzuz ki işlemler tablosu yenilensin.
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void Islem_Kayit_Getir() // Database Yedeklemesi Kayıtları Getirme
        {
            try
            {
            //son, veritabanı yedekten geri çağıran kişi ve  yaptığı andaki tarihi getirir.
            string strkomut = "SELECT kullanici_ad,tarih FROM islemler WHERE(tarih IN(SELECT max(tarih) FROM islemler where islem_tip = 'db import'))";
            SqlDataAdapter komut = new SqlDataAdapter(strkomut, baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.
            
            //DataGridView sanal = new DataGridView();
            sanalDataGridView3.DataSource = veritutucu.Tables[0];
            if(sanalDataGridView3.Rows[0].Cells[0].Value != null)
                lblSonDbImport.Text= "Son Veritabanı Yedeğini İçeriye Alan :" + sanalDataGridView3.Rows[0].Cells[0].Value.ToString().ToUpper() + "  Tarih : "+ sanalDataGridView3.Rows[0].Cells[1].Value.ToString();
            sanalDataGridView3.Columns.Clear();

              



                //son, veritabanı yedek alan kişi ve tarihi.
                strkomut = "SELECT kullanici_ad,tarih FROM islemler WHERE(tarih IN(SELECT max(tarih) FROM islemler where islem_tip = 'db export'))";
            komut = new SqlDataAdapter(strkomut, baglanti);

            veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            //sanal = new DataGridView();
            sanalDataGridView3.DataSource = veritutucu.Tables[0];
            if (sanalDataGridView3.Rows[0].Cells[0].Value != null)
                lblSonDbExport.Text = "Son Veritabanı Yedeklemesi Yapan :" + sanalDataGridView3.Rows[0].Cells[0].Value.ToString().ToUpper() + "  Tarih : " + sanalDataGridView3.Rows[0].Cells[1].Value.ToString();
            sanalDataGridView3.Columns.Clear();
            }
            catch (Exception)
            {


            }
        }
        public void Islem_Kayit_Getir2(string tablo) // Database Yedeklemesi Kayıtları Getirme
        {
            try
            {
                if (tablo == "")
                {
                    lblSonTableImport.Text = "Bu Tablo Geri Yüklemesi Yapılmadı";
                    lblSonTableExport.Text = "Bu Tablo Yedeklemesi Yapılmadı";
                    return;
                }
                baglanti.Open();
                //son, veritabanı yedekten geri çağıran kişi ve  yaptığı andaki tarihi getirir.
                string strkomut = "SELECT kullanici_ad,tarih FROM islemler WHERE(tarih IN(SELECT max(tarih) FROM islemler where ( islem_tip = 'table import' and (islem like '%"+tablo+"%' ))))";
                SqlDataAdapter komut = new SqlDataAdapter(strkomut, baglanti);

                DataSet veritutucu = new DataSet();

                komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

                //DataGridView sanal = new DataGridView();
                sanalDataGridView3.DataSource = veritutucu.Tables[0];
                if (sanalDataGridView3.Rows[0].Cells[0].Value != null)
                    lblSonTableImport.Text = tablo + "'e Son Geri Yükleme Yapan :" + sanalDataGridView3.Rows[0].Cells[0].Value.ToString().ToUpper() + "  Tarih : " + sanalDataGridView3.Rows[0].Cells[1].Value.ToString();
                else
                    lblSonTableImport.Text = "Bu Tablo Geri Yüklemesi Yapılmadı";
                sanalDataGridView3.Columns.Clear();





                //son, veritabanı yedek alan kişi ve tarihi.
                strkomut = "SELECT kullanici_ad,tarih FROM islemler WHERE(tarih IN(SELECT max(tarih) FROM islemler where ( islem_tip = 'table export' and (islem like '%" + tablo + "%' ))))";
                komut = new SqlDataAdapter(strkomut, baglanti);

                veritutucu = new DataSet();

                komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

                //sanal = new DataGridView();
                sanalDataGridView3.DataSource = veritutucu.Tables[0];
                if (sanalDataGridView3.Rows[0].Cells[0].Value != null)
                    lblSonTableExport.Text = tablo + "'e Son Yedekleme Yapan :" + sanalDataGridView3.Rows[0].Cells[0].Value.ToString().ToUpper() + "  Tarih : " + sanalDataGridView3.Rows[0].Cells[1].Value.ToString();
                else
                    lblSonTableExport.Text = "Bu Tablo Yedeklemesi Yapılmadı";
                sanalDataGridView3.Columns.Clear();

                baglanti.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                baglanti.Close();

            }
        }

        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e) // ÖĞRETMEN DATA GRİT 'i
        {
            try
            {

                int secilen = dataGridView3.SelectedCells[0].RowIndex;

            hoca_id = dataGridView3.Rows[secilen].Cells[0].Value.ToString(); //hoca id elimize alırız. güncelleme işlemi olursa diye bu değişken global de tanımlandı.
            string ad = dataGridView3.Rows[secilen].Cells[1].Value.ToString();
            string soyad = dataGridView3.Rows[secilen].Cells[2].Value.ToString();
            string tel = dataGridView3.Rows[secilen].Cells[3].Value.ToString();
            string ucret = dataGridView3.Rows[secilen].Cells[4].Value.ToString();
            string tc = dataGridView3.Rows[secilen].Cells[5].Value.ToString();
            string kayit = dataGridView3.Rows[secilen].Cells[6].Value.ToString();


            txtHocaAd.Text = ad;
            txtHocaSoyad.Text = soyad;
            txtHocaTc.Text = tc;
            txtHocaTel.Text = tel;
            txtHocaUcret.Text = ucret;
            dtpHocaKayit.Value = (Convert.ToDateTime(kayit));


            // Güncelle kısmına değişken hazırlama.

            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }




}

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {

            
            int secilen = dataGridView1.SelectedCells[0].RowIndex;

            ogr_id = dataGridView1.Rows[secilen].Cells[0].Value.ToString(); //hoca id elimize alırız. güncelleme işlemi olursa diye bu değişken global de tanımlandı.
            string ad = dataGridView1.Rows[secilen].Cells[1].Value.ToString();
            string soyad = dataGridView1.Rows[secilen].Cells[2].Value.ToString();
            string seviye = dataGridView1.Rows[secilen].Cells[3].Value.ToString();
            string sinif = dataGridView1.Rows[secilen].Cells[4].Value.ToString();
            string tc = dataGridView1.Rows[secilen].Cells[6].Value.ToString();
            string tel = dataGridView1.Rows[secilen].Cells[7].Value.ToString();
            string adres = dataGridView1.Rows[secilen].Cells[8].Value.ToString();
            string okul = dataGridView1.Rows[secilen].Cells[9].Value.ToString();
            string kayit = dataGridView1.Rows[secilen].Cells[10].Value.ToString();
            string dogum = dataGridView1.Rows[secilen].Cells[11].Value.ToString();
            string ucret = dataGridView1.Rows[secilen].Cells[12].Value.ToString();
            string veli_ad = dataGridView1.Rows[secilen].Cells[13].Value.ToString();
            string veli_soyad = dataGridView1.Rows[secilen].Cells[14].Value.ToString();
            string veli_tc = dataGridView1.Rows[secilen].Cells[15].Value.ToString();
            string veli_tel = dataGridView1.Rows[secilen].Cells[16].Value.ToString();


            txtOgrNo.Text = ogr_id;
            txtOgrAd.Text = ad;
            txtOgrSoyad.Text = soyad;
            txtOgrSeviye.Text = seviye;
            txtOgrHarf.Text = sinif;
            txtOgrTc.Text = tc;
            txtOgrTel.Text = tel;
            txtOgrAdres.Text = adres;
            txtOgrOkul.Text = okul;
            dtpOgrKayit.Value = (Convert.ToDateTime(kayit));
            dtpOgrDogum.Value = (Convert.ToDateTime(dogum));
            txtOgrUcret.Text = ucret;
            txtVeliAd.Text = veli_ad;
            txtVeliSoyad.Text = veli_soyad;
            txtVeliTc.Text = veli_tc;
            txtVeliTel.Text = veli_tel;
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }
        }
        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            


        }

        public void Belli_Alan_Dersleri_Getirme() // DERS OLAYLARI.
        {
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Alan_Dersleri_Ara", baglanti);
            komut.Parameters.Add("@ders_id", ders_id);
            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView5.Columns.Clear();
            dataGridView5.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView5.Refresh();
            baglanti.Close();
        }
        public void Belli_Kitaplari_Getirme()
        {
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Kitap_Ara", baglanti);
            komut.Parameters.Add("@ders_id", ders_id);
            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView4.Columns.Clear();
            dataGridView4.DataSource = veritutucu.Tables[0];
            dataGridView4.Refresh();
            baglanti.Close();
        }

        private void btn_Ogretmen_Liste_Yenile_Click(object sender, EventArgs e)
        {
            Ogretmen_Getir();
        }


        private void btn_Ogrenci_Liste_Yenile_Click(object sender, EventArgs e)
        {
            Ogrenci_Getir();

        }

        

        private void btn_Deneme_Listele_Click(object sender, EventArgs e)
        {
            if (!(cbSeviye.Text == "9" || cbSeviye.Text == "10" || cbSeviye.Text == "11" || cbSeviye.Text == "12")) // arama text'imiz boş ise bütün öğrencileri getirtip fonksiyonu bitirir.
            {
                MessageBox.Show("Deneme Seviyesi 9/10/11/12 den farklı olamaz");
                return;
            }

            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ogrenci_Deneme_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@deneme_seviye", cbSeviye.Text);
            komut.Parameters.Add("@deneme_tarih", dtpOgrenciDeneme.Value.ToString("yyyy-MM-dd"));//
            
            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView6.Columns.Clear();
            dataGridView6.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView6.Refresh();
            baglanti.Close();
        }

       

        private void chbOgrenciFiltre_CheckedChanged(object sender, EventArgs e)
        {
            if (chbOgrenciFiltre.Checked == true)
            {
                cmbOgrenciFiltre.Enabled = true;
                cmbOgrenciFiltre.Text = "Öğrenci Ad";
            }
            else
            {
                cmbOgrenciFiltre.Enabled = false;
                cmbOgrenciFiltre.Text = "Genel";
            }
        }
        

        private void txtKitapAra_TextChanged(object sender, EventArgs e)
        {
            DataSet veritutucu = new DataSet();
            SqlCommand komut;
            SqlDataAdapter adapter;
            if (txtKitapAra.Text.Trim() == "") 
            {
                veritutucu = new DataSet();
                baglanti.Open();
                komut = new SqlCommand("SP_Kitap_Ara", baglanti);
                komut.Parameters.Add("@ders_id", ders_id);
                komut.CommandType = CommandType.StoredProcedure;
                adapter = new SqlDataAdapter(komut);

                adapter.Fill(veritutucu);

                dataGridView4.Columns.Clear();
                dataGridView4.DataSource = veritutucu.Tables[0]; 
                dataGridView4.Refresh();
                baglanti.Close();
                return;
            }
            veritutucu = new DataSet();
            baglanti.Open();
            komut = new SqlCommand("SP_Kitap_Ara_Kelimeli", baglanti);
            komut.Parameters.Add("@kelime", txtKitapAra.Text);
            komut.Parameters.Add("@ders_id", ders_id);
            komut.CommandType = CommandType.StoredProcedure;
            adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView4.Columns.Clear();
            dataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView4.Refresh();
            baglanti.Close();
        }

        private void btnDenemeEkle_Click(object sender, EventArgs e)
        {
            if (!(cmbDenemeSeviye.Text == "9" || cmbDenemeSeviye.Text == "10" || cmbDenemeSeviye.Text == "11" || cmbDenemeSeviye.Text == "12")) // arama text'imiz boş ise bütün öğrencileri getirtip fonksiyonu bitirir.
            {
                MessageBox.Show("Deneme Seviyesi 9/10/11/12 den farklı olamaz");
                return;
            }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Deneme_Ekle", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@deneme_seviye", cmbDenemeSeviye.Text);
            komut.Parameters.Add("@deneme_tarih", dtpDenemeEkle.Value.ToString("yyyy-MM-dd"));
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            MessageBox.Show("Deneme Eklenmiştir");
            baglanti.Close();
        }

        private void btnDevamsizlikAra_Click(object sender, EventArgs e)
        {
            

            if (chbDevamsizlikNo.Checked==true && chbDevamsizlikTarih.Checked == false) // tarhisiz öğrenci devamsızlık ara.
            {


                DataSet veritutucu = new DataSet();
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SP_Devamsizlik_Nolu_Ara", baglanti);
                komut.Parameters.Add("@ogr_id", txtDevamsizlikOgrenciNo.Text);

                komut.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(komut);

                adapter.Fill(veritutucu);

                dataGridView9.Columns.Clear();
                dataGridView9.DataSource = veritutucu.Tables[0];
                dataGridView9.Refresh();
                baglanti.Close();
            }
            else if (chbDevamsizlikNo.Checked == true && chbDevamsizlikTarih.Checked == true) // tarihli öğrenci no'lu devamsızlık ara
            {
                if (txtDevamsizlikOgrenciNo.Text.Trim() == "") // arama text'imiz boş ise bitir.
                {
                    MessageBox.Show("Öğrenci Numarası Giriniz.");
                    return;
                }
                DataSet veritutucu = new DataSet();
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SP_Devamsizlik_Nolu_Tarihli_Ara", baglanti);
                komut.Parameters.Add("@ogr_id", txtDevamsizlikOgrenciNo.Text); 
                komut.Parameters.Add("@tarih", dtpOgrenciDevamsizlikAra.Value.ToString("yyyy-MM-dd"));
                komut.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(komut);

                adapter.Fill(veritutucu);

                dataGridView9.Columns.Clear();
                dataGridView9.DataSource = veritutucu.Tables[0];
                dataGridView9.Refresh();
                baglanti.Close();
            }
            else if(chbDevamsizlikNo.Checked == false && chbDevamsizlikTarih.Checked == true) // sadece tarih ile tüm devamsızlığı çek
            {
                DataSet veritutucu = new DataSet();
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SP_Devamsizlik_Tarihli_Ara", baglanti);
                komut.Parameters.Add("@tarih", dtpOgrenciDevamsizlikAra.Value.ToString("yyyy-MM-dd"));
                komut.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(komut);

                adapter.Fill(veritutucu);

                dataGridView9.Columns.Clear();
                dataGridView9.DataSource = veritutucu.Tables[0];
                dataGridView9.Refresh();
                baglanti.Close();

            }
        }

        private void cmbSinifOgrencilerGetir_TextChanged(object sender, EventArgs e)
        {
            string whereKomutu="where ( s.sube_seviye = ";
            switch (cmbSinifOgrencilerGetir.Text)
            {
                case "9":
                    whereKomutu += "9 )";
                    break;
                case "10":
                    whereKomutu += "10 )";
                    break;
                case "11":
                    whereKomutu += "11 )";
                    break;
                case "12":
                    whereKomutu += "12 )";
                    break;

                default:
                    whereKomutu += "9 )";

                    break;
            }
            string strkomut = "Select s.sube_seviye as Seviye,s.sube_harf as Şube,o.ogr_id as Öğrenci_Numarası, o.ogr_ad as Öğrenci_İsmi,o.ogr_soyad as Öğrenci_Soyad From sube s inner join ogrenci o on s.sube_id=o.sube_id ";

            strkomut += whereKomutu;

            baglanti.Open();
            SqlDataAdapter komut = new SqlDataAdapter(strkomut, baglanti);
            DataSet veritutucu = new DataSet();
            komut.Fill(veritutucu);
            dataGridView8.DataSource = veritutucu.Tables[0];
            baglanti.Close();
        }

        private void dataGridView8_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            

        }

        private void btnDevamsizlikEkle_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Devamsizlik_Ekle", baglanti);
            komut.Parameters.Add("@ogr_id", devamsizlik_ogr_id_ekleme);
            komut.Parameters.Add("@tarih", dtpDevamsizlikEkle.Value.ToString("yyyy-MM-dd"));
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();


            //yanda otomatikman o gün ve numarasıyla demin girilen devamsızlık göstertmek için...
            chbDevamsizlikNo.Checked = true;
            chbDevamsizlikTarih.Checked = true;
            txtDevamsizlikOgrenciNo.Text = devamsizlik_ogr_id_ekleme;
            dtpOgrenciDevamsizlikAra.Value = dtpDevamsizlikEkle.Value; //DEVAMSIZLIK TARİHİ 
            btnDevamsizlikAra_Click(sender, e);
        }

        private void dataGridView9_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           


        }

        private void btnDevamsizlikSil_Click(object sender, EventArgs e)
        {
            if (devamsizlik_ogr_id_sil == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Devamsizlik_Sil", baglanti);
            komut.Parameters.Add("@ogr_id", devamsizlik_ogr_id_sil);
            komut.Parameters.Add("@tarih", devamsizlik_tarih_sil);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            devamsizlik_ogr_id_sil="";
            devamsizlik_tarih_sil="";

            btnDevamsizlikAra_Click(sender, e);
        }

        private void txtOgrenciAra_TextChanged(object sender, EventArgs e)
        {
            if (chbOgrenciFiltre.Checked == false)
            {
                if (txtOgrenciAra.Text.Trim() == "") // arama text'imiz boş ise bütün öğrencileri getirtip fonksiyonu bitirir.
                {
                    Ogrenci_Getir();
                    return;
                }
                DataSet veritutucu = new DataSet();
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SP_Ogrenci_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
                komut.Parameters.Add("@kelime", txtOgrenciAra.Text);

                komut.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(komut);

                adapter.Fill(veritutucu);

                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
                dataGridView1.Refresh();
                baglanti.Close();
            }
            else if (chbOgrenciFiltre.Checked == true)
            {
                string whereKomutu = "where (";

                switch (cmbOgrenciFiltre.Text) // COMBO BOX'tan neye göre arayacaksak onu ifade edecek bir sayı alıyoruz.
                {
                    case "Öğrenci Numara":
                        whereKomutu += " o.ogr_id ";
                        break;
                    case "Öğrenci Ad":
                        whereKomutu += " o.ogr_ad ";
                        break;
                    case "Öğrenci Soyad":
                        whereKomutu += " o.ogr_soyad ";
                        break;
                    case "Öğrenci TC":
                        whereKomutu += " o.ogr_tc ";
                        break;
                    case "Öğrenci Tel":
                        whereKomutu += " od.ogr_tel ";
                        break;
                    case "Sınıf Seviye":
                        whereKomutu += " s.sube_seviye ";
                        break;
                    case "Sınıf Harf":
                        whereKomutu += " s.sube_harf ";
                        break;
                    case "Öğrenci Okul":
                        whereKomutu += " od.ogr_okul ";
                        break;
                    case "Öğrenci Adres":
                        whereKomutu += " od.ogr_adres ";
                        break;
                    case "Ücret":
                        whereKomutu += " od.ogr_ucret ";
                        break;
                    case "Kayıt Tarih":
                        whereKomutu += " od.ogr_kayit_tar ";
                        break;
                    case "Doğum Tarih":
                        whereKomutu += " od.ogr_dogum_tar ";
                        break;
                    case "Veli Ad":
                        whereKomutu += " v.veli_ad ";
                        break;
                    case "Veli Soyad":
                        whereKomutu += " v.veli_soyad ";
                        break;
                    case "Veli Tel":
                        whereKomutu += " v.veli_tel ";
                        break;
                    case "Veli Tc":
                        whereKomutu += " o.veli_tc ";
                        break;
                    default:
                        whereKomutu += " o.ogr_ad ";
                        break;
                }
                // FİLTRELİ VERİYİ ÇEKERİZ

                // arama text'imiz boş ise bütün öğrencileri getirtip fonksiyonu bitirir.
                if (txtOgrenciAra.Text.Trim() == "")
                {
                    Ogrenci_Getir();
                    return;
                }

                //öğrenci arama komutu.. sonra bu komuta where komutumuzu ekleriz öğrenciyi özel bir alana göre aratırız.
                string strkomut = "Select o.ogr_id as Öğrenci_Numarası,o.ogr_ad as Öğrenci_İsmi,o.ogr_soyad as Öğrenci_Soyadı ,s.sube_seviye as Seviye,s.sube_harf as Sınıf,a.alan_ad as Alanı,o.ogr_tc as Öğrenci_TC,od.ogr_tel as Öğrenci_Telefon,od.ogr_adres as Öğrenci_Adres,od.ogr_okul as Okulu,od.ogr_kayit_tar as Kayıt_Tarihi,od.ogr_dogum_tar as Doğum_Tarihi,od.ogr_ucret as Alınan_Ücret,v.veli_ad as Veli_İsmi,v.veli_soyad as Veli_Soyismi,v.veli_tc as Veli_TC,v.veli_tel as Veli_Telefon from ogrenci o inner join ogrenci_detay od on o.ogr_id = od.ogr_id inner join veli v on v.veli_id=o.veli_id inner join sube s on s.sube_id=o.sube_id inner join alan a on a.alan_id=s.alan_id ";
                strkomut += whereKomutu;

                baglanti.Open();
                SqlDataAdapter komut = new SqlDataAdapter(strkomut + "like '%" + txtOgrenciAra.Text + "%' )", baglanti);
                DataSet veritutucu = new DataSet();
                komut.Fill(veritutucu);
                dataGridView1.DataSource = veritutucu.Tables[0];
                baglanti.Close();

            }
        }

        private void txtOgretmenAra_TextChanged(object sender, EventArgs e)
        {
            if (txtOgretmenAra.Text.Trim() == "") // arama text'imiz boş ise bütün öğretmenleri getirtip fonksiyonu bitirir.
            {
                Ogretmen_Getir();
                return;
            }
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ogretmen_Ara", baglanti);
            komut.Parameters.Add("@kelime", txtOgretmenAra.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView3.Columns.Clear();
            dataGridView3.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView3.Refresh();
            baglanti.Close();
        }

        private void btnHocaGuncelle_Click(object sender, EventArgs e)
        {
            if (txtHocaUcret.Text.Length == 0 )
            {
                MessageBox.Show("Ücret uzunluğu en az bir basamak olmalıdır.");
                return;
            }
            if ( txtHocaTel.Text.Length != 10 )
            {
                MessageBox.Show("Telefon 10 haneli olmalıdır. örneğin 5551234567");
                return;
            }
            if ( txtHocaTc.Text.Length != 11)
            {
                MessageBox.Show("Tc 11 haneden farklı olamaz.");
                return;
            }


            if (hoca_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Hoca_Guncelle", baglanti);
            komut.Parameters.Add("@hoca_id", hoca_id);
            komut.Parameters.Add("@yeni_hoca_ad", txtHocaAd.Text.ToString());
            komut.Parameters.Add("@yeni_hoca_soyad", txtHocaSoyad.Text.ToString());
            komut.Parameters.Add("@yeni_hoca_tel", txtHocaTel.Text.ToString());
            komut.Parameters.Add("@yeni_hoca_ucret", txtHocaUcret.Text);
            komut.Parameters.Add("@yeni_hoca_tc", txtHocaTc.Text.ToString());
            komut.Parameters.Add("@yeni_hoca_kayit_tarih", dtpHocaKayit.Value.ToString("yyyy-MM-dd"));
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Hoca Güncellendi");
            //eski veriler silinir.
            hoca_id = null;

            Ogretmen_Getir();
        }

        private void btnHocaSil_Click(object sender, EventArgs e)
        {
            if (hoca_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Hoca_Sil", baglanti);
            komut.Parameters.Add("@hoca_id", hoca_id);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();
            //eski veriler silinir.
            hoca_id = null;
            MessageBox.Show("Hoca Silindi.");
            Ogretmen_Getir();
            Silinen_Ogretmen_Getir();
        }

        private void btnHocaEkle_Click(object sender, EventArgs e)
        {
            if (txtYeniHocaUcret.Text.Length == 0)
            {
                MessageBox.Show("Ücret uzunluğu en az bir basamak olmalıdır.");
                return;
            }
            if(txtYeniHocaTel.Text.Length != 10)
            {
                MessageBox.Show("Telefon 10 haneli olmalıdır. örneğin 5551234567");
                return;
            }
            if (txtYeniHocaTc.Text.Length != 11)
            {
                MessageBox.Show("Tc 11 haneden farklı olamaz.");
                return;
            }

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Hoca_ekle", baglanti);
            komut.Parameters.Add("@ad", txtYeniHocaAd.Text.ToString());
            komut.Parameters.Add("@soyad", txtYeniHocaSoyad.Text.ToString());
            komut.Parameters.Add("@tel", txtYeniHocaTel.Text.ToString());
            komut.Parameters.Add("@ucret", txtYeniHocaUcret.Text);
            komut.Parameters.Add("@tc", txtYeniHocaTc.Text.ToString());
            komut.Parameters.Add("@kayit_tarih", dtpYeniHocaKayitTarih.Value.ToString("yyyy-MM-dd"));
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Hoca Eklendi");
            Ogretmen_Getir();
        }

        private void btnOgrenciSil_Click(object sender, EventArgs e)
        {
            if (ogr_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ogrenci_Sil", baglanti);
            komut.Parameters.Add("@ogr_id", ogr_id);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            ogr_id = null;
            MessageBox.Show("Öğrenci Silindi.");
            Ogrenci_Getir();
            Silinen_Ogrenci_Getir();
        }

        private void btnOgrenciEkle_Click(object sender, EventArgs e)
        {
            if (txtOgrUcret.Text.Length == 0 )
            {
                MessageBox.Show("Ücret uzunluğu en az bir basamak olmalıdır.");
                return;
            }
            if (txtOgrTel.Text.Length != 10)
            {
                MessageBox.Show("Öğrenci telefon 10 haneli olmalıdır. örneğin 5551234567");
                return;
            }
            if (txtVeliTel.Text.Length != 10)
            {
                MessageBox.Show("Veli telefon 10 haneli olmalıdır. örneğin 5551234567");
                return;
            }
            if (txtOgrTc.Text.Length != 11)
            {
                MessageBox.Show("Öğrenci Tc 11 haneden farklı olamaz.");
                return;
            }
            if (txtVeliTc.Text.Length != 11)
            {
                MessageBox.Show("Veli Tc 11 haneden farklı olamaz.");
                return;
            }
            if (txtOgrSeviye.Text == "")
            {
                MessageBox.Show("Öğrenci seviyesini giriniz.");
                return;
            }
            if (txtOgrHarf.Text == "")
            {
                MessageBox.Show("Öğrenci seviyesinin şube harfini giriniz.");
                return;
            }

                        baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Veli_Ogrenci_Ekle", baglanti);
            komut.Parameters.Add("@veli_ad", txtVeliAd.Text.ToString());
            komut.Parameters.Add("@veli_soyad", txtVeliSoyad.Text.ToString());
            komut.Parameters.Add("@veli_tel", txtVeliTel.Text.ToString());
            komut.Parameters.Add("@veli_tc", txtVeliTc.Text.ToString());
            komut.Parameters.Add("@ogr_tc", txtOgrTc.Text.ToString());
            komut.Parameters.Add("@ogr_ad", txtOgrAd.Text.ToString());
            komut.Parameters.Add("@ogr_soyad", txtOgrSoyad.Text.ToString());
            komut.Parameters.Add("@ogr_seviye", txtOgrSeviye.Text.ToString());
            komut.Parameters.Add("@ogr_harf", txtOgrHarf.Text.ToString());
            komut.Parameters.Add("@ogr_tel", txtOgrTel.Text.ToString());
            komut.Parameters.Add("@ogr_adres", txtOgrAdres.Text.ToString());
            komut.Parameters.Add("@ogr_okul", txtOgrOkul.Text.ToString());
            komut.Parameters.Add("@ogr_kayit_tar", dtpOgrKayit.Value.ToString("yyyy-MM-dd"));
            komut.Parameters.Add("@ogr_dogum_tar", dtpOgrDogum.Value.ToString("yyyy-MM-dd"));
            komut.Parameters.Add("@ogr_ucret", txtOgrUcret.Text.ToString());
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Öğrenci Eklendi.");
            Ogrenci_Getir();
        }

        private void btnOgrenciGuncelle_Click(object sender, EventArgs e)
        {
            
            
            if (txtOgrUcret.Text.Length == 0)
            {
                MessageBox.Show("Ücret uzunluğu en az bir basamak olmalıdır.");
                return;
            }
            if (txtOgrTel.Text.Length != 10)
            {
                MessageBox.Show("Öğrenci telefon 10 haneli olmalıdır. örneğin 5551234567");
                return;
            }
            if (txtOgrTc.Text.Length != 11)
            {
                MessageBox.Show("Öğrenci Tc 11 haneden farklı olamaz.");
                return;
            }
            if (txtOgrSeviye.Text == "")
            {
                MessageBox.Show("Öğrenci seviyesini giriniz.");
                return;
            }
            if (txtOgrHarf.Text == "")
            {
                MessageBox.Show("Öğrenci seviyesinin şube harfini giriniz.");
                return;
            }

            if (ogr_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ogrenci_Guncelle", baglanti);
            komut.Parameters.Add("@ogr_id", ogr_id);
            komut.Parameters.Add("@yeni_ogr_ad", txtOgrAd.Text.ToString());
            komut.Parameters.Add("@yeni_ogr_soyad", txtOgrSoyad.Text.ToString());
            komut.Parameters.Add("@yeni_ogr_tel", txtOgrTel.Text.ToString());
            komut.Parameters.Add("@yeni_ogr_adres", txtOgrAdres.Text.ToString());
            komut.Parameters.Add("@yeni_ogr_okul", txtOgrOkul.Text.ToString());
            komut.Parameters.Add("@yeni_ogr_ucret", txtOgrUcret.Text.ToString());
            komut.Parameters.Add("@yeni_ogr_dogum_tar", dtpOgrDogum.Value.ToString("yyyy-MM-dd"));
            komut.Parameters.Add("@yeni_ogr_kayit_tar", dtpOgrKayit.Value.ToString("yyyy-MM-dd"));
            komut.Parameters.Add("@yeni_ogr_tc", txtOgrTc.Text.ToString());
            komut.Parameters.Add("@yeni_seviye", txtOgrSeviye.Text.ToString());
            komut.Parameters.Add("@yeni_harf", txtOgrHarf.Text.ToString());
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Öğrenci Güncellendi.");
            //eski veriler silinir.
            ogr_id = null;

            Ogrenci_Getir();
        }

        private void btnVeliGuncelle_Click(object sender, EventArgs e)
        {
           
            if (txtVeliTel.Text.Length != 10)
            {
                MessageBox.Show("Veli telefon 10 haneli olmalıdır. örneğin 5551234567");
                return;
            }
            if (txtVeliTc.Text.Length != 11)
            {
                MessageBox.Show("Veli Tc 11 haneden farklı olamaz.");
                return;
            }

            if (ogr_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Veli_Guncelle", baglanti);
            komut.Parameters.Add("@ogr_id", ogr_id);
            komut.Parameters.Add("@yeni_veli_tc", txtVeliTc.Text.ToString());
            komut.Parameters.Add("@yeni_veli_ad", txtVeliAd.Text.ToString());
            komut.Parameters.Add("@yeni_veli_soyad", txtVeliSoyad.Text.ToString());
            komut.Parameters.Add("@yeni_veli_tel", txtVeliTel.Text.ToString());
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();
            //eski veriler silinir.
            ogr_id = null;

            Ogrenci_Getir();
        }

        private void btnDersEkle_Click(object sender, EventArgs e)
        {
            if (txtDersAd.Text.ToString().Trim() == "" || cmbDersSeviye.Text.ToString().Trim() == "")
            {
                MessageBox.Show("Boş Değer Girilemez.");
                return;
            }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Dersler_Ekle", baglanti);
            komut.Parameters.Add("@ad",txtDersAd.Text.ToString());
            komut.Parameters.Add("@seviye", cmbDersSeviye.Text.ToString());
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            Ders_Getir();
        }

        private void btnDersSil_Click(object sender, EventArgs e)
        {
            if (ders_id == null)
            { MessageBox.Show("id alınamadı");return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ders_Sil", baglanti);
            komut.Parameters.Add("@ders_id", ders_id);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            ders_id = null;

            Ders_Getir();
        }

        private void btnDersGuncelle_Click(object sender, EventArgs e)
        {
            if (txtDersAd.Text.ToString().Trim() == "" || cmbDersSeviye.Text.ToString().Trim() == "")
            {
                MessageBox.Show("Boş Değer Girilemez.");
                return;
            }
            if (ders_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ders_Guncelle", baglanti);
            komut.Parameters.Add("@ders_id", ders_id);
            komut.Parameters.Add("@yeni_ders_ad", txtDersAd.Text.ToString());
            komut.Parameters.Add("@yeni_ders_seviye", cmbDersSeviye.Text.ToString());
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            ders_id = null;

            Ders_Getir();
        }

        private void btnDersleriGetir_Click(object sender, EventArgs e)
        {
            Ders_Getir();
        }

        private void btnDerseHocaEkle_Click(object sender, EventArgs e)
        {
            if (txtDersHocaTc.Text.Length != 11)
            {
                MessageBox.Show("Hoca Tc'si 11 haneden farklı olamaz.");
                return;
            }
            try
            {
            if (ders_id == null)
            { MessageBox.Show("ders id alınamadı"); return; }
            

                baglanti.Open();
                SqlCommand komut = new SqlCommand("SP_Hoca_Dersleri_Ekle", baglanti);
                komut.Parameters.Add("@hoca_tc", txtDersHocaTc.Text.ToString());
                komut.Parameters.Add("@ders_id", ders_id);
                komut.CommandType = CommandType.StoredProcedure;
                komut.ExecuteNonQuery();

            }
            catch (Exception)
            {
                MessageBox.Show("Seçili Ders için zaten hoca bulunmakta, ilk önce dersin hocasını dersten siliniz.");
            }
            finally {

                baglanti.Close();
            }

            //eski veriler silinir.
            ders_id = null;

            Ders_Getir();
        }

        private void btnHocaDersSil_Click(object sender, EventArgs e)
        {
            if(txtDersHocaTc.Text.Length != 11)
            {
                MessageBox.Show("Hoca Tc'si 11 den farklı olamaz.");
                return;
            }
            if (ders_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Hoca_Ders_Sil", baglanti);
            komut.Parameters.Add("@hoca_tc", txtDersHocaTc.Text.ToString());
            komut.Parameters.Add("@ders_id", ders_id);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            ders_id = null;

            Ders_Getir();
        }

       

        private void txtDersAra_TextChanged(object sender, EventArgs e)
        {
            

            if (txtDersAra.Text.Trim() == "") // arama text'imiz boş ise bütün öğretmenleri getirtip fonksiyonu bitirir.
            {
                Ders_Getir();
                return;
            }
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Ders_Ara", baglanti);
            komut.Parameters.Add("@kelime", txtDersAra.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView2.Columns.Clear();
            dataGridView2.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView2.Refresh();
            baglanti.Close();
        }

        private void btnDerseAlanEkle_Click(object sender, EventArgs e)
        {
            string alan = null;

            foreach (RadioButton item1 in panel1.Controls)
            {
                if (item1.Checked == true)
                {
                    alan=item1.Text.ToString().ToLower();
                }
            }

            if (alan == null)
            {   MessageBox.Show("alan seç"); return; }

            if (ders_id == null)
            { MessageBox.Show("ders id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Alan_Dersleri_Ekle", baglanti);
            komut.Parameters.Add("@ders_id", ders_id);
            komut.Parameters.Add("@alan_ad", alan);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            Belli_Alan_Dersleri_Getirme();


        }

        private void btnDersAlanSil_Click(object sender, EventArgs e)
        {
            if (alan_ders_id == null)
            { MessageBox.Show("Ders Seçiniz."); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Alan_Ders_Sil ", baglanti);
            komut.Parameters.Add("@alan_dersleri_id", alan_ders_id);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            alan_ders_id = null;

            Belli_Alan_Dersleri_Getirme();
        }

        private void dataGridView5_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            { 
            int secilen = dataGridView5.SelectedCells[0].RowIndex;

            alan_ders_id = dataGridView5.Rows[secilen].Cells[0].Value.ToString();
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }
}

        private void btnKitaplariGetir_Click(object sender, EventArgs e)
        {
            Kitap_Getir();
        }

        private void dataGridView4_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                
            int secilen = dataGridView4.SelectedCells[0].RowIndex;

            kitap_id = dataGridView4.Rows[secilen].Cells[0].Value.ToString();
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }
}

        private void btnKitapSil_Click(object sender, EventArgs e)
        {
            if (kitap_id == null)
            { MessageBox.Show("id alınamadı"); return; }
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Kitap_Sil", baglanti);
            komut.Parameters.Add("@kitap_id", kitap_id);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //eski veriler silinir.
            kitap_id = null;
            Belli_Kitaplari_Getirme();
        }

        private void btnKitapEkle_Click(object sender, EventArgs e)
        {
            if (txtKitapUcret.Text.Length == 0 )
            {
                MessageBox.Show("Kitap ücreti en az 1 basamak olmalı");
                return;
            }

            if (ders_id == null)
                { MessageBox.Show("id alınamadı"); return; }
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SP_Kitaplar_Ekle", baglanti);
                komut.Parameters.Add("@ders_id", ders_id);
                komut.Parameters.Add("@kitap_ad", txtKitapAd.Text.ToString());
                komut.Parameters.Add("@kitap_yayin", txtKitapYayin.Text.ToString());
                komut.Parameters.Add("@kitap_ucret", Convert.ToInt16(txtKitapUcret.Text));
                komut.CommandType = CommandType.StoredProcedure;
                komut.ExecuteNonQuery();
                baglanti.Close();

                Belli_Kitaplari_Getirme();
            
        }

        private void dataGridView7_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            { 
            int secilen = dataGridView7.SelectedCells[0].RowIndex;

            kullanici_id = dataGridView7.Rows[secilen].Cells[0].Value.ToString();
            lblKullanici.Text = dataGridView7.Rows[secilen].Cells[1].Value.ToString();
            kullaniciYetkileri[0] = Convert.ToByte(dataGridView7.Rows[secilen].Cells[2].Value);
            kullaniciYetkileri[1] = Convert.ToByte(dataGridView7.Rows[secilen].Cells[3].Value);
            kullaniciYetkileri[2] = Convert.ToByte(dataGridView7.Rows[secilen].Cells[4].Value);
            kullaniciYetkileri[3] = Convert.ToByte(dataGridView7.Rows[secilen].Cells[5].Value);
            kullaniciYetkileri[4] = Convert.ToByte(dataGridView7.Rows[secilen].Cells[6].Value);
            kullaniciYetkileri[5] = Convert.ToByte(dataGridView7.Rows[secilen].Cells[7].Value);

            chbOgretmenIslemleri.Checked = false;
            chbVeliOgrenciIslemleri.Checked = false;
            chbDersIslemleri.Checked = false;
            chbSinavIslemleri.Checked = false;
            chbKullaniciIslemleri.Checked = false;
            chbArsivIslemleri.Checked = false;

            if (kullaniciYetkileri[0] == 1)
            {
                chbOgretmenIslemleri.Checked = true;
            }
            if (kullaniciYetkileri[1] == 1)
            {
                chbVeliOgrenciIslemleri.Checked = true;
            }
            if (kullaniciYetkileri[2] == 1)
            {
                chbDersIslemleri.Checked = true;
            }
            if (kullaniciYetkileri[3] == 1)
            {
                chbSinavIslemleri.Checked = true;
            }
            if (kullaniciYetkileri[4] == 1)
            {
                chbKullaniciIslemleri.Checked = true;
            }
            if (kullaniciYetkileri[5] == 1)
            {
                chbArsivIslemleri.Checked = true;
            }
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }
}

        private void dataGridView7_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btnKullaniciGuncelle_Click(object sender, EventArgs e)
        {
            if (kullanici_id == null)
            { MessageBox.Show("id alınamadı"); return; }


            byte[] kullaniciYeniYetkileri = { 0, 0, 0, 0, 0, 0, 0};

            if (chbOgretmenIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[0] = 1;
            }
            if (chbVeliOgrenciIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[1] = 1;
            }
            if (chbDersIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[2] = 1;
            }
            if (chbSinavIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[3] = 1;
            }
            if (chbKullaniciIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[4] = 1;
            }
            if (chbDevamsizlikIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[5] = 1;
            }
            if (chbArsivIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[6] = 1;
            }

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Kullanici_Yetki_Guncelle", baglanti);
            komut.Parameters.Add("@kullanici_id", kullanici_id);
            komut.Parameters.Add("@ogretmen_islemleri", kullaniciYeniYetkileri[0]);
            komut.Parameters.Add("@veli_ogrenci_islemleri", kullaniciYeniYetkileri[1]);
            komut.Parameters.Add("@ders_islemleri", kullaniciYeniYetkileri[2]);
            komut.Parameters.Add("@sinav_islemleri", kullaniciYeniYetkileri[3]);
            komut.Parameters.Add("@kullanici_islemleri", kullaniciYeniYetkileri[4]);
            komut.Parameters.Add("@devamsizlik_islemleri", kullaniciYeniYetkileri[5]);
            komut.Parameters.Add("@arsiv_islemleri", kullaniciYeniYetkileri[6]);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            //işi biten veriyi sil
            kullanici_id = null;

            Kullanicilar_Getir();
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            { 

            int secilen = dataGridView2.SelectedCells[0].RowIndex;


            ders_id = dataGridView2.Rows[secilen].Cells[0].Value.ToString(); //hoca id elimize alırız. güncelleme işlemi olursa diye bu değişken global de tanımlandı.
            string ders_ad = dataGridView2.Rows[secilen].Cells[1].Value.ToString();
            string ders_seviye = dataGridView2.Rows[secilen].Cells[2].Value.ToString();
            string hoca_tc = dataGridView2.Rows[secilen].Cells[5].Value.ToString();


            txtDersAd.Text = ders_ad;
            cmbDersSeviye.Text = ders_seviye;
            txtKitapDersAd.Text = ders_ad;
            txtKitapDersSeviye.Text = ders_seviye;
            txtDersHocaTc.Text = hoca_tc;

            //ALANLARI GETİRTME ---------------

            Belli_Alan_Dersleri_Getirme();
            //KİTAPLARI GETİRTME -------------------
            Belli_Kitaplari_Getirme();
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }

}

        private void dataGridView8_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
            int secilen = dataGridView8.SelectedCells[0].RowIndex;


            devamsizlik_ogr_id_ekleme = dataGridView8.Rows[secilen].Cells[2].Value.ToString();
            txtDevamsizlikEkleOgrenciNo.Text = devamsizlik_ogr_id_ekleme;
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }

}

        private void dataGridView9_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            { 
            int secilen = dataGridView9.SelectedCells[0].RowIndex;


            devamsizlik_ogr_id_sil = dataGridView9.Rows[secilen].Cells[0].Value.ToString();
            devamsizlik_tarih_sil = dataGridView9.Rows[secilen].Cells[3].Value.ToString();

            // SQL'den Gelen TARİHİ PARÇALAYIP DÜZENE SOKMA İŞLEMLERİ...

            string[] dizi = devamsizlik_tarih_sil.Split('.');
            // dizi[0] -> gün
            // dizi[1] -> ay
            // dizi[2] -> yıl ve saat ... yıl kısmını almalıyız. sadece ilk 4 karakteri.
            dizi[2] = dizi[2].Remove(4);

            //en son bu veriler , tekrar sql 'e gidecek şekilde biçimlendirilir.
            devamsizlik_tarih_sil = dizi[2] + "-" + dizi[1] + "-" + dizi[0];
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }

}

        private void cbSeviye_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label39_Click(object sender, EventArgs e)
        {

        }

        private void dtpOgrenciDeneme_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label40_Click(object sender, EventArgs e)
        {

        }

        private void btnSinavRapor_Click(object sender, EventArgs e)
        {
            

            raporPaket[0] = "Sınav"; // Rapor'u belli edecek bir anahtar kelime. diğer formda buna bakarak TabControl Açacağız.
            raporPaket[1] = cbSeviye.Text.ToString();
            raporPaket[2] = dtpOgrenciDeneme.Value.ToString("yyyy-MM-dd");

            int[] size = { 995, 597 };
            RaporForm gir = new RaporForm(raporPaket, size);
            gir.Show();
        }

        private void btnKullaniciEkle_Click(object sender, EventArgs e)
        {
            if (txtKullaniciAd.Text.ToString().Trim() == "" || txtKullaniciSifre.Text.ToString().Trim() == "")
            {
                MessageBox.Show("kullanıcı ad veya şifre boş bırakılamaz.");
                return ;
            }

            byte[] kullaniciYeniYetkileri = { 0, 0, 0, 0, 0, 0, 0 };

            if (chbOgretmenIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[0] = 1;
            }
            if (chbVeliOgrenciIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[1] = 1;
            }
            if (chbDersIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[2] = 1;
            }
            if (chbSinavIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[3] = 1;
            }
            if (chbKullaniciIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[4] = 1;
            }
            if (chbDevamsizlikIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[5] = 1;
            }
            if (chbArsivIslemleri.Checked == true)
            {
                kullaniciYeniYetkileri[6] = 1;
            }

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Kullanici_Ekle", baglanti);
            komut.Parameters.Add("@kullanici_ad", txtKullaniciAd.Text.ToString());
            komut.Parameters.Add("@kullanici_sifre", txtKullaniciSifre.Text.ToString());
            komut.Parameters.Add("@ogretmen_islemleri", kullaniciYeniYetkileri[0]);
            komut.Parameters.Add("@veli_ogrenci_islemleri", kullaniciYeniYetkileri[1]);
            komut.Parameters.Add("@ders_islemleri", kullaniciYeniYetkileri[2]);
            komut.Parameters.Add("@sinav_islemleri", kullaniciYeniYetkileri[3]);
            komut.Parameters.Add("@kullanici_islemleri", kullaniciYeniYetkileri[4]);
            komut.Parameters.Add("@devamsizlik_islemleri", kullaniciYeniYetkileri[5]);
            komut.Parameters.Add("@arsiv_islemleri", kullaniciYeniYetkileri[6]);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();

            Kullanicilar_Getir();

        }

        private void btnKullaniciSil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Delete from kullanicilar where kullanici_id ="+ kullanici_id.ToString(), baglanti);
            komut.CommandType = CommandType.Text;
            komut.ExecuteNonQuery();
            baglanti.Close();

            
            kullanici_id = null;//veri temizle

            Kullanicilar_Getir();
        }

        private void btnOgretmenRapor_Click(object sender, EventArgs e)
        {
            raporPaket[0] = "Öğretmen"; // Rapor'u belli edecek bir anahtar kelime. diğer formda buna bakarak TabControl Açacağız.
            raporPaket[1] = txtOgretmenAra.Text.ToString();

            int[] size = { 610, 597 }; //width, height
            RaporForm gir = new RaporForm(raporPaket, size);
            gir.Show();
        }

        private void btnOgrenciRapor_Click(object sender, EventArgs e)
        {
            raporPaket[0] = "Öğrenci"; // Rapor'u belli edecek bir anahtar kelime. diğer formda buna bakarak TabControl Açacağız.
            raporPaket[1] = txtOgrenciAra.Text.ToString();

            int[] size = { 1090, 597 }; // width , height

            RaporForm gir = new RaporForm(raporPaket, size);
            gir.Show();
        }

        private void btnHocaExcelImport_Click(object sender, EventArgs e)
        {

            try
            {
            //excel i Sanal Data Grid ' e Yükleme
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK) //excel ' i seçer
            {
                hedef = openFileDialog1.FileName;
            }
            OleDbConnection con1 = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + hedef + "; Extended Properties='Excel 12.0 xml;HDR=YES;'");
            con1.Open();
            OleDbDataAdapter da = new OleDbDataAdapter("select * from [sayfa1$]", con1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sanalDataGridView.DataSource = dt.DefaultView;
            con1.Close();


            // excel ' i Sql aktarma.
           SqlCommand cmd = new SqlCommand("SP_Hoca_ekle", baglanti); // SQL PROSEDUR
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ad", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@soyad", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@tel", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@ucret", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@tc", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@kayit_tarih", SqlDbType.Date));
            baglanti.Open();
            foreach (DataGridViewRow row in sanalDataGridView.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;
                    cmd.Parameters["@ad"].Value = row.Cells[0].Value;
                    cmd.Parameters["@soyad"].Value = row.Cells[1].Value;
                    cmd.Parameters["@tel"].Value = row.Cells[2].Value;
                    cmd.Parameters["@ucret"].Value = row.Cells[3].Value;
                    cmd.Parameters["@tc"].Value = row.Cells[4].Value;
                    cmd.Parameters["@kayit_tarih"].Value = row.Cells[5].Value;
                    cmd.ExecuteNonQuery();
                }
            }
            MessageBox.Show("Veriler Yüklenmiştir.");
            baglanti.Close();

            hedef = null;//hedef temizlenir.
            sanalDataGridView.Columns.Clear(); // sanal tablo temizlenir.

            Ogretmen_Getir(); // öğretmen çağrılır.
            }
            catch (Exception ex)
            {
                MessageBox.Show("Karşılaşılan Hata, " + ex.Message);
            }
            finally
            {
                baglanti.Close();
            }
        }

        private void btnOgrenciExcelImport_Click(object sender, EventArgs e)
        {
            try
            {
            //excel i Sanal Data Grid ' e Yükleme
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK) //excel ' i seçer
            {
                hedef = openFileDialog1.FileName;
            }
            OleDbConnection con1 = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + hedef + "; Extended Properties='Excel 12.0 xml;HDR=YES;'");
            con1.Open();
            OleDbDataAdapter da = new OleDbDataAdapter("select * from [sayfa1$]", con1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sanalDataGridView.DataSource = dt.DefaultView;
            con1.Close();
            

            // excel ' i Sql aktarma.
            SqlCommand cmd = new SqlCommand("SP_Veli_Ogrenci_ekle", baglanti);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@veli_ad", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@veli_soyad", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@veli_tel", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@veli_tc", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@ogr_tc", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@ogr_ad", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ogr_soyad", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ogr_seviye", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ogr_harf", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@ogr_tel", SqlDbType.Char));
            cmd.Parameters.Add(new SqlParameter("@ogr_adres", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ogr_okul", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ogr_kayit_tar", SqlDbType.Date));
            cmd.Parameters.Add(new SqlParameter("@ogr_dogum_tar", SqlDbType.Date));
            cmd.Parameters.Add(new SqlParameter("@ogr_ucret", SqlDbType.Int));

            baglanti.Open();
            foreach (DataGridViewRow row in sanalDataGridView.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;
                    cmd.Parameters["@veli_ad"].Value = row.Cells[0].Value;
                    cmd.Parameters["@veli_soyad"].Value = row.Cells[1].Value;
                    cmd.Parameters["@veli_tel"].Value = row.Cells[2].Value;
                    cmd.Parameters["@veli_tc"].Value = row.Cells[3].Value;
                    cmd.Parameters["@ogr_tc"].Value = row.Cells[4].Value;
                    cmd.Parameters["@ogr_ad"].Value = row.Cells[5].Value;
                    cmd.Parameters["@ogr_soyad"].Value = row.Cells[6].Value;
                    cmd.Parameters["@ogr_seviye"].Value = row.Cells[7].Value;
                    cmd.Parameters["@ogr_harf"].Value = row.Cells[8].Value;
                    cmd.Parameters["@ogr_tel"].Value = row.Cells[9].Value;
                    cmd.Parameters["@ogr_adres"].Value = row.Cells[10].Value;
                    cmd.Parameters["@ogr_okul"].Value = row.Cells[11].Value;
                    cmd.Parameters["@ogr_kayit_tar"].Value = row.Cells[12].Value;
                    cmd.Parameters["@ogr_dogum_tar"].Value = row.Cells[13].Value;
                    cmd.Parameters["@ogr_ucret"].Value = row.Cells[14].Value;
                    cmd.ExecuteNonQuery();
                }
            }
            MessageBox.Show("Veriler Yüklenmiştir.");
            baglanti.Close();

            hedef = null;//hedef temizlenir.
            sanalDataGridView.Columns.Clear(); // sanal tablo temizlenir.

            Ogrenci_Getir(); // öğretmen çağrılır.
            }
            catch (Exception ex)
            {
                MessageBox.Show("Karşılaşılan Hata, " + ex.Message);
            }
            finally
            {
                baglanti.Close();
            }
        }

        private void btnOgrenciExcelExport_Click(object sender, EventArgs e)
        {

            Microsoft.Office.Interop.Excel.Application uygulama = new Microsoft.Office.Interop.Excel.Application();
            uygulama.Visible = true;
            Microsoft.Office.Interop.Excel.Workbook kitap = uygulama.Workbooks.Add(System.Reflection.Missing.Value);
            Microsoft.Office.Interop.Excel.Worksheet sheet1 = (Microsoft.Office.Interop.Excel.Worksheet)kitap.Sheets[1];

            for (int i = 0; i < dataGridView1.Columns.Count; i++)
            {

                Microsoft.Office.Interop.Excel.Range range1 = (Microsoft.Office.Interop.Excel.Range)sheet1.Cells[1, i + 1];
                range1.Value2 = dataGridView1.Columns[i].HeaderText;
                range1.EntireRow.Font.Bold = true; //kalın yazdırtır.
            }

            for (int i = 0; i < dataGridView1.Columns.Count; i++)
            {
                for (int j = 0; j < dataGridView1.Rows.Count; j++)
                {
                    Microsoft.Office.Interop.Excel.Range range2 = (Microsoft.Office.Interop.Excel.Range)sheet1.Cells[j + 2, i + 1];//satır süğtun
                    range2.Value2 = dataGridView1[i, j].Value; //sütun satır
                    range2.NumberFormat = ""; // bu tanımlama : ilgili satır sütunu genel biçimli hale getirr ki dümdüz ne varsa o göstertilir.
                    if (i == 10 || i == 11)
                        range2.NumberFormat = "mm/dd/yyyy"; //eğer 10 ve 11. sütunda isek (YANİ TARİH) ,o satır sütun Tarih formatında yaptırılır. çünkü onlar Kayıt Ve Doğum Tarihi.
                }
            }

        }

        private void btnHocaExcelExport_Click(object sender, EventArgs e)
        {

            try
            {

            
            Microsoft.Office.Interop.Excel.Application uygulama = new Microsoft.Office.Interop.Excel.Application();
            uygulama.Visible = true;
            Microsoft.Office.Interop.Excel.Workbook kitap = uygulama.Workbooks.Add(System.Reflection.Missing.Value);
            Microsoft.Office.Interop.Excel.Worksheet sheet1 = (Microsoft.Office.Interop.Excel.Worksheet)kitap.Sheets[1];

            for (int i = 0; i < dataGridView3.Columns.Count; i++) // Başlıklar için
            {

                Microsoft.Office.Interop.Excel.Range range1 = (Microsoft.Office.Interop.Excel.Range)sheet1.Cells[1, i+1];
                range1.Value2 = dataGridView3.Columns[i].HeaderText; // başlık tipinde belirtme
                range1.EntireRow.Font.Bold = true; // Kalın yazı yapma
            }

            for (int i = 0; i < dataGridView3.Columns.Count; i++) // veriler için
            {
                for (int j = 0; j < dataGridView3.Rows.Count; j++)
                {
                    Microsoft.Office.Interop.Excel.Range range2 = (Microsoft.Office.Interop.Excel.Range)sheet1.Cells[j+2, i + 1];//satır süğtun
                    range2.Value2 = dataGridView3[i,j].Value; //sütun satır
                    range2.NumberFormat = ""; // bu tanımlama : ilgili satır sütunu genel biçimli hale getirr ki dümdüz ne varsa o göstertilir.
                    if(i==6)
                        range2.NumberFormat = "mm/dd/yyyy"; //eğer 6. sütunda isek (YANİ TARİH) ,o satır sütun Tarih formatında yaptırılır.
                }
            }
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz Durum : " + hata.Message);
            }

        }
        

        private void txtSilinenOgrenciAra_TextChanged(object sender, EventArgs e)
        {

            if (txtSilinenOgrenciAra.Text.Trim() == "") // arama text'imiz boş ise bütün öğrencileri getirtip fonksiyonu bitirir.
            {
                Ogrenci_Getir();
                return;
            }
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Silinen_Ogrenci_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@kelime", txtSilinenOgrenciAra.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView10.Columns.Clear();
            dataGridView10.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView10.Refresh();
            baglanti.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void txtYeniHocaTc_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void txtOgrHarf_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtHocaAd_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtYeniHocaTel_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void txtYeniHocaUcret_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void txtHocaTc_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtHocaTel_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void txtHocaUcret_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void txtHocaSoyad_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtOgrAd_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtOgrSoyad_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtOgrOkul_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtVeliAd_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtVeliSoyad_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtOgrTc_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtOgrUcret_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtVeliTc_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtVeliTel_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtOgrTel_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtDersHocaTc_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtDersAd_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void txtKitapUcret_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void btnYedekleKonum_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog dlg = new FolderBrowserDialog();
            if (dlg.ShowDialog() == DialogResult.OK)
            {
                txtYedekleKonum.Text = dlg.SelectedPath;
                btnDByedekle.Enabled = true;
            }
        }
       
        private void btnDByedekle_Click(object sender, EventArgs e)
        {
            string database = baglanti.Database.ToString();
            try
            {
                if (txtYedekleKonum.Text == string.Empty)
                {
                    MessageBox.Show("konum gir.");
                    return;
                }
                else
                {
                    DateTime zaman = new DateTime();
                    zaman = DateTime.Now;
                    string cmd = "BACKUP DATABASE [" + database + "] TO DISK='" + txtYedekleKonum.Text + "\\" + "Database" + "-" + zaman.ToString("yyyy-MM-dd--HH-mm-ss") + ".bak'";

                    using (SqlCommand command = new SqlCommand(cmd, baglanti))
                    {
                        if (baglanti.State != ConnectionState.Open)
                        {
                            baglanti.Open();
                        }
                        Islem_Kayit("db export", "veri tabanı yedeklendi.", zaman); // işlem database'ye kayıt edilir. // önceden kaydediyoruz ki yedeklenen db de de gözüksün...
                        command.ExecuteNonQuery(); // db yedekleniir.
                        baglanti.Close();
                        MessageBox.Show("veri tabanı yedeklendi.");
                        btnDByedekle.Enabled = false;

                        
                    }
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show("HATA."+ex.Message);
            }

            Islem_Kayit_Getir();


        }

        private void btnYedektenAlKonum_Click(object sender, EventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Filter = "SQL Server database backup files|*.bak";
            dlg.Title = "Database restore";
            if (dlg.ShowDialog() == DialogResult.OK)
            {
                txtYedektenAlKonum.Text = dlg.FileName;
                btnYedektenGeriAl.Enabled = true;
            }
        }

        private void btnYedektenGeriAl_Click(object sender, EventArgs e)
        {
            string database = baglanti.Database.ToString();
            if (baglanti.State != ConnectionState.Open)
            {
                baglanti.Open();
            }
            try
            {
                string sqlStmt2 = string.Format("ALTER DATABASE [" + database + "] SET SINGLE_USER WITH ROLLBACK IMMEDIATE");
                SqlCommand bu2 = new SqlCommand(sqlStmt2, baglanti);
                bu2.ExecuteNonQuery();
                string sqlStmt3 = "USE MASTER RESTORE DATABASE [" + database + "] FROM DISK='"+txtYedektenAlKonum.Text+"'WITH REPLACE;";
                SqlCommand bu3 = new SqlCommand(sqlStmt3, baglanti);
                bu3.ExecuteNonQuery();
                string sqlStmt4 = string.Format("ALTER DATABASE [" + database + "] SET MULTI_USER");
                SqlCommand bu4 = new SqlCommand(sqlStmt4, baglanti);
                bu4.ExecuteNonQuery();

                MessageBox.Show("veri tabanı yedekten geri yüklendi");
                btnYedektenGeriAl.Enabled = false;
                

                

                baglanti.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                baglanti.Close();
            }

            baglanti.Open();
            Islem_Kayit("db import", "veritabanı yedekten çağırıldı.", DateTime.Now);//yapılan işlemin kayıtı.
            baglanti.Close();

            Islem_Kayit_Getir();

        }

        private void txtYeniHocaAd_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtYeniHocaSoyad_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = char.IsNumber(e.KeyChar);//sadece karakter
        }

        private void txtDevamsizlikEkleOgrenciNo_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtDevamsizlikOgrenciNo_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);//sadece sayı
        }

        private void txtOgrSeviye_TextChanged(object sender, EventArgs e) // seçilen seviye olursa, o seviyeye ait şubeler listelenir.
        {
            txtOgrHarf.Items.Clear();
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Subeler_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@seviye", txtOgrSeviye.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);
            

            sanalDataGridView2.Columns.Clear(); // önceki veriler silindi.
            sanalDataGridView2.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            foreach (DataGridViewRow row in sanalDataGridView2.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;
                    txtOgrHarf.Items.Add (row.Cells[0].Value);
                }
            }
            baglanti.Close();

            if (txtOgrHarf.Text == "")
            {
                lblOgrAlan.Text = "";
            }

        }

        private void txtOgrSeviye_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void txtOgrHarf_TextChanged(object sender, EventArgs e)
        {
            lblOgrAlan.Text = "";
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Alan_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@seviye", txtOgrSeviye.Text);
            komut.Parameters.Add("@harf", txtOgrHarf.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);



            sanalDataGridView2.Columns.Clear();
            sanalDataGridView2.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            foreach (DataGridViewRow row in sanalDataGridView2.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;
                    lblOgrAlan.Text = row.Cells[0].Value.ToString();
                }
            }
            baglanti.Close();
        }

        private void btnOgretmenTemizle_Click(object sender, EventArgs e)
        {
            txtHocaAd.Text = "";
            txtHocaSoyad.Text = "";
            txtHocaTc.Text = "";
            txtHocaUcret.Text = "";
            txtHocaTel.Text = "";
        }

        private void bnOgrTemizle_Click(object sender, EventArgs e)
        {
            txtOgrNo.Text = "";
            txtOgrAd.Text = "";
            txtOgrSoyad.Text = "";
            txtOgrOkul.Text = "";
            txtOgrTc.Text = "";
            txtOgrTel.Text = "";
            txtVeliAd.Text = "";
            txtVeliSoyad.Text = "";
            txtVeliTc.Text = "";
            txtVeliTel.Text = "";
            txtOgrUcret.Text = "";
            txtOgrAdres.Text = "";
            txtOgrSeviye.Text = "";
            txtOgrHarf.Text = "";
            dtpOgrKayit.Value = DateTime.Now;
        }

        private void btnYeniHocaTemizle_Click(object sender, EventArgs e)
        {
            txtYeniHocaAd.Text = "";
            txtYeniHocaSoyad.Text = "";
            txtYeniHocaTel.Text = "";
            txtYeniHocaTc.Text = "";
            txtYeniHocaUcret.Text = "";
        }

        private void txtSilinenOgretmenAra_TextChanged(object sender, EventArgs e)
        {
            if (txtSilinenOgrenciAra.Text.Trim() == "") // arama text'imiz boş ise bütün öğrencileri getirtip fonksiyonu bitirir.
            {
                Ogrenci_Getir();
                return;
            }
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Silinen_Ogretmen_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@kelime", txtSilinenOgretmenAra.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            dataGridView11.Columns.Clear();
            dataGridView11.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            dataGridView11.Refresh();
            baglanti.Close();
        }
        

        private void dataGridView10_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btnOgrenciGeriYukle_Click(object sender, EventArgs e)
        {
            try {

            int secilen = dataGridView10.SelectedCells[0].RowIndex;

            silinen_ogrenci_id = dataGridView10.Rows[secilen].Cells[0].Value.ToString(); //ogr _id  ""silinen""
            string ogr_ad = dataGridView10.Rows[secilen].Cells[1].Value.ToString();//ogr_ad
            string ogr_soyad = dataGridView10.Rows[secilen].Cells[2].Value.ToString();//ogr_soyad
            string ogr_seviye = dataGridView10.Rows[secilen].Cells[3].Value.ToString();//ogr_seviye
            string ogr_harf = dataGridView10.Rows[secilen].Cells[4].Value.ToString();//ogr_harf

            string ogr_tc = dataGridView10.Rows[secilen].Cells[6].Value.ToString();//ogr_tc
            string ogr_telefon = dataGridView10.Rows[secilen].Cells[7].Value.ToString();//ogr_telefon
            string ogr_adres = dataGridView10.Rows[secilen].Cells[8].Value.ToString();//ogr_adres
            string ogr_okul = dataGridView10.Rows[secilen].Cells[9].Value.ToString();//ogr_okul
            string ogr_kayit_tar = dataGridView10.Rows[secilen].Cells[10].Value.ToString();//ogr_kayit_tar
            string ogr_dogum_tar = dataGridView10.Rows[secilen].Cells[11].Value.ToString();//ogr_dogum_tar
            string ogr_ucret = dataGridView10.Rows[secilen].Cells[12].Value.ToString();//ogr_ucret
            string veli_ad = dataGridView10.Rows[secilen].Cells[13].Value.ToString();//veli_ad
            string veli_soyad = dataGridView10.Rows[secilen].Cells[14].Value.ToString();//veli_soyad
            string veli_tc = dataGridView10.Rows[secilen].Cells[15].Value.ToString();//veli_tc
            string veli_tel = dataGridView10.Rows[secilen].Cells[16].Value.ToString();//veli_tel

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Veli_Ogrenci_Ekle", baglanti);
            komut.Parameters.Add("@veli_ad", veli_ad);
            komut.Parameters.Add("@veli_soyad", veli_soyad);
            komut.Parameters.Add("@veli_tel", veli_tel);
            komut.Parameters.Add("@veli_tc", veli_tc);
            komut.Parameters.Add("@ogr_tc", ogr_tc);
            komut.Parameters.Add("@ogr_ad", ogr_ad);
            komut.Parameters.Add("@ogr_soyad", ogr_soyad);
            komut.Parameters.Add("@ogr_seviye", ogr_seviye);
            komut.Parameters.Add("@ogr_harf", ogr_harf);
            komut.Parameters.Add("@ogr_tel", ogr_telefon);
            komut.Parameters.Add("@ogr_adres", ogr_adres);
            komut.Parameters.Add("@ogr_okul", ogr_okul);
            komut.Parameters.Add("@ogr_kayit_tar", Convert.ToDateTime(ogr_kayit_tar));
            komut.Parameters.Add("@ogr_dogum_tar", Convert.ToDateTime(ogr_dogum_tar));
            komut.Parameters.Add("@ogr_ucret", ogr_ucret);
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();

            komut = new SqlCommand("Delete from Silinen_Ogrenci where ogr_id =" + silinen_ogrenci_id, baglanti);
            komut.CommandType = CommandType.Text;
            komut.ExecuteNonQuery();
            komut = new SqlCommand("Delete from Silinen_Ogrenci_Detay where ogr_id =" + silinen_ogrenci_id, baglanti);
            komut.CommandType = CommandType.Text;
            komut.ExecuteNonQuery();
            baglanti.Close();


            Ogrenci_Getir();
            Silinen_Ogrenci_Getir();
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }

}

        private void btnOgretmenGeriYukle_Click(object sender, EventArgs e)
        {
            try
            {
            int secilen = dataGridView11.SelectedCells[0].RowIndex;

            silinen_ogretmen_id = dataGridView11.Rows[secilen].Cells[0].Value.ToString();
            string hoca_ad = dataGridView11.Rows[secilen].Cells[1].Value.ToString();
            string hoca_soyad = dataGridView11.Rows[secilen].Cells[2].Value.ToString();
            string hoca_tel = dataGridView11.Rows[secilen].Cells[3].Value.ToString();
            string hoca_maas = dataGridView11.Rows[secilen].Cells[4].Value.ToString();
            string hoca_tc = dataGridView11.Rows[secilen].Cells[5].Value.ToString();
            string hoca_kayit_tarih = dataGridView11.Rows[secilen].Cells[6].Value.ToString();


           baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Hoca_ekle", baglanti);
            komut.Parameters.Add("@ad", hoca_ad);
            komut.Parameters.Add("@soyad", hoca_soyad);
            komut.Parameters.Add("@tel ", hoca_tel);
            komut.Parameters.Add("@ucret", hoca_maas);
            komut.Parameters.Add("@tc", hoca_tc);
            komut.Parameters.Add("@kayit_tarih", Convert.ToDateTime(hoca_kayit_tarih));
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();

            komut = new SqlCommand("Delete from silinen_hoca where hoca_id =" + silinen_ogretmen_id, baglanti);
            komut.CommandType = CommandType.Text;
            komut.ExecuteNonQuery();
            baglanti.Close();

            Ogretmen_Getir();
            Silinen_Ogretmen_Getir();

        }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }

}

        private void cmbSinifSeviye_TextChanged(object sender, EventArgs e)
        {

            //9.sınıf seçilmişse cmbAlan ' a sadece tire koydurt.
            if (cmbSinifSeviye.Text == "9")
            {
                cmbAlan.Items.Clear();
                cmbAlan.Items.Add("-");
            }
            else
            {
                cmbAlan.Items.Clear();
                cmbAlan.Items.Add("mf");
                cmbAlan.Items.Add("tm");
                cmbAlan.Items.Add("ts");
                cmbAlan.Items.Add("dil");
            }


            txtOgrSeviye.Text = "";//sanalgrdi2 yi kullanan diğer cmbBox text'i silinir.

            cmbSube.Items.Clear();
            
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Subeler_Ara", baglanti);//SP_Ogrenci_Deneme_Ara @deneme_seviye,@deneme_tarih
            komut.Parameters.Add("@seviye", cmbSinifSeviye.Text);

            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);



            sanalDataGridView2.Columns.Clear();
            sanalDataGridView2.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            string[] dizi = { "A", "B", "C", "D", "E", "F", "G", "H" };
            foreach (DataGridViewRow row in sanalDataGridView2.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;
                    for (int i = 0; i < dizi.Length; i++) // sınıf mevcut ise , "" işareti ile string diziden silinir.
                    {
                        if (dizi[i] == row.Cells[0].Value.ToString())
                            dizi[i] = "";
                    }
                    
                }
                
            }

            for (int i = 0; i < dizi.Length; i++) // combo box ' a , mevcut olmayan sınıflar gelir : "" ifadeli olmayan her şeyi combo box a alır.
            {
                if (dizi[i] != "")
                    cmbSube.Items.Add(dizi[i]);
            }

            baglanti.Close();
            
        }

        private void btnSiniflar_Click(object sender, EventArgs e)
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from VW_Siniflar", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView12.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
        }

        private void dataGridView12_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
            int secilen = dataGridView12.SelectedCells[0].RowIndex;

            sinif_id = dataGridView12.Rows[secilen].Cells[0].Value.ToString();
            }
            catch (Exception hata)
            {
                MessageBox.Show("Geçersiz İşlem : "+hata.Message);
            }
}

        private void btnSinifSil_Click(object sender, EventArgs e)
        {
            

            baglanti.Open();
            SqlCommand komut = new SqlCommand("Delete from sube where sube_id =" + sinif_id, baglanti);
            komut.CommandType = CommandType.Text;
            komut.ExecuteNonQuery();
            baglanti.Close();

            sinif_id = null;
            btnSiniflar_Click(sender, e);
            Ogrenci_Getir();
        }

        private void btnSinifEkle_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Sube_Ekle", baglanti);
            komut.Parameters.Add("@sube_harf", cmbSube.Text.ToString());
            komut.Parameters.Add("@sube_seviye", cmbSinifSeviye.Text.ToString());
            komut.Parameters.Add("@alan_ad", cmbAlan.Text.ToString());
            komut.CommandType = CommandType.StoredProcedure;
            komut.ExecuteNonQuery();
            baglanti.Close();


            btnSiniflar_Click(sender, e);
        }

        private void btnCikis_Click(object sender, EventArgs e)
        {
            
            Application.Exit();
        }

        private void YonetimPaneli_FormClosing(object sender, FormClosingEventArgs e)
        {

            DialogResult sonuc = MessageBox.Show("Çıkmak İstediğinizden Emin misiniz ?", "Çıkış", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (sonuc == DialogResult.No)
            {
                e.Cancel = true;
                return;
            }
            //çıkış yapılıyorsa kullanıcının son giriş tarihi update ' edilir.
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Update kullanicilar set son_giris_tarih='"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+ "' where kullanici_ad ='" + kullaniciBilgileri[0]+"'", baglanti);
            komut.CommandType = CommandType.Text;
            komut.ExecuteNonQuery();
            baglanti.Close();

        }

        private void btnIslemGecmisYenile_Click(object sender, EventArgs e)
        {
            SqlDataAdapter komut = new SqlDataAdapter("Select * from islemler order by tarih", baglanti);

            DataSet veritutucu = new DataSet();

            komut.Fill(veritutucu); //komut sonucu verileri veri tutucuya doldur.

            dataGridView13.DataSource = veritutucu.Tables[0];
        }

        private void mcGenelTakvim_DateSelected(object sender, DateRangeEventArgs e)
        {
            //Date selected olduğunda, tarihi ilgili prosedüre göndersin, ve bize sınav varsa , sınav seviyelerini ve sonuçlarının ortalamasını getirsin VE devamsızlıkları getirsin.


            //devamsızlık getirelim.
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Devamsizlik_Orani_Ara", baglanti);
            komut.Parameters.Add("@tarih", mcGenelTakvim.SelectionEnd.ToString("yyyy-MM-dd"));


            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            sanalDataGridView4.Columns.Clear();
            sanalDataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            sanalDataGridView4.Refresh();
            baglanti.Close();

            
            chart1.Series["Devamsizlik"].Points.Clear();

            int gelmeyen = Convert.ToInt32(sanalDataGridView4.Rows[0].Cells[1].Value);
            int gelen = Convert.ToInt32(sanalDataGridView4.Rows[0].Cells[0].Value) - gelmeyen;

            chart1.Series["Devamsizlik"].Points.AddXY("gelenler", gelen);
            chart1.Series["Devamsizlik"].Points.AddXY("gelmeyenler", gelmeyen);

            chart1.Visible = true;



            // o güne ait deneme varsa deneme olan seviyeleri getirtme.


            veritutucu = new DataSet();
            baglanti.Open();
             komut = new SqlCommand("SP_Ortalama_Puanlar_Ara", baglanti);
            komut.Parameters.Add("@tarih", mcGenelTakvim.SelectionEnd.ToString("yyyy-MM-dd"));


            komut.CommandType = CommandType.StoredProcedure;
             adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            sanalDataGridView4.Columns.Clear();
            sanalDataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            sanalDataGridView4.Refresh();
            baglanti.Close();

            cmbPuanSeviye.Items.Clear();
            foreach (DataGridViewRow row in sanalDataGridView4.Rows) // satır kadar cmbPuanSeviyeye o seviyeyi ekle , cell(0) 'da bizim seviyemiz var.
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;

                    cmbPuanSeviye.Items.Add(row.Cells[0].Value.ToString());
                }
                else
                {
                    foreach (var series in chart2.Series)
                    {
                        series.Points.Clear();
                    }
                }
            }
            if (cmbPuanSeviye.Items.Count > 0) //e naz bir veri aktarmışsak, o seviyenin puanlarını grafiğe aktarmak için cmbPuanSeviye nin changed fonksiyonunu çağırırız.
            {
                cmbPuanSeviye.SelectedIndex = 0;
            }

            chart2.Visible = true;
            lblPuanSeviyeAd.Visible = true;
            cmbPuanSeviye.Visible = true;
            /*
            if (sanalDataGridView4.RowCount > 1)
            {
                
            }
            else
            {
                chart2.Visible = false;
                lblPuanSeviyeAd.Visible = false;
                cmbPuanSeviye.Visible = false;
            }*/

        }

        private void cmbPuanSeviye_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secilen = cmbPuanSeviye.SelectedIndex;

            chart2.Series["Puan"].Points.Clear();

            chart2.Series["Puan"].Points.AddXY("ygs1", sanalDataGridView4.Rows[secilen].Cells[1].Value);
            chart2.Series["Puan"].Points.AddXY("ygs2", sanalDataGridView4.Rows[secilen].Cells[2].Value);
            chart2.Series["Puan"].Points.AddXY("ygs3", sanalDataGridView4.Rows[secilen].Cells[3].Value);
            chart2.Series["Puan"].Points.AddXY("ygs4", sanalDataGridView4.Rows[secilen].Cells[4].Value);
            chart2.Series["Puan"].Points.AddXY("ygs5", sanalDataGridView4.Rows[secilen].Cells[5].Value);
            chart2.Series["Puan"].Points.AddXY("ygs6", sanalDataGridView4.Rows[secilen].Cells[6].Value);
        }

        private void cmbTabloYedek_TextChanged(object sender, EventArgs e)
        {
            
            btnTabloYedekGeri.Enabled = true;
            btnTabloYedekle.Enabled = true;
            Islem_Kayit_Getir2(cmbTabloYedek.Text);
        }

        private void btnTabloYedekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            Islem_Kayit("table export", cmbTabloYedek.Text.ToString() + " yedeklendi.", DateTime.Now);

            SqlCommand komut1 = new SqlCommand("delete from "+cmbTabloYedek.Text+"_yedek", baglanti);
            komut1.ExecuteNonQuery();
            SqlCommand komut2 = new SqlCommand("insert into "+ cmbTabloYedek.Text+ "_yedek select * from " + cmbTabloYedek.Text, baglanti);
            komut2.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show(cmbTabloYedek.Text+" yedeklendi.");
            Islem_Kayit_Getir2(cmbTabloYedek.Text);

            cmbTabloYedek.Text = "";
            cmbTabloYedek.SelectedIndex = -1;
            btnTabloYedekGeri.Enabled = false;
            btnTabloYedekle.Enabled = false;
        }

        private void btnTabloYedekGeri_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            Islem_Kayit("table import", cmbTabloYedek.Text.ToString() + " geri yüklendi.", DateTime.Now);

            
            SqlCommand komut1 = new SqlCommand("delete from " + cmbTabloYedek.Text , baglanti);
            komut1.ExecuteNonQuery();
            SqlCommand komut2 = new SqlCommand("insert into " + cmbTabloYedek.Text + " select * from " + cmbTabloYedek.Text+"_yedek", baglanti);
            komut2.ExecuteNonQuery();
            baglanti.Close(); MessageBox.Show(cmbTabloYedek.Text+" yedekten geri alındı.");
            Islem_Kayit_Getir2(cmbTabloYedek.Text);

            cmbTabloYedek.Text = "";
            cmbTabloYedek.SelectedIndex = -1;
            btnTabloYedekGeri.Enabled = false;
            btnTabloYedekle.Enabled = false;
            Silinen_Ogrenci_Getir();
            Silinen_Ogretmen_Getir();
        }

        private void btnDevamsizlikMesaj_Click(object sender, EventArgs e)
        {
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SP_Bugun_Gelmeyenler", baglanti);


            komut.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            sanalDataGridView4.Columns.Clear();
            sanalDataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            sanalDataGridView4.Refresh();
            baglanti.Close();


            foreach (DataGridViewRow row in sanalDataGridView4.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;


                    string ps = "B123456789b"; // kullanıcı parolası
                    string un = "5346682748"; // kullanıcı adı
                    string ms = "Bu bir deneme"; // mesaj
                    string no = "5511327535"; // alıcı numarası

                    no = row.Cells[0].Value.ToString();
                    ms = row.Cells[1].Value.ToString()+" numaralı " + row.Cells[2].Value.ToString()+ " " + row.Cells[3].Value.ToString()+ "isimli öğrenciniz, bugün gelmemiştir. ";

                    String testXml = "<request>";
                    testXml += "<authentication>";
                    testXml += "<username>" + un + "</username>";
                    testXml += "<password>" + ps + "</password>";
                    testXml += "</authentication>";
                    testXml += "<order>";
                    testXml += "<sender>ILETI MRKZI</sender>";
                    testXml += "<sendDateTime></sendDateTime>";
                    testXml += "<message>";
                    testXml += "<text>" + ms + "</text>";
                    testXml += "<receipents>";
                    testXml += "<number>" + no + "</number>";
                    testXml += "</receipents>";
                    testXml += "</message>";
                    testXml += "</order>";
                    testXml += "</request>";

                    this.XMLPOST("http://api.iletimerkezi.com/v1/send-sms", testXml);


                }
            }

            

        }

       

        private void btnOgrenciMesaj_Click(object sender, EventArgs e)
        {
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select ogr_tel from ogrenci", baglanti);


            komut.CommandType = CommandType.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            sanalDataGridView4.Columns.Clear();
            sanalDataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            sanalDataGridView4.Refresh();
            baglanti.Close();


            foreach (DataGridViewRow row in sanalDataGridView4.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;


                    string ps = "B123456789b"; // kullanıcı parolası
                    string un = "5346682748"; // kullanıcı adı
                    string ms = "Bu bir deneme"; // mesaj
                    string no = "5511327535"; // alıcı numarası

                    no = row.Cells[0].Value.ToString();
                    ms = txtOgrenciMesaj.Text.ToString();

                    String testXml = "<request>";
                    testXml += "<authentication>";
                    testXml += "<username>" + un + "</username>";
                    testXml += "<password>" + ps + "</password>";
                    testXml += "</authentication>";
                    testXml += "<order>";
                    testXml += "<sender>ILETI MRKZI</sender>";
                    testXml += "<sendDateTime></sendDateTime>";
                    testXml += "<message>";
                    testXml += "<text>" + ms + "</text>";
                    testXml += "<receipents>";
                    testXml += "<number>" + no + "</number>";
                    testXml += "</receipents>";
                    testXml += "</message>";
                    testXml += "</order>";
                    testXml += "</request>";

                    this.XMLPOST("http://api.iletimerkezi.com/v1/send-sms", testXml);


                }
            }
            
        }

        private void btnHocaMesaj_Click(object sender, EventArgs e)
        {
            DataSet veritutucu = new DataSet();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select hoca_tel from hoca", baglanti);


            komut.CommandType = CommandType.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(komut);

            adapter.Fill(veritutucu);

            sanalDataGridView4.Columns.Clear();
            sanalDataGridView4.DataSource = veritutucu.Tables[0]; //grid view e veri tutucudaki bilgiler aktarılır.
            sanalDataGridView4.Refresh();
            baglanti.Close();


            foreach (DataGridViewRow row in sanalDataGridView4.Rows)
            {
                if (!row.IsNewRow)
                {
                    if (row.Cells[0].Value == null) // eğer boş satırlık bir girdi vara program hata vermesin diye kontrol yaparız.
                        continue;


                    string ps = "B123456789b"; // kullanıcı parolası
                    string un = "5346682748"; // kullanıcı adı
                    string ms = "Bu bir deneme"; // mesaj
                    string no = "5511327535"; // alıcı numarası

                    no = row.Cells[0].Value.ToString();
                    ms = txtHocaMesaj.Text.ToString();

                    String testXml = "<request>";
                    testXml += "<authentication>";
                    testXml += "<username>" + un + "</username>";
                    testXml += "<password>" + ps + "</password>";
                    testXml += "</authentication>";
                    testXml += "<order>";
                    testXml += "<sender>ILETI MRKZI</sender>";
                    testXml += "<sendDateTime></sendDateTime>";
                    testXml += "<message>";
                    testXml += "<text>" + ms + "</text>";
                    testXml += "<receipents>";
                    testXml += "<number>" + no + "</number>";
                    testXml += "</receipents>";
                    testXml += "</message>";
                    testXml += "</order>";
                    testXml += "</request>";

                    this.XMLPOST("http://api.iletimerkezi.com/v1/send-sms", testXml);


                }
            }
        }

        private void btnSilinenOgrenciYenile_Click(object sender, EventArgs e)
        {

            Silinen_Ogrenci_Getir();
        }

        private void btnSilinenHocaYenile_Click(object sender, EventArgs e)
        {

            Silinen_Ogretmen_Getir();
        }

        private void btnKitapEkleTemizle_Click(object sender, EventArgs e)
        {
            txtKitapAd.Text = "";
            txtKitapYayin.Text = "";
            txtKitapUcret.Text = "";
        }

        private void chbDevamsizlikIslemleri_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
    

}
