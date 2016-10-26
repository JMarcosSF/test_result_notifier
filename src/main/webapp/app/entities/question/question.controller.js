(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('QuestionController', QuestionController);

    QuestionController.$inject = ['$scope', '$state', 'Question', 'QuestionSearch'];

    function QuestionController ($scope, $state, Question, QuestionSearch) {
        var vm = this;
        
        vm.questions = [];
        vm.search = search;
        vm.loadAll = loadAll;

        loadAll();

        function loadAll() {
            Question.query(function(result) {
                vm.questions = result;
            });
        }

        function search () {
            if (!vm.searchQuery) {
                return vm.loadAll();
            }
            QuestionSearch.query({query: vm.searchQuery}, function(result) {
                vm.questions = result;
            });
        }    }
})();
