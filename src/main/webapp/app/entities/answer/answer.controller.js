(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('AnswerController', AnswerController);

    AnswerController.$inject = ['$scope', '$state', 'Answer', 'AnswerSearch'];

    function AnswerController ($scope, $state, Answer, AnswerSearch) {
        var vm = this;
        
        vm.answers = [];
        vm.search = search;
        vm.loadAll = loadAll;

        loadAll();

        function loadAll() {
            Answer.query(function(result) {
                vm.answers = result;
            });
        }

        function search () {
            if (!vm.searchQuery) {
                return vm.loadAll();
            }
            AnswerSearch.query({query: vm.searchQuery}, function(result) {
                vm.answers = result;
            });
        }    }
})();
