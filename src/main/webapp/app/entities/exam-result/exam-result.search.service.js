(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .factory('ExamResultSearch', ExamResultSearch);

    ExamResultSearch.$inject = ['$resource'];

    function ExamResultSearch($resource) {
        var resourceUrl =  'api/_search/exam-results/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true}
        });
    }
})();
