

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sol y Mar - Iniciar Sesión</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                width: 300px;
                text-align: center;
            }
            .login-container h2 {
                margin-bottom: 20px;
                color: #333;
            }
            .login-container input[type="text"], .login-container input[type="password"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .login-container input[type="submit"] {
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
            }
            .login-container input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .error-message {
                color: red;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Iniciar Sesión</h2>

            <%-- Muestra el mensaje de error si lo hay (cambiado de 'errorMessage' a 'mensajeError') --%>
            <% if (request.getAttribute("mensajeError") != null) {%>
            <p class="error-message"><%= request.getAttribute("mensajeError")%></p>
            <% }%>

            <form action="<%= request.getContextPath()%>/LoginControlador" method="POST">
                <input type="text" name="nombreUsuario" placeholder="Usuario" required><br>
                <input type="password" name="contrasena" placeholder="Contraseña" required><br>
                <input type="submit" value="Entrar">
            </form>
        </div>
    </body>
</html>
