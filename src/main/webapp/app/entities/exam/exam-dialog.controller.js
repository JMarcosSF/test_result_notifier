(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamDialogController', ExamDialogController);

    ExamDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'entity', 'Exam', 'Question', 'Course', 'ExamResult'];

    function ExamDialogController ($timeout, $scope, $stateParams, $uibModalInstance, entity, Exam, Question, Course, ExamResult) {
        var vm = this;

        vm.exam = entity;
        vm.clear = clear;
        vm.save = save;
        vm.questions = Question.query();
        vm.courses = Course.query();
        vm.examresults = ExamResult.query();

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.exam.id !== null) {
                Exam.update(vm.exam, onSaveSuccess, onSaveError);
            } else {
                Exam.save(vm.exam, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('testResultNotifierApp:examUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }


    }
})();
