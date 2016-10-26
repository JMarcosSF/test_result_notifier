(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamResultDialogController', ExamResultDialogController);

    ExamResultDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'entity', 'ExamResult', 'User', 'Question', 'Answer', 'Course', 'Exam'];

    function ExamResultDialogController ($timeout, $scope, $stateParams, $uibModalInstance, entity, ExamResult, User, Question, Answer, Course, Exam) {
        var vm = this;

        vm.examResult = entity;
        vm.clear = clear;
        vm.save = save;
        vm.users = User.query();
        vm.questions = Question.query();
        vm.answers = Answer.query();
        vm.courses = Course.query();
        vm.exams = Exam.query();

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.examResult.id !== null) {
                ExamResult.update(vm.examResult, onSaveSuccess, onSaveError);
            } else {
                ExamResult.save(vm.examResult, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('testResultNotifierApp:examResultUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }


    }
})();
