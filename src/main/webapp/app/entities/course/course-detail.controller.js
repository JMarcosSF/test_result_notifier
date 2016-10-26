(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('CourseDetailController', CourseDetailController);

    CourseDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'Course', 'User', 'ExamResult', 'Exam'];

    function CourseDetailController($scope, $rootScope, $stateParams, previousState, entity, Course, User, ExamResult, Exam) {
        var vm = this;

        vm.course = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('testResultNotifierApp:courseUpdate', function(event, result) {
            vm.course = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
