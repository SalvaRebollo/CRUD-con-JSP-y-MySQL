<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/videoclub","root", "");
      Statement sta = conexion.createStatement();

      sta.execute ("DELETE FROM alquiler WHERE idAlquiler=" + request.getParameter("idAlquiler"));
      
      sta.close();
    %>	
    <script>document.location = "alquiler.jsp"</script> 
  </body>
</html>
