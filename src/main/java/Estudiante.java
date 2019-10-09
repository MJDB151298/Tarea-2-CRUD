public class Estudiante {
    private int id;
    private int matricula;
    private String nombre;
    private String apellido;
    private String telefono;

    public Estudiante(){

    }

    public Estudiante(int matricula, String nombre, String apellido, String telefono){
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
    }

    public int getId() { return id; }
    public int getMatricula() {
        return this.matricula;
    }
    public String getNombre(){
        return this.nombre;
    }
    public String getApellido() {
        return apellido;
    }
    public String getTelefono() {
        return telefono;
    }

    public void setId(int id) { this.id = id; }
    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
