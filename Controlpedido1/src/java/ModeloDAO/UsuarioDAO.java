
package ModeloDAO;
import Configuracion.ConexionBD1;
import ModeloEntidad.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime; // Necesario para convertir de Timestamp a LocalDateTime


public class UsuarioDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // Método para validar un usuario por nombre (username) y pass (password)
    // Ahora incluye todos los campos
    public Usuario validar(String nombreUsuario, String contrasena) throws SQLException, ClassNotFoundException {
        Usuario usuario = null;
        // La consulta SQL ahora selecciona todos los campos relevantes
        String sql = "SELECT id, nombre, pass, activo, dni, rol, fecha_creacion FROM usuario WHERE nombre = ? AND pass = ?";

        try {
            con = ConexionBD1.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            System.out.println("UsuarioDAO: Ejecutando query para validar usuario: " + nombreUsuario);

            if (rs.next()) { // Si se encuentra un resultado
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setPass(rs.getString("pass"));
                // MySQL TINYINT(1) se mapea a boolean en JDBC
                usuario.setActivo(rs.getBoolean("activo")); 
                usuario.setDni(rs.getString("dni"));
                usuario.setRol(rs.getString("rol"));
                
                // Manejo de fecha_creacion (TIMESTAMP en MySQL a LocalDateTime en Java)
                java.sql.Timestamp timestamp = rs.getTimestamp("fecha_creacion");
                if (timestamp != null) {
                    usuario.setFechaCreacion(timestamp.toLocalDateTime());
                } else {
                    usuario.setFechaCreacion(null); // O maneja el caso de que sea nulo
                }

                System.out.println("UsuarioDAO: Usuario encontrado: " + usuario.getNombre() + " con rol: " + usuario.getRol());
            } else {
                System.out.println("UsuarioDAO: Credenciales inválidas para el usuario: " + nombreUsuario);
            }
        } finally {
            // Asegúrate de cerrar los recursos
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
            System.out.println("UsuarioDAO: Recursos de conexión cerrados.");
        }
        return usuario;
    }
}
