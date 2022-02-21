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
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet">
    </head>
    <body>
        <div id="titulo">AUTOESCUELA</div>
        <a href="infoActividades.jsp"><div id="infoAct">Información sobre los carnet</div></a>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/autoescuela", "root", "");
          Statement s = conexion.createStatement();

          ResultSet listadoCliente = s.executeQuery("SELECT c.CodCli, c.NomCli, c.ApeCli, c.FechNac, a.CodAct FROM cliente c, apuntado a WHERE c.CodCli = a.CodCli");


        %>

        <table>
            <tr><th>Código Cliente</th><th>Nombre</th><th>Apellidos</th><th>Fecha de nacimiento</th><th>CodAct</th></tr>
                    <%          while (listadoCliente.next()) {
                        out.println("<tr><td>");
                        out.println(listadoCliente.getString("CodCli") + "</td>");
                        out.println("<td>" + listadoCliente.getString("NomCli") + "</td>");
                        out.println("<td>" + listadoCliente.getString("ApeCli") + "</td>");
                        out.println("<td>" + listadoCliente.getString("FechNac") + "</td>");
                        out.println("<td>" + listadoCliente.getString("CodAct") + "</td>");
                      
                    %>
            <td>
                <form id="modificar" name="modificar" method="get" action="cambiaSocio.jsp">
                    <input type="hidden" name="codigoCli" value="<%=listadoCliente.getString("CodCli")%>" >
                    <input type="hidden" name="nombre" value="<%=listadoCliente.getString("NomCli")%>" >
                    <input type="hidden" name="apellido" value="<%=listadoCliente.getString("ApeCli")%>" >
                    <input type="hidden" name="fechnac" value="<%=listadoCliente.getString("FechNac")%>" >
                    <input type="hidden" name="codigoAct" value="<%=listadoCliente.getString("CodAct")%>" >
                    <input type="submit"  id="modificarBoton" value="Modificar">
                </form>
            </td>
            <td>
                <form method="get" action="borraSocio.jsp">
                    <input type="hidden" name="codigoCli" value="<%=listadoCliente.getString("CodCli")%>"/>
                    <button type="submit" id="eliminarBoton">Eliminar</button>
                </form>
            </td>
        </tr>
        <%
          } 

         
        %>
    </table>
    <br>
    <div>

                    <img id="coche" src="imagenes/coche.jpg" alt="alt"/>
    <form id="pregunta" method="get" action="nuevoSocio.jsp">
            <div id="apuntar">¿Quieres apuntarte?</div>
        <div id="texto">Introduce tu código de identificación deseado
            <input type="number" name="codigo" size="10" required><br></div>
        <div id="texto">Introduce tu nombre
            <input type="text" name="nombre" size="30" required><br></div>
        <div id="texto">Introduce tus apellidos
            <input type="text" name="apellidos" size="50" required><br></div>
        <div id="texto">Introduce tu fecha de nacimiento
            <input type="date" name="fechNac" size="5" required><br></div>
        <div id="texto">Introduce el código del Carnet al que quieres apuntarte
            <input type="number" name="codAct" min="1" max="5" required><br></div>
        <button type="submit" value="Enviar" id="nuevoCliente">Enviar</button> 

    </form>
 
    </div>

</body>
<script type="text/javascript">

</script>
</html>
