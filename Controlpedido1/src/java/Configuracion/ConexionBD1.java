/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Configuracion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionBD1 {
    // Datos de conexión a tu base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/bdmarino"; // <<< VERIFICA ESTO >>>:
                                                                            // - localhost (si MySQL está en tu máquina)
                                                                            // - 3306 (el puerto por defecto de MySQL)
                                                                            // - bdmarino (¡EL NOMBRE EXACTO DE TU BASE DE DATOS!)
    private static final String USER = "root"; // <<< VERIFICA ESTO >>>: Tu usuario de MySQL
    private static final String PASS = "";     // <<< VERIFICA ESTO >>>: Tu contraseña de MySQL (vacía si no tienes)

    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con = null; // Inicializamos con a null
        try {
            // Carga el driver JDBC de MySQL
            // El driver correcto
            // el conector 8.x.x, usa: "com.mysql.cj.jdbc.Driver"
            // un conector MySQL más antiguo (5.x.x), usa: "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            
            // Establece la conexión
            con = DriverManager.getConnection(URL, USER, PASS);
            
            // Mensaje de depuración: ¡Esto debería aparecer en la consola de NetBeans!
            System.out.println("ConexionBD: Conexión a la base de datos establecida correctamente.");
            
        } catch (ClassNotFoundException e) {
            System.err.println("ConexionBD Error: Driver JDBC de MySQL no encontrado.");
            System.err.println("Asegúrate de que el archivo 'mysql-connector-j-X.X.X.jar' esté en la carpeta 'Libraries' de tu proyecto.");
            e.printStackTrace(); // Imprime la traza completa del error para depurar
            throw e; // Relanza la excepción para que el código que llama sepa que hubo un problema
        } catch (SQLException e) {
            System.err.println("ConexionBD Error: No se pudo conectar a la base de datos.");
            System.err.println("Causa: " + e.getMessage());
            System.err.println("Verifica: URL, usuario, contraseña de MySQL, o si el servidor MySQL está activo.");
            e.printStackTrace(); // Imprime la traza completa del error
            throw e; // Relanza la excepción
        }
        return con;
    }
}
