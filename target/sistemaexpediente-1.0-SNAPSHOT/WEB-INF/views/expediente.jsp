<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

   <body ng-controller="ExpedienteController">


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

  <!--<!encabezado-->
 <div class="section no-pad-bot #263238 blue-grey darken-4" id="ini">
         <div class="container ">
          <h2 class="white-text left thin"><i class="material-icons"></i>Expediente: {{expediente.paciente.persona.nombre}} {{expediente.paciente.persona.apellido}}</h2>
          <div class='row center'>
          </div>
        </div>
        </div>
  <br>



<div class="container">
   
    <div>
        
<table class="highlight centered">
        <thead>
          <tr>
              <th data-field="id">Id Consulta </th>
              <th data-field="price">Medico</th>
              <th data-field="name">Diagnostico</th>
              <th data-field="price">Sintomas</th>
              <th data-field="price">Signos</th>
          </tr>
        </thead>
        <tbody>            
        </tbody>
      </table>
</div>
</div>
<main>  

  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.0.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-serialize.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
  <script>
      
  </script>
</body>
</html>
