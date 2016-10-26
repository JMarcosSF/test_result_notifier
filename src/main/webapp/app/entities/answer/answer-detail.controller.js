(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('AnswerDetailController', AnswerDetailController);

    AnswerDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'Answer', 'ExamResult', 'Question'];

    function AnswerDetailController($scope, $rootScope, $stateParams, previousState, entity, Answer, ExamResult, Question) {
        var vm = this;

        vm.answer = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('testResultNotifierApp:answerUpdate', function(event, result) {
            vm.answer = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
