
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ModeloEntidad.Usuario;
import SERVICIOS.ServicioAutenticacion;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {

       private ServicioAutenticacion servicioAutenticacion;

       @Override
    public void init() throws ServletException {
        super.init();
        this.servicioAutenticacion = new ServicioAutenticacion();
        System.out.println("LoginControlador: Servlet inicializado. ServicioAutenticacion listo.");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
// Obtiene los parámetros del formulario de login
        String nombreUsuario = request.getParameter("nombreUsuario"); // Cambiado de 'username' a 'nombreUsuario'
        String contrasena = request.getParameter("contrasena");       // Cambiado de 'password' a 'contrasena'

        System.out.println("LoginControlador: Intentando login para usuario: " + nombreUsuario);

        try {
            Usuario usuarioAutenticado = servicioAutenticacion.autenticar(nombreUsuario, contrasena);

            if (usuarioAutenticado != null) {
                HttpSession sesion = request.getSession(); // Cambiado de 'session' a 'sesion'
                sesion.setAttribute("usuarioAutenticado", usuarioAutenticado);
                sesion.setMaxInactiveInterval(30 * 60);

                System.out.println("LoginControlador: Login exitoso. Redirigiendo a /vista/opciones.jsp");
                // Redirigimos a una carpeta 'vista' para organizar mejor los JSPs
                response.sendRedirect(request.getContextPath() + "/opciones.jsp");
            } else {
                System.out.println("LoginControlador: Credenciales inválidas. Reenviando a login.jsp");
                request.setAttribute("mensajeError", "Usuario o contraseña incorrectos."); // Cambiado a 'mensajeError'
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("LoginControlador: Error al procesar el login: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("mensajeError", "Ocurrió un error inesperado. Por favor, inténtelo de nuevo más tarde.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("LoginControlador: Petición GET, reenviando a login.jsp");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
 
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
