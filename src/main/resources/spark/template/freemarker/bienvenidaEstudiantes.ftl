<!DOCTYPE html>
<html lang="en">
<head>
    <title>Estudiantes</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>


<body>
    <div class="container">
        <table class="table">
            <div class="row">
                <div>
         	        <h2>Manejar Estudiantes</h2>
            	</div>
            	<div class="col-sm-6">
            		<button id="crear" class="btn btn-success" data-toggle="modal" data-target="#registerOrEdit"><span>Nuevo Estudiante</span></button>
            	</div>
            </div>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Matricula</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Telefono</th>
                </tr>
            </thead>
            <tbody>
                <#list listaEstudiantes as estudiante>
                    <tr>
                        <td>${estudiante.id}</td>
                        <td>${estudiante.matricula?string["0"]}</td>
                        <td>${estudiante.nombre}</td>
                        <td>${estudiante.apellido}</td>
                        <td>${estudiante.telefono}</td>
                        <td>
                            <button data-matricula=${estudiante.matricula?string["0"]} data-nombre="${estudiante.nombre}" data-apellido="${estudiante.apellido}" data-telefono="${estudiante.telefono}" data-id="${estudiante.id}" id="editar" type="button" class="btn btn-secondary" data-toggle="modal" data-target="#registerOrEdit">Editar</button>
                        </td>
                        <td><button data-id=${estudiante.id} id="eliminar" type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete">Eliminar</button></td>
                    </tr>
                </#list>
            </tbody>
        </table>

        <div class="modal fade" id="registerOrEdit">
        	<div class="modal-dialog">
        		<div class="modal-content">
        		<form id="formEstudiante" role="form" method="post">
        			<div class="modal-header">
        				<h4 class="modal-title">klk</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>

        			<div class="modal-body">	
        					<div class="form-group">
								<label>Matricula</label>
								<input id="inputMatricula" name="matricula" type="number" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Nombre</label>
								<input id="inputNombre" name="nombre" type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Apellido</label>
								<input id="inputApellido" name="apellido" type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Telefono</label>
								<input id="inputTelefono" name="telefono" type="number" class="form-control" required>
							</div>	
        			</div>
        			
        			<div class="modal-footer">
        				<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-info" value="Guardar">
        			</div>
        		</form>
        	</div>
        	</div>
        </div>
    </div>

	<!-- Modal HTML -->
	<div class="modal fade" id="delete">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons">&#xE5CD;</i>
					</div>
					<h4 class="modal-title">Está seguro?</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Está seguro que desea eliminar este estudiante?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Cancelar</button>
					<button method="post" id="confirmDelete" type="button" class="btn btn-danger">Eliminar</button>
				</div>
			</div>
		</div>
	</div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"
			integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
          crossorigin="anonymous"></script>

          <script type="text/javascript">
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

                    $("#inputMatricula").attr('placeholder', "");
                    $("#inputNombre").attr('placeholder', "");
                    $("#inputApellido").attr('placeholder', "");
                    $("#inputTelefono").attr('placeholder', "");

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
          </script>
</body>
</html>