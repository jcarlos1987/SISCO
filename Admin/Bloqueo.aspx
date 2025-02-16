﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bloqueo.aspx.cs" Inherits="Admin_Bloqueo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="msapplication-tap-highlight" content="no"/>
  <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. "/>
  <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,"/>
    <title></title>
    <!-- Favicons-->
  <link rel="icon" href="../images/favicon/favicon-32x32.png" sizes="32x32"/>
  <!-- Favicons-->
  <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png"/>
  <!-- For iPhone -->
  <meta name="msapplication-TileColor" content="#00bcd4"/>
  <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png"/>
  <!-- For Windows Phone -->


  <!-- CORE CSS-->
  
  <link href="../css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="../css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <!-- Custome CSS-->    
    <link href="../css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="../css/layouts/page-center.css" type="text/css" rel="stylesheet" media="screen,projection"/>


  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="../js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="../js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class="cyan">
    <form id="form1" runat="server">
    <div>
         <!-- Start Page Loading -->
  <div id="loader-wrapper">
      <div id="loader"></div>        
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->



  <div id="error-page">

    <div class="row">
      <div class="col s12">
        <div class="browser-window">
          <div class="top-bar">
            <div class="circles">
              <div id="close-circle" class="circle"></div>
              <div id="minimize-circle" class="circle"></div>
              <div id="maximize-circle" class="circle"></div>
            </div>
          </div>
          <div class="content">
            <div class="row">
              <div id="site-layout-example-top" class="col s12">
                <p class="flat-text-logo center white-text caption-uppercase">No tienes Acceso a esta Pagina :(</p>
              </div>
              <div id="site-layout-example-right" class="col s12 m12 l12">
                <div class="row center">
                    <a href="javascript:history.back(1)" class="btn waves-effect waves-light">Regresar</a>
                  <h1 class="text-long-shadow col s12">DENEGADO</h1>
                    <p class="center white-text col s12">It seems that this page doesn’t exist.</p>
                </div>
<%--                <div class="row center">
                  
                  <p class="center s12"><button onclick="goBack()" class="btn waves-effect waves-light">Back</button> <a href="index.html" class="btn waves-effect waves-light">Homepage</a>
                    <p>
                    </p>
                </div>--%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- ================================================
    Scripts
    ================================================ -->

  <!-- jQuery Library -->
  <script type="text/javascript" src="../js/plugins/jquery-1.11.2.min.js"></script>
  <!--materialize js-->
  <script type="text/javascript" src="../js/materialize.min.js"></script>
  <!--prism-->
  <script type="text/javascript" src="../js/plugins/prism/prism.js"></script>
  <!--scrollbar-->
  <script type="text/javascript" src="../js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

      <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="../js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="../js/custom-script.js"></script>
  
  <script type="text/javascript">
      function goBack() {
          window.history.back();
      }
  </script>
    </div>
    </form>
</body>
</html>
