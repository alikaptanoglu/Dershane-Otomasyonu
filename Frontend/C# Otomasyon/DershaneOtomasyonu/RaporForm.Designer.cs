namespace DershaneOtomasyonu
{
    partial class RaporForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource2 = new Microsoft.Reporting.WinForms.ReportDataSource();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource3 = new Microsoft.Reporting.WinForms.ReportDataSource();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RaporForm));
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.btn_Deneme_Listele = new System.Windows.Forms.Button();
            this.label39 = new System.Windows.Forms.Label();
            this.dtpOgrenciDeneme = new System.Windows.Forms.DateTimePicker();
            this.label40 = new System.Windows.Forms.Label();
            this.cbSeviye = new System.Windows.Forms.ComboBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.reportViewer2 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.label53 = new System.Windows.Forms.Label();
            this.txtOgretmenAra = new System.Windows.Forms.TextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.reportViewer3 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.label52 = new System.Windows.Forms.Label();
            this.txtOgrenciAra = new System.Windows.Forms.TextBox();
            this.SP_Ogrenci_Deneme_Ara_ResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.SP_Ogretmen_Ara_ResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.SP_Ogrenci_Ara_ResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.SP_Ogrenci_Deneme_Ara_ResultBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.SP_Ogretmen_Ara_ResultBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.SP_Ogrenci_Ara_ResultBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(970, 558);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.reportViewer1);
            this.tabPage1.Controls.Add(this.btn_Deneme_Listele);
            this.tabPage1.Controls.Add(this.label39);
            this.tabPage1.Controls.Add(this.dtpOgrenciDeneme);
            this.tabPage1.Controls.Add(this.label40);
            this.tabPage1.Controls.Add(this.cbSeviye);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(962, 532);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Deneme Sonuçları";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Bottom;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.SP_Ogrenci_Deneme_Ara_ResultBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "DershaneOtomasyonu.SinavRapor.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(3, 64);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.Size = new System.Drawing.Size(956, 465);
            this.reportViewer1.TabIndex = 67;
            // 
            // btn_Deneme_Listele
            // 
            this.btn_Deneme_Listele.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btn_Deneme_Listele.Location = new System.Drawing.Point(421, 14);
            this.btn_Deneme_Listele.Margin = new System.Windows.Forms.Padding(2);
            this.btn_Deneme_Listele.Name = "btn_Deneme_Listele";
            this.btn_Deneme_Listele.Size = new System.Drawing.Size(94, 33);
            this.btn_Deneme_Listele.TabIndex = 66;
            this.btn_Deneme_Listele.Text = "Listele";
            this.btn_Deneme_Listele.UseVisualStyleBackColor = true;
            this.btn_Deneme_Listele.Click += new System.EventHandler(this.btn_Deneme_Listele_Click);
            // 
            // label39
            // 
            this.label39.AutoSize = true;
            this.label39.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label39.Location = new System.Drawing.Point(217, 21);
            this.label39.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label39.Name = "label39";
            this.label39.Size = new System.Drawing.Size(98, 15);
            this.label39.TabIndex = 65;
            this.label39.Text = "Deneme Tarihi : ";
            // 
            // dtpOgrenciDeneme
            // 
            this.dtpOgrenciDeneme.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpOgrenciDeneme.Location = new System.Drawing.Point(316, 21);
            this.dtpOgrenciDeneme.Name = "dtpOgrenciDeneme";
            this.dtpOgrenciDeneme.Size = new System.Drawing.Size(91, 20);
            this.dtpOgrenciDeneme.TabIndex = 64;
            // 
            // label40
            // 
            this.label40.AutoSize = true;
            this.label40.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label40.Location = new System.Drawing.Point(5, 21);
            this.label40.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label40.Name = "label40";
            this.label40.Size = new System.Drawing.Size(78, 15);
            this.label40.TabIndex = 62;
            this.label40.Text = "Sınıf Seviye : ";
            // 
            // cbSeviye
            // 
            this.cbSeviye.FormattingEnabled = true;
            this.cbSeviye.Items.AddRange(new object[] {
            "9",
            "10",
            "11",
            "12"});
            this.cbSeviye.Location = new System.Drawing.Point(90, 20);
            this.cbSeviye.Name = "cbSeviye";
            this.cbSeviye.Size = new System.Drawing.Size(100, 21);
            this.cbSeviye.TabIndex = 63;
            this.cbSeviye.Text = "9";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.reportViewer2);
            this.tabPage2.Controls.Add(this.label53);
            this.tabPage2.Controls.Add(this.txtOgretmenAra);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(968, 532);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Hocalar";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // reportViewer2
            // 
            this.reportViewer2.Dock = System.Windows.Forms.DockStyle.Bottom;
            reportDataSource2.Name = "DataSet1";
            reportDataSource2.Value = this.SP_Ogretmen_Ara_ResultBindingSource;
            this.reportViewer2.LocalReport.DataSources.Add(reportDataSource2);
            this.reportViewer2.LocalReport.ReportEmbeddedResource = "DershaneOtomasyonu.OgretmenRapor.rdlc";
            this.reportViewer2.Location = new System.Drawing.Point(3, 64);
            this.reportViewer2.Name = "reportViewer2";
            this.reportViewer2.Size = new System.Drawing.Size(962, 465);
            this.reportViewer2.TabIndex = 28;
            // 
            // label53
            // 
            this.label53.AutoSize = true;
            this.label53.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label53.Location = new System.Drawing.Point(3, 27);
            this.label53.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label53.Name = "label53";
            this.label53.Size = new System.Drawing.Size(63, 15);
            this.label53.TabIndex = 27;
            this.label53.Text = "Hoca Ara :";
            // 
            // txtOgretmenAra
            // 
            this.txtOgretmenAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txtOgretmenAra.Location = new System.Drawing.Point(70, 18);
            this.txtOgretmenAra.Margin = new System.Windows.Forms.Padding(2);
            this.txtOgretmenAra.Name = "txtOgretmenAra";
            this.txtOgretmenAra.Size = new System.Drawing.Size(156, 30);
            this.txtOgretmenAra.TabIndex = 25;
            this.txtOgretmenAra.TextChanged += new System.EventHandler(this.txtOgretmenAra_TextChanged);
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.reportViewer3);
            this.tabPage3.Controls.Add(this.label52);
            this.tabPage3.Controls.Add(this.txtOgrenciAra);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(968, 532);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Öğrenciler";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // reportViewer3
            // 
            this.reportViewer3.Dock = System.Windows.Forms.DockStyle.Bottom;
            reportDataSource3.Name = "DataSet1";
            reportDataSource3.Value = this.SP_Ogrenci_Ara_ResultBindingSource;
            this.reportViewer3.LocalReport.DataSources.Add(reportDataSource3);
            this.reportViewer3.LocalReport.ReportEmbeddedResource = "DershaneOtomasyonu.OgrenciRapor.rdlc";
            this.reportViewer3.Location = new System.Drawing.Point(0, 65);
            this.reportViewer3.Name = "reportViewer3";
            this.reportViewer3.Size = new System.Drawing.Size(968, 467);
            this.reportViewer3.TabIndex = 56;
            // 
            // label52
            // 
            this.label52.AutoSize = true;
            this.label52.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label52.Location = new System.Drawing.Point(8, 29);
            this.label52.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label52.Name = "label52";
            this.label52.Size = new System.Drawing.Size(60, 15);
            this.label52.TabIndex = 55;
            this.label52.Text = "ARAMA  : ";
            // 
            // txtOgrenciAra
            // 
            this.txtOgrenciAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txtOgrenciAra.Location = new System.Drawing.Point(72, 19);
            this.txtOgrenciAra.Margin = new System.Windows.Forms.Padding(2);
            this.txtOgrenciAra.Name = "txtOgrenciAra";
            this.txtOgrenciAra.Size = new System.Drawing.Size(156, 30);
            this.txtOgrenciAra.TabIndex = 52;
            this.txtOgrenciAra.TextChanged += new System.EventHandler(this.txtOgrenciAra_TextChanged);
            // 
            // SP_Ogrenci_Deneme_Ara_ResultBindingSource
            // 
            this.SP_Ogrenci_Deneme_Ara_ResultBindingSource.DataSource = typeof(DershaneOtomasyonu.SP_Ogrenci_Deneme_Ara_Result);
            // 
            // SP_Ogretmen_Ara_ResultBindingSource
            // 
            this.SP_Ogretmen_Ara_ResultBindingSource.DataSource = typeof(DershaneOtomasyonu.SP_Ogretmen_Ara_Result);
            // 
            // SP_Ogrenci_Ara_ResultBindingSource
            // 
            this.SP_Ogrenci_Ara_ResultBindingSource.DataSource = typeof(DershaneOtomasyonu.SP_Ogrenci_Ara_Result);
            // 
            // RaporForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(970, 558);
            this.Controls.Add(this.tabControl1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "RaporForm";
            this.Text = "Rapor Alanı";
            this.Load += new System.EventHandler(this.RaporForm_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.SP_Ogrenci_Deneme_Ara_ResultBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.SP_Ogretmen_Ara_ResultBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.SP_Ogrenci_Ara_ResultBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button btn_Deneme_Listele;
        private System.Windows.Forms.Label label39;
        public System.Windows.Forms.DateTimePicker dtpOgrenciDeneme;
        private System.Windows.Forms.Label label40;
        private System.Windows.Forms.ComboBox cbSeviye;
        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource SP_Ogrenci_Deneme_Ara_ResultBindingSource;
        private System.Windows.Forms.Label label53;
        private System.Windows.Forms.TextBox txtOgretmenAra;
        private Microsoft.Reporting.WinForms.ReportViewer reportViewer2;
        private System.Windows.Forms.BindingSource SP_Ogretmen_Ara_ResultBindingSource;
        private System.Windows.Forms.TabPage tabPage3;
        private Microsoft.Reporting.WinForms.ReportViewer reportViewer3;
        private System.Windows.Forms.Label label52;
        private System.Windows.Forms.TextBox txtOgrenciAra;
        private System.Windows.Forms.BindingSource SP_Ogrenci_Ara_ResultBindingSource;
    }
}