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
                <div class="panel-heading"><a href="./index.html"><img class="flechatras" src="./static/flechatras.png" title="Ir atrás"></a><h2 class="text-center">Videoclub MiuC</h2><h4 class="text-center">Lista de socios</h4></div>
                <%
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/videoclub", "root", "");
                  Statement n = conexion.createStatement();

                  ResultSet listaSocios = n.executeQuery("SELECT * FROM socio");
                %>

                <table class="table table-striped">
                    <tr><th>Nº de socio</th><th>Nombre</th><th>Ciudad</th><th>DNI</th><th>Sexo (H/M)</th><th>Email</th></tr>
                    <form method="get" action="grabaSocio.jsp">
                        <tr>
                            <td><input type="text" name="idSocio" size="5"></td>
                            <td><input type="text" name="nombre" size="30"></td>
                            <td><input type="text" name="ciudad" size="5"></td>
                            <td><input type="text" name="dni" size="9"></td>
                            <td><input type="text" name="sexo" size="5"></td>
                            <td><input type="text" name="email" size="20"></td>
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir socio</button></td>
                            <td></td>
                        </tr>           
                    </form>
                    <%
                      while (listaSocios.next()) {
                        out.println("<tr><td>");
                        out.println(listaSocios.getString("idSocio") + "</td>");
                        out.println("<td>" + listaSocios.getString("nombre") + "</td>");
                        out.println("<td>" + listaSocios.getString("ciudad") + "</td>");
                        out.println("<td>" + listaSocios.getString("dni") + "</td>");
                        out.println("<td>" + listaSocios.getString("sexo") + "</td>");
                        out.println("<td>" + listaSocios.getString("email") + "</td>");
                    %>
                    <td>
                        <form method="get" action="modificaSocio.jsp">
                            <input type="hidden" name="idSocio" value="<%=listaSocios.getString("idSocio")%>">
                            <input type="hidden" name="nombre" value="<%=listaSocios.getString("nombre")%>">
                            <input type="hidden" name="ciudad" value="<%=listaSocios.getString("ciudad")%>">
                            <input type="hidden" name="dni" value="<%=listaSocios.getString("dni")%>">
                            <input type="hidden" name="sexo" value="<%=listaSocios.getString("sexo")%>">
                            <input type="hidden" name="email" value="<%=listaSocios.getString("email")%>">
                            <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                        </form>
                    </td>
                    <td>
                        <form method="get" action="borraSocio.jsp">
                            <input type="hidden" name="idSocio" value="<%=listaSocios.getString("idSocio")%>"/>
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