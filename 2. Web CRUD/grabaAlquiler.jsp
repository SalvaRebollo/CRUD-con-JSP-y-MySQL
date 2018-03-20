<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <link href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/minty/bootstrap.min.css" rel="stylesheet" integrity="sha384-OSebLJ6DTybdnQ7rjdh2FeOkWs4mQkZQwBDa0IdEyyWyCONtTCUyj+VOEqMcpKAo" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Videoclub - Salvador Rebollo Benítez</title>
    </head>
    <body class="visionado">
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/videoclub", "root", "");
          Statement sta = conexion.createStatement();

          request.setCharacterEncoding("UTF-8");

          // Comprueba la existencia del número de alquiler introducido
          String consultaNumAlquiler = "SELECT * FROM alquiler WHERE idAlquiler="
            + Integer.valueOf(request.getParameter("idAlquiler"));

          ResultSet numeroDeAlquileres = sta.executeQuery(consultaNumAlquiler);
          numeroDeAlquileres.last();

          if (numeroDeAlquileres.getRow() != 0) {
            out.println("Lo siento, no se ha podido dar de alta, ya existe un alquiler con el número "
              + request.getParameter("idAlquiler") + ".");
          } else {
            //INSERT INTO `alquiler` (`idAlquiler`, `fecha`, `fechaEntrega`, `socio`, `pelicula`) VALUES ('1', '17-03-18', '19-03-18', '1', '5');
            String insercion = "INSERT INTO alquiler (idAlquiler,fecha,fechaEntrega,socio,pelicula) VALUES ("
              + Integer.valueOf(request.getParameter("idAlquiler"))
              + ", '" + request.getParameter("fecha")
              + "', '" + request.getParameter("fechaEntrega")
              + "', " + Integer.valueOf(request.getParameter("socio"))
              + ", " + Integer.valueOf(request.getParameter("pelicula")) + ")";

            //+ ", '" + request.getParameter("fecha")
            //+ "', '" + request.getParameter("fechaEntrega")+ "')";
            sta.execute(insercion);
            out.println("Alquiler dado de alta correctamente.");
          }
          conexion.close();
        %>
        <br>
        <a href="alquiler.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>