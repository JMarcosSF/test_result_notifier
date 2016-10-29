(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamResultController', ExamResultController);

    ExamResultController.$inject = ['$scope', '$state', 'ExamResult', 'ExamResultSearch', 'ExamResultUtil'];

    function ExamResultController ($scope, $state, ExamResult, ExamResultSearch, ExamResultUtil) {
        var vm = this;

        vm.examResults = [];
        vm.search = search;
        vm.loadAll = loadAll;
        vm.getExamScore = ExamResultUtil.getExamScore;

        loadAll();

        function loadAll() {
            ExamResult.query(function(result) {
                vm.examResults = result;
            });
        }

        function search () {
            if (!vm.searchQuery) {
                return vm.loadAll();
            }
            ExamResultSearch.query({query: vm.searchQuery}, function(result) {
                vm.examResults = result;
            });
        }    }
})();
