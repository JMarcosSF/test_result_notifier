(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamController', ExamController);

    ExamController.$inject = ['$scope', '$state', 'Exam', 'ExamSearch'];

    function ExamController ($scope, $state, Exam, ExamSearch) {
        var vm = this;
        
        vm.exams = [];
        vm.search = search;
        vm.loadAll = loadAll;

        loadAll();

        function loadAll() {
            Exam.query(function(result) {
                vm.exams = result;
            });
        }

        function search () {
            if (!vm.searchQuery) {
                return vm.loadAll();
            }
            ExamSearch.query({query: vm.searchQuery}, function(result) {
                vm.exams = result;
            });
        }    }
})();
