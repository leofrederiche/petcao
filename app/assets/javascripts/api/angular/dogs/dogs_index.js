(function() {
  'use strict';

  angular
    .module('app')
    .controller('DogIndex', DogIndex);

  DogIndex.$inject = ['dogAPI', '$rootScope'];

  function DogIndex(dogAPI, $rootScope) {

    var vm = this;
    vm.load = load;
    vm.create = create;


    vm.loading = true;
    function load(limit){
      var params = {limit: limit};
      dogAPI.index(params, function(data){
        vm.dogs = data;
        vm.loading = false;
      }, function (errors){
        console.log("Error: On load 'Dogs' ->", errors);
      })
    }

    function create(){
      console.log("cachorro -->", vm.dog);
      dogAPI.create({dog: vm.dog}, function(data){
        window.location = "/dogs";
      }, function (errors){
        console.log("Error: On create 'Dog' ->", errors);
      })
    }


  }
})();
