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
        <% request.setCharacterEncoding("UTF-8");%>
        <div class="container">
            <br><br>
            <div class="panel panel-info">
                <div class="panel-heading text-center">Modificación de película</div>
                <form method="get" action="grabaPeliculaModificada.jsp">

                    <div class="form-group"> 
                        <label>&nbsp;&nbsp;Nº de Película:&nbsp;</label><input type="text" size="5" name="idPelicula" value="<%= request.getParameter("idPelicula")%>" readonly>
                    </div>

                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nombre:&nbsp;</label><input type="text" size="20" name="nombre" value="<%= request.getParameter("nombre")%>">
                    </div>

                    <div class="form-group">
                        <label>&nbsp;&nbsp;Genero:&nbsp;</label><input type="text" size="10" name="genero" value="<%= request.getParameter("genero")%>">
                    </div>

                    <div class="form-group">
                        <label>&nbsp;&nbsp;Año:&nbsp;</label><input type="text" name="ano" size="4" value="<%= request.getParameter("ano")%>">
                    </div>

                    <div class="form-group">
                        <label>&nbsp;&nbsp;Director:&nbsp;</label><input type="text" name="director" size="20" value="<%= request.getParameter("director")%>">
                    </div>



                    <hr>
                    &nbsp;&nbsp;<a href="peliculas.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                </form>

            </div>
            <div class="text-center">&copy; Salvador Rebollo Benítez</div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
