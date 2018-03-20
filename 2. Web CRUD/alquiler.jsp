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

    <body>
        <div class="container">
            <br><br>			
            <div class="panel panel-primary">
                <div class="panel-heading"><a href="./index.html"><img class="flechatras" src="./static/flechatras.png" title="Ir atrás"></a><h2 class="text-center">Videoclub MiuC</h2><h4 class="text-center">Alquileres realizados en este momento</h4></div>

                <%
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/videoclub", "root", "");
                  Statement n = conexion.createStatement();

                  ResultSet listaAlquileres = n.executeQuery("SELECT alquiler.idAlquiler, pelicula.idPelicula, pelicula.nombre, pelicula.genero, socio.idSocio, socio.nombre, socio.dni, socio.email, alquiler.fecha, alquiler.fechaEntrega FROM alquiler LEFT JOIN socio ON alquiler.socio = socio.idSocio LEFT JOIN pelicula ON alquiler.pelicula = pelicula.idPelicula;");
                %>

                <table class="table table-hover">
                    <tr><th>ID Alquiler</th><th>ID Pelicula</th><th>Pelicula</th><th>ID Socio</th><th>Socio</th><th>Fecha Alquiler</th><th>Fecha Entrega</th></tr>
                    <form method="get" action="grabaAlquiler.jsp">
                        <tr>
                            <td><input type="text" name="idAlquiler" size="5"></td>
                            <td><input type="text" name="pelicula" size="5"></td>
                            <td></td>
                            <td><input type="text" name="socio" size="5"></td>
                            <td></td>
                            <td><input type="text" name="fecha" size="10"></td>
                            <td><input type="text" name="fechaEntrega" size="10"></td>
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir alquiler</button></td>
                            <td></td>
                        </tr>           
                    </form>


                    <!--BUCLE QUE MUESTRA TODAS LAS FILAS, SE EJECUTA AUTOMATICAMENTE-->
                    <%
                      while (listaAlquileres.next()) {
                        out.println("<tr><td>");
                        out.println(listaAlquileres.getString("idAlquiler") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("pelicula.idPelicula") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("pelicula.nombre") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("socio.idSocio") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("socio.nombre") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("socio.dni") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("fecha") + "</td>");
                        out.println("<td>" + listaAlquileres.getString("fechaEntrega") + "</td>");
                    %>
                    <td>
                        <form method="get" action="modificaAlquiler.jsp">
                            <input type="hidden" name="idAlquiler" value="<%=listaAlquileres.getString("idAlquiler")%>">
                            <input type="hidden" name="idSocio" value="<%=listaAlquileres.getString("idSocio")%>">
                            <input type="hidden" name="idPelicula" value="<%=listaAlquileres.getString("idPelicula")%>">
                            <input type="hidden" name="fecha" value="<%=listaAlquileres.getString("fecha")%>">
                            <input type="hidden" name="fechaEntrega" value="<%=listaAlquileres.getString("fechaEntrega")%>">

                            <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                        </form>
                    </td>
                    <td>
                        <form method="get" action="borraAlquiler.jsp">
                            <input type="hidden" name="idAlquiler" value="<%=listaAlquileres.getString("idAlquiler")%>"/>
                            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Borrar</button>
                        </form>
                    </td></tr>
                    <%
                      } // while

                      conexion.close();
                    %>

                </table>
            </div>
            <div class="text-center">&copy; Salvador Rebollo Benítez</div>
        </div>

        <!-- jQuery (necessary for Bootstrap'n JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>