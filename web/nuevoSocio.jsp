<%-- 
    Author     : Sergio Dominguez Gomez
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>AUTOESCUELA</title>
        <link rel="shortcut icon" type="image/x-icon" href="imagenes/2115mancuerna.ico">
        <link rel="stylesheet" type="text/css" href="estilos.css">
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/autoescuela","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      // Comprueba la existencia del número de socio introducido
      String consultaNumSocio = "SELECT * FROM cliente WHERE CodCli="
                                + Integer.valueOf(request.getParameter("codigo"));      
      
      ResultSet numeroDeSocios = s.executeQuery (consultaNumSocio);
      numeroDeSocios.last();
      
      if (numeroDeSocios.getRow() != 0) {
        out.println("Lo siento, no se ha podido dar de alta, ya existe un cliente con el código "
                    + request.getParameter("socioID") + ".");
      } else {
        String insercion = "INSERT INTO cliente VALUES (" + Integer.valueOf(request.getParameter("codigo"))
                           + ", '" + request.getParameter("nombre")
                           + "', '" + request.getParameter("apellidos")
                           + "', '" + request.getParameter("fechNac") + "')";
        s.execute(insercion);
        String insercion2 = "INSERT INTO apuntado VALUES (" + Integer.valueOf(request.getParameter("codigo"))
                           + ", " + Integer.valueOf(request.getParameter("codAct"))
                           + ", '" + "1900-01-01" + "')";
        s.execute(insercion2);
        out.println("Socio dado de alta correctamente.");
      }
      conexion.close();
    %>
    <br>
    <a href="index.jsp"><div id="Volver">Página principal</div></a>
    
    </body>
</html>
