<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Obs_Dershane.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Öğrenci Bilgilendirme Sistemi</title>
    <meta charset=”utf-8″>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="LoginStyle.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        function ogr_no_ClientClicked() {
            metin_ogr = document.getElementById("ogr_no");
            metin_ogr.value = "";
        }
        

        function tc_ClientClicked() {
            metin_tc = document.getElementById("ogr_tc");
            metin_tc.value = "";
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        </script>
    
</head>
<body>
    <div class ="container">

    <form id="form1" runat="server">
        <div>

   <section id="login">
    <div class="container">
    	<div class="row">
    	    <div class="col-xs-12">
        	    <div class="form-wrap">
                <h1>Öğrenci Bilgi Sistemi</h1>
                    <form role="form" action="javascript:;" method="post" id="login-form" autocomplete="off">
                        <div class="form-group">
                            <label for="email" class="sr-only">Email</label>
                            <asp:TextBox onclick="ogr_no_ClientClicked()" ID="ogr_no" onkeypress="return isNumberKey(event)" CssClass="form-control" runat="server" Text="Öğrenci No" AutoCompleteType="Search" MaxLength="4" ></asp:TextBox>
                           
                        </div>
                        <div class="form-group">
                            <label for="key" class="sr-only">Password</label>
                            <asp:TextBox onclick="tc_ClientClicked()" ID="ogr_tc" onkeypress="return isNumberKey(event)" CssClass="form-control"   runat="server" Text="Öğrenci T.C. No" AutoCompleteType="Search" MaxLength="11"></asp:TextBox>
                        </div>
                        
                            <asp:Button id="btn_login" CssClass="btn btn-custom btn-lg btn-block" runat="server" OnClick="btn_login_Click" text="Giriş Yap"/>
                            <div id="uyari" class="alert alert-danger fade in" runat="server" visible="false">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                            <strong><asp:Label ID="hataligiris" runat="server"></asp:Label></strong>  
                            </div>
                       
                    </form>
                    <a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal">Dershane numaranızı Öğrenin</a>
                   
                    <hr>
        	    </div>
    		</div> <!-- /.col-xs-12 -->
    	</div> <!-- /.row -->
    </div> <!-- /.container -->
</section>

<div class="modal fade forget-modal" tabindex="-1" role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Parola mı Göster</h4>
			</div>

			<div class="modal-body">
				<p>T.C. Kimlik Numarası</p>
                <asp:TextBox ID="ogr_tc_okul_no" onkeypress="return isNumberKey(event)" CssClass="form-control" runat="server" AutoCompleteType="Search" MaxLength="11"></asp:TextBox>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
			
                <asp:Button id="ogr_no_bul" onkeypress="return isNumberKey(event)" CssClass="btn btn-custom" runat="server" OnClick="ogr_no_bul_Click" Text="Göster" />
			</div>
		</div> <!-- /.modal-content -->
	</div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->


        </div>
    </form> </div><!-- Container -->
</body>
</html>
