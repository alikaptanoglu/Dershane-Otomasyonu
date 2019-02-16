<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsControl.aspx.cs" Inherits="Obs_Dershane.ObsControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Öğrenci Bilgi Sistemi</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="DataGridStyle.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
    <div class="container">
    <div class="span3 well">
        <center>
        <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img src="https://st2.depositphotos.com/1104517/11967/v/950/depositphotos_119675554-stock-illustration-male-avatar-profile-picture-vector.jpg" name="aboutme" width="140" height="140" class="img-circle"></a>
        <h3><asp:Label ID="ogr_head_ad1" runat="server"></asp:Label></h3>
        <em>Öğrenci Detay bilgileri için görsele tıklayın</em>
		</center>
    </div>
        <!-- Öğrenci Deneme Bilgileri -->
    <div>
        <asp:DataGrid ID="ogr_deneme_bilgileri" runat="server" CssClass="table table-striped table-bordered table-hover"
   runat="server" PageSize="10"
   AllowPaging="true"></asp:DataGrid>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title" id="myModalLabel">Öğrenci Detay</h4>
                    </div>
                <div class="modal-body">
                    <center>
                    <img src="https://st2.depositphotos.com/1104517/11967/v/950/depositphotos_119675554-stock-illustration-male-avatar-profile-picture-vector.jpg" name="aboutme" width="140" height="140" border="0" class="img-circle"></a>
                    <h3 class="media-heading">   <asp:Label ID="ogr_head_ad" runat="server"></asp:Label> / <asp:Label ID="ogr_giris_no" runat="server"></asp:Label></h3>
                    </center>
                    <hr>
                    <center>
                    <p class="text-left"><strong>Öğrenci Bilgileri </strong> <br>
                        Öğrenci Ad : <asp:Label ID="ogr_detay_ad" runat="server"></asp:Label> <br /> 
                        Öğrenci Soyad : <asp:Label ID="ogr_detay_soyad" runat="server"></asp:Label><br /> 
                        Öğrenci Numara : <asp:Label ID="ogr_detay_numara" runat="server"></asp:Label><br /> 
                        Öğrenci T.C. No : <asp:Label ID="ogr_detay_tc" runat="server"></asp:Label><br /> 
                        Öğrenci Sube/Alan : <asp:Label ID="ogr_detay_sube_seviye" runat="server"></asp:Label> / <asp:Label ID="ogr_detay_sube_harf" runat="server"></asp:Label> - <asp:Label ID="ogr_detay_sube_alan" runat="server"></asp:Label><br /> 
                        Öğrenci Veli : <asp:Label ID="ogr_detay_veli_ad" runat="server"> #nbsp </asp:Label><asp:Label ID="ogr_detay_veli_soyad" runat="server"></asp:Label><br /> 
                    </p>
                    <br>
                    </center>
                    <center>
                    <p class="text-left"><strong>Öğrenci Devamsızlık Bilgileri </strong> <br>
                        Devamsızlık Gün Sayısı : <asp:Label ID="Devamsizlik" runat="server"></asp:Label> <br />
                        Kalan Gün Sayısı : <asp:Label ID="Devamsizlik_kalan_gün" runat="server"> #nbsp </asp:Label>
                    </p>
                    <br>
                    </center>
                </div>
                <div class="modal-footer">
                    <center>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Öğrenci Detayı Kapat</button>
                    <asp:Button id="btn_logout" CssClass="btn btn-default" runat="server" OnClick="btn_logout_Click" text="Oturumu Kapat"/>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
        </div>
    </form>
</body>
</html>
