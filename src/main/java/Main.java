import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.Route;
import spark.template.freemarker.FreeMarkerEngine;

import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;



public class Main {
    public static void main(String[] args) {
        staticFiles.location("/spark/template/freemarker");

        get("/inicio/", (request, response) -> {
            Map<String, Object> atributos = new HashMap<>();
            atributos.put("listaEstudiantes", Controladora.getInstance().getMisEstudiantes());
            return renderFreemarker(atributos, "bienvenidaEstudiantes.ftl");
        });

        get("/eliminar/:id", (request, response) -> {
            String id = request.params("id");
            Estudiante estudiante = Controladora.getInstance().buscarEstudiante(id);
            Controladora.getInstance().eliminarEstudiante(estudiante);

            response.redirect("/inicio/");
            return "";
        });

        post("/editar/:id", (request, response) -> {
            String id = request.params("id");
            System.out.println(id);
            String matricula = request.queryParams("matricula");
            String nombre = request.queryParams("nombre");
            String apellido = request.queryParams("apellido");
            String telefono = request.queryParams("telefono");
            System.out.println("Soy el valor de: " + matricula);

            Estudiante estudiante = Controladora.getInstance().buscarEstudiante(id);
            int index =  Controladora.getInstance().getMisEstudiantes().indexOf(estudiante);
            Controladora.getInstance().editarEstudiante(index, matricula, nombre, apellido, telefono);
            response.redirect("/inicio/");
            return "";
        });

        post("/guardar/", (request, response) -> {
            String matricula = request.queryParams("matricula");
            String nombre = request.queryParams("nombre");
            String apellido = request.queryParams("apellido");
            String telefono = request.queryParams("telefono");
            System.out.println("Soy el estudiante: " + nombre + "con la matricula " + matricula);
            Estudiante estudiante = new Estudiante(Integer.parseInt(matricula), nombre, apellido, telefono);
            Controladora.getInstance().addEstudiante(estudiante);

            response.redirect("/inicio/");
            return "";
        });
    }

    public static String renderFreemarker(Map<String, Object> model, String templatePath) {
        return new FreeMarkerEngine().render(new ModelAndView(model, templatePath));
    }
}
