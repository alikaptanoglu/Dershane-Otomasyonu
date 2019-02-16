using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DershaneOtomasyonu
{

    public partial class RaporForm : Form
    {
        string[] raporPaket = {"","","","" };
        int[] size = { 0, 0 };
        public RaporForm(string[] s,int[] sizee)
        {
            for (int i = 0; i < s.Length; i++)
            {
                raporPaket[i] = s[i];
            }
            size[0] = sizee[0];
            size[1] = sizee[1];
            InitializeComponent();
        }



        private void RaporForm_Load(object sender, EventArgs e)
        {
            this.Width = size[0];
            this.Height = size[1];
            if (raporPaket[0] == "Sınav")
            {
                //değerleri aktar.
                cbSeviye.Text = raporPaket[1];
                dtpOgrenciDeneme.Value = (Convert.ToDateTime(raporPaket[2]));

                //diğer tabları kapat
                tabControl1.TabPages.Remove(tabPage2);
                tabControl1.TabPages.Remove(tabPage3);

                //işlem butonuna otomatikmak tıklat.
                btn_Deneme_Listele_Click(sender,e);
            }
            else if  (raporPaket[0] == "Öğretmen")
            {
                //değerleri aktar.
                txtOgretmenAra.Text = raporPaket[1];
                tabControl1.TabPages.Remove(tabPage3);

                //diğer tabları kapat
                tabControl1.TabPages.Remove(tabPage1);

                //işlem text_change' yi buradan çalıştırt.
                txtOgretmenAra_TextChanged(sender, e);

            }
            else if (raporPaket[0] == "Öğrenci")
            {
                //değerleri aktar.
                txtOgrenciAra.Text = raporPaket[1];

                //diğer tabları kapat
                tabControl1.TabPages.Remove(tabPage1);
                tabControl1.TabPages.Remove(tabPage2);

                //işlem text_change' yi buradan çalıştırt.
                txtOgrenciAra_TextChanged(sender, e);

            }
            
            this.reportViewer1.RefreshReport();
            this.reportViewer2.RefreshReport();
            this.reportViewer3.RefreshReport();
        }




        private void btn_Deneme_Listele_Click(object sender, EventArgs e)
        {

            using (projeEntities3 db = new projeEntities3())
            {
                
                SP_Ogrenci_Deneme_Ara_ResultBindingSource.DataSource = db.SP_Ogrenci_Deneme_Ara(cbSeviye.Text, Convert.ToDateTime(dtpOgrenciDeneme.Value.ToString("yyyy-MM-dd"))).ToList(); //prosedüre parametre gönderimi
                Microsoft.Reporting.WinForms.ReportParameter[] rParams = new Microsoft.Reporting.WinForms.ReportParameter[] //rapora para metre gönderimi
                    {
                        new Microsoft.Reporting.WinForms.ReportParameter("DenemeSeviye",cbSeviye.Text.ToString()),
                        new Microsoft.Reporting.WinForms.ReportParameter("DenemeTarih",dtpOgrenciDeneme.Value.ToString("yyyy-MM-dd"))
                    };
                reportViewer1.LocalReport.SetParameters(rParams);
                reportViewer1.RefreshReport();
            }
        }

        private void txtOgretmenAra_TextChanged(object sender, EventArgs e)
        {
            using (projeEntities4 db = new projeEntities4())
            {
                SP_Ogretmen_Ara_ResultBindingSource.DataSource = db.SP_Ogretmen_Ara(txtOgretmenAra.Text).ToList();

                // rapora para metre gönderimi yok.

                reportViewer2.RefreshReport();
            }
        }

        private void txtOgrenciAra_TextChanged(object sender, EventArgs e)
        {
            using (projeEntities5 db = new projeEntities5())
            {
                SP_Ogrenci_Ara_ResultBindingSource.DataSource = db.SP_Ogrenci_Ara(txtOgrenciAra.Text).ToList();

                // rapora para metre gönderimi yok.

                reportViewer3.RefreshReport();
            }
        }
    }
}
