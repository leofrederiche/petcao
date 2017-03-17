(function() {
  'use strict';

  angular
  .module('app')
  .factory('visitAPI', visitAPI);

  visitAPI.$inject = ['$resource'];

  function visitAPI($resource){
    return $resource('', {id: '@id'}, {
      index: {url: '/api/visits', method: 'GET', isArray: true},
      // new: {url: '/api/users/new', method: 'GET'},
      create: {url: '/api/visits', method: 'POST'},
      // edit: {url: '/api/users/:id/edit', method: 'GET'},
      // update: {url: '/api/users/:id', method: 'PATCH'},
      // destroy: {url: '/api/users/:id', method: 'DELETE'},
    });
  }
})();
