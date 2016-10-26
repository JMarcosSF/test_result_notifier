(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('QuestionDetailController', QuestionDetailController);

    QuestionDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'Question', 'Answer', 'ExamResult', 'Exam'];

    function QuestionDetailController($scope, $rootScope, $stateParams, previousState, entity, Question, Answer, ExamResult, Exam) {
        var vm = this;

        vm.question = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('testResultNotifierApp:questionUpdate', function(event, result) {
            vm.question = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
