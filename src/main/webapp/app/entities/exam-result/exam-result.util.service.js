(function() {
    'use strict';
    angular
        .module('testResultNotifierApp')
        .service('ExamResultUtil', function() {
        this.filterAnswers = filterAnswers;
        this.checkboxFix = checkboxFix;
        this.isCorrectAnswer = isCorrectAnswer;
        this.getExamScore = getExamScore;
    });

    function isCorrectAnswer(answer) {
        return answer.isCorrect;
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

    function getExamScore(answers, questions) {
        return answers.filter(isCorrectAnswer).length +'/' + questions.length;
    }

    function checkboxFix() {
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

})();
