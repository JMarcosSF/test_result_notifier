(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .factory('ExamSearch', ExamSearch);

    ExamSearch.$inject = ['$resource'];

    function ExamSearch($resource) {
        var resourceUrl =  'api/_search/exams/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true}
        });
    }
})();
