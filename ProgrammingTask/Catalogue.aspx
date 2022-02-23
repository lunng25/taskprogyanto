<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogue.aspx.cs" Inherits="ProgrammingTask.Catalogue"  EnableViewState="true" %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript" src="Scripts/jquery1.8.3.min.js"></script>
  <script src="Scripts/bootstrap.min.js"></script>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style>
   


    .headercatalogue
    {
        color:#9ea4a7; 
        font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        font-size:16px;
        margin-left:5px; margin-top:5px
    }
    .detailcatalogue
    {
        color:black; 
        font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        font-size:15px;
        margin-left:5px
    }

  

.hover {
    background:#c7c7c7;
    transition: all 0.5s ease;
    cursor:pointer
}
</style>




    <script>
        $(document).ready(function () {
            $('.dtable').hover(function () {
                $('.dtable').removeClass('hover');
                $(this).addClass('hover');
                

                document.getElementById("txtRefIDModal").value = $(this).find('.inref').val();
                document.getElementById("txtCookieNameModal").value = $(this).find('.inname').val();
                document.getElementById("txtCookieDescModal").value = $(this).find('.indesc').val();

            })
        })
    </script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<form runat="server" id="form1">
<div class="wrapper">

  <header class="main-header">
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" style="background-color:#007ac9">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style="background-color:#0066a1">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li><a href="Default.aspx"> <span>Cookies</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="height:2000px">
    <!-- Content Header (Page header) -->
   
    <!-- Main content -->

       <section class="content" >
      <!-- Small boxes (Stat box) -->
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

           
      
            <div class="col-lg-3">
               
                     <div style="width:80px; height:60px; float:left">
                        <li class="dropdown user user-menu" style="list-style: none;list-style-type: none;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="text-decoration:none; color:black">
                                <img src="dist/menu.png"height="30" width="30">
                                <br />
                                <span class="hidden-xs" >Menu</span>
                            </a>
                            <ul class="dropdown-menu " style="list-style: none;">
                              <li class="user-footer" style="list-style: none;">
                                  <asp:LinkButton runat="server" ID="btnNew" OnClick="btnNew_Click" >New Cookie</asp:LinkButton>
                                  <a href="#" data-toggle="modal" data-target="#ModalCatalogue">Edit Cookie</a>
                                  <%--<asp:LinkButton runat="server" ID="btnNew" OnClick="btnNew_Click" >New Cookie</asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="btnEdit" OnClick="btnEdit_Click">Edit Cookie</asp:LinkButton>--%>
                              </li>
                            </ul>
                          </li>
                     </div>
                    <div style="width:100px; height:60px;  float:left">
                        <a href="default.aspx" style="text-decoration:none; color:black"> 
                            <img src="dist/flower.png"height="30" width="30" style="margin-left:30px">
                            <p style="margin-left:10px">Cookies Page</p>
                        </a>
                    </div>
            </div>
            <div class="col-lg-9 pull-right" ></div>
     
      <div style="width:1000px; height:50px;  margin-top:100px"><h2>Catalogue</h2></div>
      <asp:TextBox runat="server" ID="txtSearch" placeholder="Search"></asp:TextBox>
        <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" />
      <div style="width:1000px; height:200px; margin-top:20px">
          <asp:Literal runat="server" ID="txtSummary"></asp:Literal>
      </div>
      </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
   
   
     <div class="modal fade" id="ModalCatalogue">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title"><asp:Label ID="txtNameTitleModal" runat="server">Edit Cookie</asp:Label></h4>
              </div>
              <div class="modal-body">
                <input type="text" runat="server" ID="txtRefIDModal"  style="display:none" />
                <table style="margin:0 auto; border-spacing:10px">
                    <tr>
                        <td style="text-align:right; padding-bottom: 10px; padding-right:5px">Cookie Name : </td>
                        <td style="text-align:left; padding-bottom: 10px; padding-right:5px"><input type="text" runat="server" id="txtCookieNameModal" style="width:300px" /></td>
                    </tr>
                    
                    <tr>
                        <td style="text-align:right; padding-bottom: 10px; padding-right:5px">Cookie Description : </td>
                        <td style="text-align:left; padding-bottom: 10px; padding-right:5px"><input type="text" runat="server" id="txtCookieDescModal" style="width:300px"/></td>
                    </tr>
                </table>
              </div>
              <div class="modal-footer">
                <asp:Button runat="server" ID="btnSave" CssClass="btn btn-default" Text="Save Now" OnClick="btnSave_Click"  />
                <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-primary" Text="Delete" OnClick="btnDelete_Click"  />
                <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-default pull-right" data-dismiss="modal" Text="Cancel"  />
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
</div>

  <asp:Label ID="txtDataRef" runat="server" ></asp:Label><br />
        <asp:Label ID="txtDataName" runat="server"  ></asp:Label><br />
        <asp:Label ID="txtDataDesc" runat="server"  ></asp:Label><br />


<!-- ./wrapper -->
</form>
<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="bower_components/raphael/raphael.min.js"></script>
<script src="bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
