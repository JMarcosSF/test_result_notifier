(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('CourseDialogController', CourseDialogController);

    CourseDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'entity', 'Course', 'User', 'ExamResult', 'Exam'];

    function CourseDialogController ($timeout, $scope, $stateParams, $uibModalInstance, entity, Course, User, ExamResult, Exam) {
        var vm = this;

        vm.course = entity;
        vm.clear = clear;
        vm.save = save;
        vm.users = User.query();
        vm.examresults = ExamResult.query();
        vm.exams = Exam.query();

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.course.id !== null) {
                Course.update(vm.course, onSaveSuccess, onSaveError);
            } else {
                Course.save(vm.course, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('testResultNotifierApp:courseUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }


    }
})();
