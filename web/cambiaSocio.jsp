<%-- 
    Author     : Sergio Dominguez Gomez
--%>

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
         <% request.setCharacterEncoding("UTF-8"); %>
    <div id="cambias">
      <br><br>
        <div>Modificación de socio</div>
          <form method="get" action="guardarSocioModificado.jsp">
        <div id="texto">Codigo de cliente
            <input type="text" name="codigo" size="10" value="<%= request.getParameter("codigoCli") %>" readonly><br></div>
        <div id="texto">Nombre
            <input type="text" name="nombre" size="30" value="<%= request.getParameter("nombre") %>"><br></div>
        <div id="texto">Apellidos
            <input type="text" name="apellidos" size="50" value="<%= request.getParameter("apellido") %>"><br></div>
        <div id="texto">Fecha de nacimiento
            <input type="text" name="fechNac" size="5" value="<%= request.getParameter("fechnac") %>"><br></div>
        <div id="texto">Código del carnet al que quieres apuntarte
            <input type="text" name="codiAct" size="20" value="<%= request.getParameter("codigoAct") %>"><br></div>
            <a href="index.jsp"><div id="cancelar">Cancelar</div></a>
        <button type="submit" value="Enviar" id="nuevoCliente">Enviar</button>          
        </form>

      </div>
    </div>
    </body>
</html>
