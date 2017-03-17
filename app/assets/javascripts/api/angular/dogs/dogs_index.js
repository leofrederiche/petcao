(function() {
  'use strict';

  angular
    .module('app')
    .controller('DogIndex', DogIndex);

  DogIndex.$inject = ['dogAPI', '$rootScope'];

  function DogIndex(dogAPI, $rootScope) {

    var vm = this;
    vm.load = load;
    vm.teste = "testasdasde";

    function load(limit){
      var params = {limit: limit};
      dogAPI.index(params, function(data){
        vm.dogs = data;
      }, function (errors){
        console.log("Error: On load 'Dogs' ->", errors);
      })
    }

  }
})();
