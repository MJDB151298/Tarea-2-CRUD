$(document).ready(function(){
    var accion;
    var id;
    $('.container').on('click', 'button#editar', function(){
        id = $(this).attr('data-id');
        $(".modal-title").text('Editar Estudiante');
        accion = "/editar/"+id;

        var matricula = $(this).attr('data-matricula');
        var nombre =  $(this).attr('data-nombre');
        var apellido = $(this).attr('data-apellido');
        var telefono = $(this).attr('data-telefono');

        $("#inputMatricula").attr('placeholder', matricula);
        $("#inputNombre").attr('placeholder', nombre);
        $("#inputApellido").attr('placeholder', apellido);
        $("#inputTelefono").attr('placeholder', telefono);

        $("#inputMatricula").prop('required',false);
        $("#inputNombre").prop('required',false);
        $("#inputApellido").prop('required',false);
        $("#inputTelefono").prop('required',false);
    });

    $('.container').on('click', 'button#crear', function(){
        $(".modal-title").text('Nuevo Estudiante');
        accion = "/guardar/";

        $("#inputMatricula").prop('required',true);
        $("#inputNombre").prop('required',true);
        $("#inputApellido").prop('required',true);
        $("#inputTelefono").prop('required',true);
    });

    $('.container').on('click', 'button#eliminar', function() {
        id = $(this).attr('data-id');
        accion = "/eliminar/"+id;
    });

    $("#formEstudiante").submit(function (event) {
        $(this).attr('action', accion.toString());
    });

    $('#delete').on('click', 'button#confirmDelete', function(){
        console.log(accion.toString());
        document.location.href = accion.toString();
        //window.location = accion.toString();
    });
    
  });