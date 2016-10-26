(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamDetailController', ExamDetailController);

    ExamDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'Exam', 'Question', 'Course', 'ExamResult'];

    function ExamDetailController($scope, $rootScope, $stateParams, previousState, entity, Exam, Question, Course, ExamResult) {
        var vm = this;

        vm.exam = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('testResultNotifierApp:examUpdate', function(event, result) {
            vm.exam = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
