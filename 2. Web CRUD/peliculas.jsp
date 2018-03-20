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
                                <div class="panel-heading"><a href="./index.html"><img class="flechatras" src="./static/flechatras.png" title="Ir atrás"></a><h2 class="text-center">Videoclub MiuC</h2><h4 class="text-center">Catálogo de películas</h4></div>

                <%
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/videoclub", "root", "");
                  Statement n = conexion.createStatement();

                  ResultSet listaPeliculas = n.executeQuery("SELECT * FROM pelicula");

                %>

                <table class="table table-striped">
                    <tr><th>ID Película</th><th>Nombre</th><th>Genero</th><th>Año</th><th>Director</th></tr>
                    <form method="get" action="grabaPelicula.jsp">
                        <tr><td><input type="text" name="idPelicula" size="5"></td>
                            <td><input type="text" name="nombre" size="20"></td>
                            <td><input type="text" name="genero" size="10"></td>
                            <td><input type="number" name="ano" size="4"></td>
                            <td><input type="text" name="director" size="20"></td>
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir película</button></td><td></td></tr>           
                    </form>
                    <%                      while (listaPeliculas.next()) {
                        out.println("<tr><td>");
                        out.println(listaPeliculas.getString("idPelicula") + "</td>");
                        out.println("<td>" + listaPeliculas.getString("nombre") + "</td>");
                        out.println("<td>" + listaPeliculas.getString("genero") + "</td>");
                        out.println("<td>" + listaPeliculas.getString("ano") + "</td>");
                        out.println("<td>" + listaPeliculas.getString("director") + "</td>");
                    %>
                    <td>
                        <form method="get" action="modificaPelicula.jsp">
                            <input type="hidden" name="idPelicula" value="<%=listaPeliculas.getString("idPelicula")%>">
                            <input type="hidden" name="nombre" value="<%=listaPeliculas.getString("nombre")%>">
                            <input type="hidden" name="genero" value="<%=listaPeliculas.getString("genero")%>">
                            <input type="hidden" name="ano" value="<%=listaPeliculas.getString("ano")%>">
                            <input type="hidden" name="director" value="<%=listaPeliculas.getString("director")%>">
                            <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                        </form>
                    </td>
                    <td>
                        <form method="get" action="borraPelicula.jsp">
                            <input type="hidden" name="idPelicula" value="<%=listaPeliculas.getString("idPelicula")%>"/>
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