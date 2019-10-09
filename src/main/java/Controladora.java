import java.io.Serializable;
import java.util.ArrayList;

public class Controladora implements Serializable {
    private static final long serialVersionUID = 1L;
    private ArrayList<Estudiante> misEstudiantes;
    private static Controladora controladora;

    public Controladora(){
        misEstudiantes = new ArrayList<>();
    }

    public static Controladora getInstance() {
        if (controladora == null) {
            controladora = new Controladora();
        }
        return controladora;
    }

    public ArrayList<Estudiante> getMisEstudiantes(){
        return this.misEstudiantes;
    }

    public void addEstudiante(Estudiante estudiante){
        estudiante.setId(Controladora.getInstance().getMisEstudiantes().size()+1);
        Controladora.getInstance().getMisEstudiantes().add(estudiante);
    }

    public Estudiante buscarEstudiante(String id){
        for(Estudiante e : Controladora.getInstance().getMisEstudiantes()){
            if(id.equalsIgnoreCase(Integer.toString(e.getId()))){
                return e;
            }
        }
        return null;
    }

    public void eliminarEstudiante(Estudiante estudiante){
        int index = Controladora.getInstance().getMisEstudiantes().indexOf(estudiante);
        Controladora.getInstance().getMisEstudiantes().remove(index);
        for(int i = 0; i < Controladora.getInstance().getMisEstudiantes().size(); i++){
            Controladora.getInstance().getMisEstudiantes().get(i).setId(i+1);
        }
    }

    public void editarEstudiante(int index, String matricula, String nombre, String apellido, String telefono){
        if(matricula.matches("[0-9]+")){
            System.out.println("Soy matricula");
            Controladora.getInstance().getMisEstudiantes().get(index).setMatricula(Integer.parseInt(matricula));
        }
        if(nombre.matches( "[a-zA-Z]+")){
            Controladora.getInstance().getMisEstudiantes().get(index).setNombre(nombre);
        }
        if(apellido.matches("[a-zA-Z]+")){
            Controladora.getInstance().getMisEstudiantes().get(index).setApellido(apellido);
        }
        if(telefono.matches("[0-9]+")){
            Controladora.getInstance().getMisEstudiantes().get(index).setTelefono(telefono);
        }
    }

    public boolean validarMatricula(int matricula){
        for(Estudiante estudiante : Controladora.getInstance().getMisEstudiantes()){
            if(estudiante.getMatricula() == matricula){
                return false;
            }
        }
        return true;
    }
}
