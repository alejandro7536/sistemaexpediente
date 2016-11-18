<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
  <html ng-app="Expediente">
    <head>
    <img src="${pageContext.request.contextPath}/resources/images/Logo.png" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ghpages-materialize.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prism.css" />


    <!--<meta charset="UTF-8">-->
    <link rel="shortcut icon" href="${logoURL}">

      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="${materializeURL}"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="${indexURL}"  media="screen,projection"/>
      <link href="${primURL}" rel="stylesheet">
  <link href="${ghpagesURL}" type="text/css" rel="stylesheet" media="screen,projection">

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>Inicio</title>
</head>

   <body ng-controller="PacienteController">


<!--Barra Lateral-->
<header>
  <div class="container "><a href="#" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="material-icons">menu</i></a></div>
        <ul id="nav-mobile" class="side-nav fixed">
          <img src="${pageContext.request.contextPath}/resources/images/Logo3.png" width="300px">

          <li><div class="divider"></div></li>

          <li class="bold "><a href="principal.htm" class="waves-effect waves-light"><i class="material-icons">home</i>Inicio</a></li>
          <li class="bold"><a href="getAllUsuarios.htm" class="waves-effect waves-light"><i class="material-icons">perm_identity</i>Usuarios</a></li>
          <li class="bold active"><a href="pacientes" class="waves-effect waves-light"><i class="material-icons">pregnant_woman</i>Pacientes</a></li>
          <li class="bold"><a href="medicos.htm" class="waves-effect waves-light"><i class="material-icons">people</i>Médicos</a></li>
          


           <li class="bold"><a href="empleados" class="waves-effect waves-light"><i class="material-icons">local_drink</i>Empleados</a></li>
            <li class="bold"><a href="getAllClinicas.htm" class="waves-effect waves-light"><i class="material-icons">store</i>Clinicas</a></li>
            <li class="bold"><a href="index.htm" class="waves-effect waves-light"><i class="material-icons">close</i>Cerrar Sesión</a></li>
          </ul>
</header>
<!-- FIN Barra Lateral-->

<!-- barra de busqueda-->

 <main>
 
 <!-- AGREGAR Paciente-->


  <!-- Modal Structure -->
  <div id="modal1" class="modal">
    <div class="modal-content">
      <h4>Agregar Paciente</h4>
    </div>
  
  <div class="container">
  <div class="row">
            <form class="col s12" id="formulario" ng-submit="crearPac()">
              <div class="row">
                 <div class="input-field col s4">
                     <label for="id">Cod Persona</label>
                     <input name="codPersona" type="text" ng-model="newpac.codPersona" class="validate" required="">
                </div>
                <div class="input-field col s4">
                    <input name="nombre" type="text" ng-model="newpac.nombre" class="validate" required="">
                  <label for="first_name">Nombre</label>
                </div>
                <div class="input-field col s4">
                    <input name="apellido" type="text" ng-model="newpac.apellido" class="validate" required="">
                  <label for="last_name">Apellidos</label>
                </div>

               </div>
              <div class="row">
                 <div class="input-field col s6">
                     <input name="direccion" type="text" ng-model="newpac.direccion" class="validate" required="">
                  <label for="Edad">Direccion</label>
                </div>
                <div class="input-field col s6">
                  <input type="date" class="datepicker" id="fecha" name="fechaNacimiento" required="">
                  <label for="burnDate">Fecha de nacimiento</label>
                </div>

              </div>

              <div class="row">
                 <div class="input-field col s4">
                     <select name="genero" required="">
                          <option value="" disabled>Seleccionar Genero</option>
                          <option value="M" >Masculino</option>
                          <option value="F" >Femenino</option>
                        </select>
                        <label>Genero</label>

                      </div>
                <div class="input-field col s4">
                  <input name="profesion" type="text" ng-model="newpac.profesion" class="validate" required="">
                  <label for="Profesion">Profesion/Oficio</label>
                </div>


                 <div class="input-field col s4">
                     <select name="estadoCivil" required="">
                            <option value="" disabled>Estado Civil</option>
                            <option value="Soltero">Soltero</option>
                            <option value="2" >Casado</option>
                            <option value="3" >Divorciado</option>
                            <option value="4">Viudo</option>
                          </select>
                 <label>Estado Civil</label>

                </div>
              </div>
              <div class="row">
                  <div class="input-field col s6">
                      <select name="departamento" required="">
                          <option value="" disabled>Seleccionar Departamento</option>
                          <option value="1" >San Salvador</option>
                        </select>
                        <label>Departamento de residencia</label>
                      </div>

                      <div class="input-field col s6">
                        <select name="municipio" required="">
                          <option value="" disabled>Seleccionar Municipio</option>
                          <option value="1">Mejicanos</option>
                        </select>
                        <label>Municipio de residencia</label>

                      </div>
                  </div>
              <div class="row">
              <div class="row">
                <div class="input-field col s6">
                    <input name="padre" type="text" ng-model="newpac.padre" class="validate" required="">
                  <label for="padre">Nombre del padre</label>
                </div>

                <div class="input-field col s6">
                    <input name="madre" type="text" ng-model="newpac.madre" class="validate" required="">
                  <label for="madre">Nombre de la madre</label>
              </div>

              </div>


              <div class="row">
                <div class="input-field col s6">
                    <input name="dui" type="text" ng-model="newpac.dui" class="validate" required="">
                  <label for="dui">DUI</label>
                </div>

                <div class="input-field col s6">
                    <input id="conyuge" name="conyuge" type="text" ng-model="newpac.conyuge">
                  <label for="conyuge">Nombre de Conyuge</label>
              </div>

              </div>
              <div class="row">
                <div class="row"></div>
                <div class="row"></div>
                <div class="row">
                  <div class="col m6 offset-m6">
                      <button id ="submitPac" class="btn waves-effect waves-light #ffc107 amber" type="submit">Guardar</button>
                      <a href="#!" class=" modal-action modal-close waves-effect #e53935 red darken-1 waves-red btn-flat white-text">Cancelar</a>
                  </div>
                </div>
          </div>
        </div>
        
       </form>   
       

   <!-- FIN AGREGAR PACIENTE-->



</main>

  <!--<!encabezado-->
 <div class="section no-pad-bot #263238 blue-grey darken-4" id="ini">
         <div class="container ">
          <h2 class="white-text left thin"><i class="material-icons"></i>Administración de Pacientes</h2>
          <div class='row center'>
          </div>
        </div>
        </div>
  <br>



<div class="container">
    
        <!-- Modal Trigger -->
  <div class="row"></div>
  <a class="waves-effect waves-light btn modal-trigger #ffd600 yellow accent-4"  href="#modal1" id="addbutton"><i class="material-icons left ">person_add</i>Agregar paciente</a>
  
    <div id="pacientes">
        
   
       <br>

       <nav>
    <div class="nav-wrapper #f50057 red accent-3">
        <div class="input-field ">
          <input id="search" class="search" type="search" required placeholder="Buscar Paciente">
          <label for="search"><i class="material-icons">search</i></label>
          <i class="material-icons">close</i>
        </div>
    </div>
  </nav>
        
        <br>
        <br>
        
<table class="highlight centered" id="tabPacientes">
        <thead>
          <tr>
              <th data-field="id">Id Afiliado </th>
              <th data-field="price">Nombre</th>
              <th data-field="name">Apellido</th>
              <th data-field="price">Genero</th>
              <th data-field="price">Opciones</th>
          </tr>
        </thead>
        <tbody class="list">
            <tr ng-repeat="p in pacientes">
                <td class="id">{{p.idAfiliado}}</td>
                <td class="nombre">{{p.persona.nombre}}</td>
                <td class="apellido">{{p.persona.apellido}}</td>
                <td class="genero">{{p.persona.genero}}</td>
                <td><button ng-click="delete($index)" class="delete">Borrar</button></td>
                <td><button ng-click="edit($index)" class="update">Editar</button></td>
                <td><a href="expediente?id={{p.idAfiliado}}">Ir a expediente</a></td>
            </tr>
        </tbody>
      </table>
</div>
</div>
  

  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.0.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-serialize.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
  <script>
      
  </script>
</body>
</html>