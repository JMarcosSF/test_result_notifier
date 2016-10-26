(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamResultDetailController', ExamResultDetailController);

    ExamResultDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'ExamResult', 'User', 'Question', 'Answer', 'Course', 'Exam'];

    function ExamResultDetailController($scope, $rootScope, $stateParams, previousState, entity, ExamResult, User, Question, Answer, Course, Exam) {
        var vm = this;

        vm.examResult = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('testResultNotifierApp:examResultUpdate', function(event, result) {
            vm.examResult = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
