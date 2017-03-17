(function() {
  'use strict';

  angular
    .module('app')
    .controller('VisitIndex', VisitIndex);

  VisitIndex.$inject = ['visitAPI', '$rootScope'];

  function VisitIndex(visitAPI, $rootScope) {

    var mv = this;
    mv.load = load;
    mv.create = create;

    function load(dog_id){
      var params = {dog_id: dog_id};
      visitAPI.index(params, function(data){
        mv.visits = data;
      }, function (errors){
        console.log("Error: On load 'Visits' ->", errors);
      })
    }

    function create(){
      console.log(mv.visit);
      visitAPI.create({visit: mv.visit}, function(data){
        load(mv.visit.dog_id);
      }, function (errors){
        console.log("Error: On create 'Visit' ->", errors);
      })
    }

  }
})();
