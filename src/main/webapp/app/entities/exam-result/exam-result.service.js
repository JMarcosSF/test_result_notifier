(function() {
    'use strict';
    angular
        .module('testResultNotifierApp')
        .factory('ExamResult', ExamResult);

    ExamResult.$inject = ['$resource'];

    function ExamResult ($resource) {
        var resourceUrl =  'api/exam-results/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true},
            'get': {
                method: 'GET',
                transformResponse: function (data) {
                    if (data) {
                        data = angular.fromJson(data);
                    }
                    return data;
                }
            },
            'update': { method:'PUT' }
        });
    }
})();
