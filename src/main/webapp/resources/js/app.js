angular.module('Expediente', [])
//Controlador del paciente, metodos REST
.controller('PacienteController', function ($scope, $http) {

    //Llamada ajax para traer todos los pacientes
    $http.get('/sistemaexpediente/pacientes/').then(function success(response) {
               $scope.pacientes = response.data;
            }, function error(error) {
                
            });
            
    //Llamada para borrar
    $scope.delete = function (indice) {
         var idAf = $scope.pacientes[indice].idAfiliado
         console.log(idAf);
         $http.delete('/sistemaexpediente/pacientes/'+idAf).then(function success(parameters) {
                 console.log("deleted")   
                });
        };
        
    //Llamada para editar        
    $scope.edit = function (indice) {
           var idAfi = $scope.pacientes[indice].idAfiliado 
           console.log(idAfi);
           $http.get('/sistemaexpediente/pacientes/'+idAfi).then(function success(parameters) {
                  console.log(parameters.data);  
                })
         };
         
    //Llamada para crear el nuevo paciente     
    $scope.crearPac = function () {
        var temp = $scope.newpac;
        temp.fechaNacimiento = new Date("2015/03/25");
        temp.genero = "M";
        temp.estadoCivil = "Soltero";
        temp.departamento = 1;
        temp.municipio = 1;
        $http.post('/sistemaexpediente/pacientes/', JSON.stringify(temp)).then(function success() {
                    $scope.newpac = {};
                })
        }

})
//Controlador del expediente, metodos REST        
.controller('ExpedienteController', function ($scope, $http, $window) {
        $scope.expediente = {};
        var pacId = parseQuery($window)["id"];
        var url = '/sistemaexpediente/expedientes/'+pacId;
        console.log(url);
        $http.get(url).then(function success(response) {
                console.log(response.data)
                $scope.expediente = response.data;
            }, function error(error) {
                console.log(error);
            });
        
}).controller('EmpleadoController', function ($scope, $http) {
        console.log('Were in');
        
        //Get all the empleados mofo
        $http.get('/sistemaexpediente/empleados/').then(function success(parameters) {
        console.log(parameters.data);
    })
        
        
});




        //Materialize code
        $(document).ready(function(){
            $('.modal-trigger').leanModal();
            });

        $(document).ready(function() {
            $('select').material_select();
        });
        
        //Para extraer url
        function parseQuery($window) {

          var str = $window.location.search;
          var objURL = {};
          str.replace(
          new RegExp( "([^?=&]+)(=([^&]*))?", "g" ),
          function( $0, $1, $2, $3 ){
            objURL[ $1 ] = $3;
            }
        );
        return objURL;
        };
