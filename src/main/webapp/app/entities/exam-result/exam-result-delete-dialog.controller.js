(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamResultDeleteController',ExamResultDeleteController);

    ExamResultDeleteController.$inject = ['$uibModalInstance', 'entity', 'ExamResult'];

    function ExamResultDeleteController($uibModalInstance, entity, ExamResult) {
        var vm = this;

        vm.examResult = entity;
        vm.clear = clear;
        vm.confirmDelete = confirmDelete;
        
        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function confirmDelete (id) {
            ExamResult.delete({id: id},
                function () {
                    $uibModalInstance.close(true);
                });
        }
    }
})();
