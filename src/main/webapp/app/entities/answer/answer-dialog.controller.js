(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('AnswerDialogController', AnswerDialogController);

    AnswerDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'entity', 'Answer', 'ExamResult', 'Question'];

    function AnswerDialogController ($timeout, $scope, $stateParams, $uibModalInstance, entity, Answer, ExamResult, Question) {
        var vm = this;

        vm.answer = entity;
        vm.clear = clear;
        vm.save = save;
        vm.examresults = ExamResult.query();
        vm.questions = Question.query();

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.answer.id !== null) {
                Answer.update(vm.answer, onSaveSuccess, onSaveError);
            } else {
                Answer.save(vm.answer, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('testResultNotifierApp:answerUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }


    }
})();
