<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
<title>SISCO</title>
<link rel="icon" type="image/png" href="images/favicon/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="images/favicon/favicon-16x16.png" sizes="16x16" />

<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classic Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="Diseño_Logueo/css/style.css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="Diseño_Logueo/css/font-awesome.css"/> <!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->

<!-- js -->
<script type="text/javascript" src="Diseño_Logueo/js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet"/>
<!-- //online-fonts -->
</head>
<style>
    h1,h2,h6,p {font-family: arial, verdana, sans-serif;}
</style>

<body>
    <form id="form1" runat="server">
    <div>
        <script src="Diseño_Logueo/js/jquery.vide.min.js"></script>
	<!-- main -->
	<div data-vide-bg="Diseño_Logueo/video/648983405">
		<div class="center-container">
			<!--header-->
			<div class="header-w3l">
				<h1 face="Arial">S I S C O | Sistema de Supervisión Cobranza </h1>
			</div>
			<!--//header-->
			<div class="main-content-agile">
				<div class="sub-main-w3">	
					<div class="wthree-pro">
						<h2>Logueate Aqui</h2>
					</div>					
                        <asp:TextBox ID="inputusuario" runat="server" placeholder="Usuario" class="user"  type="text" required=""></asp:TextBox>
						<span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br><br>
                        <asp:TextBox ID="inputpassword" runat="server" TextMode="Password" placeholder="Password" class="pass" type="password" required=""></asp:TextBox>
						<span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span><br>
						<div class="sub-w3l">
							<h6><a href="#">Olvidaste tu contraseña?</a></h6>
							<div class="right-w3l">
                                <asp:Button ID="Button1" runat="server" Text="Acceder" class="btn btn-login" onclick="Button1_Click" />  
							</div>
						</div>
				
				</div>
			</div>
			<!--//main-->

			<!--footer-->
			<div class="footer">
				<p>&copy; Katia Marcela Mendoza Ghigliazza | Titular de la Jefatura de Servicios de Afiliación y Cobranza |<a href="http://172.24.86.203/"> Herramientas JAC</a></p>
			</div>
			<!--//footer-->
		</div>
	</div>
    </div>
    </form>
</body>
</html>
