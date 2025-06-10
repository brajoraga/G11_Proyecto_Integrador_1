package ModeloEntidad;

import java.time.LocalDateTime;

public class Usuario {

    private int id;
    private String nombre;
    private String pass;
    private boolean activo; // Para el campo 'activo' (puede ser tinyint(1) en MySQL)
    private String dni;
    private String rol; // Por ejemplo: "admin", "mesero", "cliente"
    private LocalDateTime fechaCreacion; // Antes 'fecha_creacion' (se usa CamelCase en Java)

    // Constructor vacío (necesario para JavaBeans) 
    public Usuario() {
    }

    // Constructor con todos los campos
    public Usuario(int id, String nombre, String pass, boolean activo, String dni, String rol, LocalDateTime fechaCreacion) {
        this.id = id;
        this.nombre = nombre;
        this.pass = pass;
        this.activo = activo;
        this.dni = dni;
        this.rol = rol;
        this.fechaCreacion = fechaCreacion;
    }

    // Constructor con todos los campos menos fecha porque se gestiona en BD
    public Usuario(int id, String nombre, String pass, boolean activo, String dni, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.pass = pass;
        this.activo = activo;
        this.dni = dni;
        this.rol = rol;
    }
    // --- Métodos Getters y Setters ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    

}
