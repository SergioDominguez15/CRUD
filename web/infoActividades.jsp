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
        <link rel="shortcut icon" type="image/x-icon" href="imagenes/icoauto.png">
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <div id="titulo">Tipos de Carnet</div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/autoescuela","root", "");
          Statement s = conexion.createStatement();

          ResultSet listadoActividad = s.executeQuery ("SELECT * FROM actividad");

          
        %>
        
        <table>
            <tr><th>Código del Carnet</th><th>Nombre del Carnet</th><th>Descripción del Carnet</th></tr>
        <%
          while (listadoActividad.next()) {
            out.println("<tr><td>");
            out.println(listadoActividad.getString("CodAct") + "</td>");
            out.println("<td>" + listadoActividad.getString("NomAct") + "</td>");
            out.println("<td>" + listadoActividad.getString("DescAct") + "</td>");
          }
        %>
        </tr>
        </table>
        
        <a href="index.jsp"><div id="infoActVolver">Página principal</div></a>
    </body>
</html>