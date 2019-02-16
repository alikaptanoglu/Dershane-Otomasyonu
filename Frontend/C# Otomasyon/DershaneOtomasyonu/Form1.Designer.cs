namespace DershaneOtomasyonu
{
    partial class Form1
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lbl_Kadi = new System.Windows.Forms.Label();
            this.lbl_Parola = new System.Windows.Forms.Label();
            this.txt_Kadi = new System.Windows.Forms.TextBox();
            this.txt_Ksifre = new System.Windows.Forms.TextBox();
            this.btn_GirisYap = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(11, -45);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(2);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(300, 326);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // lbl_Kadi
            // 
            this.lbl_Kadi.AutoSize = true;
            this.lbl_Kadi.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lbl_Kadi.Location = new System.Drawing.Point(17, 224);
            this.lbl_Kadi.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lbl_Kadi.Name = "lbl_Kadi";
            this.lbl_Kadi.Size = new System.Drawing.Size(96, 17);
            this.lbl_Kadi.TabIndex = 1;
            this.lbl_Kadi.Text = "Kullanıcı Adı : ";
            // 
            // lbl_Parola
            // 
            this.lbl_Parola.AutoSize = true;
            this.lbl_Parola.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lbl_Parola.Location = new System.Drawing.Point(17, 255);
            this.lbl_Parola.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lbl_Parola.Name = "lbl_Parola";
            this.lbl_Parola.Size = new System.Drawing.Size(61, 17);
            this.lbl_Parola.TabIndex = 2;
            this.lbl_Parola.Text = "Parola : ";
            // 
            // txt_Kadi
            // 
            this.txt_Kadi.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txt_Kadi.Location = new System.Drawing.Point(117, 224);
            this.txt_Kadi.Margin = new System.Windows.Forms.Padding(2);
            this.txt_Kadi.MaxLength = 30;
            this.txt_Kadi.Name = "txt_Kadi";
            this.txt_Kadi.Size = new System.Drawing.Size(178, 26);
            this.txt_Kadi.TabIndex = 3;
            this.txt_Kadi.Text = "müdür";
            // 
            // txt_Ksifre
            // 
            this.txt_Ksifre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txt_Ksifre.Location = new System.Drawing.Point(117, 255);
            this.txt_Ksifre.Margin = new System.Windows.Forms.Padding(2);
            this.txt_Ksifre.Name = "txt_Ksifre";
            this.txt_Ksifre.PasswordChar = '*';
            this.txt_Ksifre.Size = new System.Drawing.Size(178, 26);
            this.txt_Ksifre.TabIndex = 3;
            this.txt_Ksifre.Text = "123";
            // 
            // btn_GirisYap
            // 
            this.btn_GirisYap.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btn_GirisYap.Location = new System.Drawing.Point(20, 295);
            this.btn_GirisYap.Margin = new System.Windows.Forms.Padding(2);
            this.btn_GirisYap.Name = "btn_GirisYap";
            this.btn_GirisYap.Size = new System.Drawing.Size(275, 33);
            this.btn_GirisYap.TabIndex = 4;
            this.btn_GirisYap.Text = "Giriş Yap";
            this.btn_GirisYap.UseVisualStyleBackColor = true;
            this.btn_GirisYap.Click += new System.EventHandler(this.btn_GirisYap_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(315, 361);
            this.Controls.Add(this.btn_GirisYap);
            this.Controls.Add(this.txt_Ksifre);
            this.Controls.Add(this.txt_Kadi);
            this.Controls.Add(this.lbl_Parola);
            this.Controls.Add(this.lbl_Kadi);
            this.Controls.Add(this.pictureBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Form1";
            this.Text = "Dershane Otomasyon Girişi";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lbl_Kadi;
        private System.Windows.Forms.Label lbl_Parola;
        private System.Windows.Forms.TextBox txt_Kadi;
        private System.Windows.Forms.TextBox txt_Ksifre;
        private System.Windows.Forms.Button btn_GirisYap;
    }
}

