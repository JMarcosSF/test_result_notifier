(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamResultDetailController', ExamResultDetailController);

    ExamResultDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'ExamResult', 'User', 'Question', 'Answer', 'Course', 'Exam', 'ExamResultUtil'];

    function ExamResultDetailController($scope, $rootScope, $stateParams, previousState, entity, ExamResult, User, Question, Answer, Course, Exam, ExamResultUtil) {
        var vm = this;

        vm.examResult = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('testResultNotifierApp:examResultUpdate', function(event, result) {
            vm.examResult = result;
        });

        vm.examResult.score = ExamResultUtil.getExamScore(vm.examResult.answers, vm.examResult.questions);

        $scope.$on('$destroy', unsubscribe);
    }
})();
