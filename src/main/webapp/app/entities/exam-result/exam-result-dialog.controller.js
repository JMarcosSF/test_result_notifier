(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .controller('ExamResultDialogController', ExamResultDialogController);

    ExamResultDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'entity', 'ExamResult', 'User', 'Question', 'Answer', 'Course', 'Exam'];

    function ExamResultDialogController ($timeout, $scope, $stateParams, $uibModalInstance, entity, ExamResult, User, Question, Answer, Course, Exam) {
        var vm = this;

        vm.examResult = entity;
        vm.examResult.answers = [];
        vm.clear = clear;
        vm.save = save;
        vm.filterAnswers = filterAnswers;
        vm.checkboxFix = checkboxFix;
        Course.query().$promise
            .then(function(value) {
                vm.courses = value;
                vm.exams = Exam.query();
        }, function(err) {
            console.log("Error: " + err);
        });

        vm.examResult.course = null;
        $scope.$watch('vm.examResult.course', function() {
            if(vm.examResult.course) {
                Course.get({id : vm.examResult.course.id}).$promise.then(function(value) {
                    vm.users = value.students;
                }, function(err) {
                    console.log("Error: " + err);
                });
            }
        });
        $scope.$watch('vm.examResult.exam', function() {
            if(vm.examResult.exam) {
                Question.query().$promise.then(function(value) {
                    vm.questions = value.filter(function(obj) {
                        return obj.exam.id === vm.examResult.exam.id;
                    });

                }).then(function() {
                    Answer.query().$promise.then(function(value) {
                        vm.answers = value.filter(function(obj) {
                            return obj.question.exam.id === vm.examResult.exam.id;
                        });
                    })
                }), function(err) {
                    console.log("Error: " + err);
                };
            }
        });

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            vm.examResult.questions = vm.questions;
            console.log(vm.examResult.answers + "!!!!!!!!!!!!");
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

        function filterAnswers(answers, question) {
            var ans = [];
            if(answers !== undefined) {
                for(var i = 0; i < answers.length; i++) {
                    if(answers[i].question.id === question.id) {
                        ans.push(answers[i]);
                    }
                }
            }
            return ans;
        }

        function checkboxFix() {
            console.log("!!!!!HERE");
            $("input:checkbox").on('click', function() {
                // in the handler, 'this' refers to the box clicked on
                var $box = $(this);
                if ($box.is(":checked")) {
                    // the name of the box is retrieved using the .attr() method
                    // as it is assumed and expected to be immutable
                    var group = "input:checkbox[name='" + $box.attr("name") + "']";
                    // the checked state of the group/box on the other hand will change
                    // and the current value is retrieved using .prop() method
                    $(group).prop("checked", false);
                    $box.prop("checked", true);
                } else {
                    $box.prop("checked", false);
                }
            });
        }

    }
})();
