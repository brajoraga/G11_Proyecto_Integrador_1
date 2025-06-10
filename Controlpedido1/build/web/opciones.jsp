

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloEntidad.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sol y Mar - Opciones</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                padding: 50px;
            }
            .welcome-container {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                display: inline-block;
            }
            .welcome-container h1 {
                color: #333;
                margin-bottom: 20px;
            }
            .welcome-container p {
                color: #555;
                margin-bottom: 20px;
            }
            .option-button {
                background-color: #28a745;
                color: white;
                padding: 12px 25px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                font-size: 18px;
                margin: 10px;
                display: inline-block;
            }
            .option-button:hover {
                background-color: #218838;
            }
            .logout-button {
                background-color: #dc3545;
                margin-top: 30px;
                padding: 10px 20px;
                font-size: 16px;
            }
            .logout-button:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="welcome-container">
            <% Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado"); %>
            <% if (usuario != null) {%>
            <h1>¡Bienvenido, <%= usuario.getNombre()%>!</h1> <%-- Usamos getNombre() --%>
            <p>Tu rol es: <%= usuario.getRol()%></p>
            <p>¿Qué te gustaría hacer hoy?</p>
            <a href="ControladorPrincipal?accion=verPlatillos" class="option-button">Ver Platillos</a> <%-- Enlace a un futuro controlador principal --%>
            <a href="#" class="option-button">Gestionar Pedidos</a>
            <% } else {%>
            <p>No has iniciado sesión. Por favor, <a href="<%= request.getContextPath()%>/login.jsp">inicia sesión</a>.</p>
            <% }%>
        </div>
        <br>
        <a href="<%= request.getContextPath()%>/LogoutControlador" class="option-button logout-button">Cerrar Sesión</a>

    </body>
</html>
