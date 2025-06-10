
package SERVICIOS;
import ModeloEntidad.Usuario;
import ModeloDAO.UsuarioDAO;

import java.sql.SQLException;

public class ServicioAutenticacion {
    
    private UsuarioDAO usuarioDAO;
 public ServicioAutenticacion() {
        this.usuarioDAO = new UsuarioDAO();
    }

    // Método para autenticar un usuario
    public Usuario autenticar(String nombreUsuario, String contrasena) throws Exception {
        try {
            // Llama al DAO con los nuevos nombres de parámetros
            Usuario usuario = usuarioDAO.validar(nombreUsuario, contrasena);
            if (usuario != null) {
                System.out.println("ServicioAutenticacion: Autenticación exitosa para: " + nombreUsuario);
                return usuario;
            } else {
                System.out.println("ServicioAutenticacion: Fallo de autenticación para: " + nombreUsuario);
                return null; // Credenciales inválidas
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("ServicioAutenticacion: Error durante la autenticación: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Error interno del sistema durante la autenticación. Por favor, inténtelo más tarde.", e);
        }
    }
    
}
