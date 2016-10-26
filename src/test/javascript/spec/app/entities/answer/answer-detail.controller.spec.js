'use strict';

describe('Controller Tests', function() {

    describe('Answer Management Detail Controller', function() {
        var $scope, $rootScope;
        var MockEntity, MockPreviousState, MockAnswer, MockExamResult, MockQuestion;
        var createController;

        beforeEach(inject(function($injector) {
            $rootScope = $injector.get('$rootScope');
            $scope = $rootScope.$new();
            MockEntity = jasmine.createSpy('MockEntity');
            MockPreviousState = jasmine.createSpy('MockPreviousState');
            MockAnswer = jasmine.createSpy('MockAnswer');
            MockExamResult = jasmine.createSpy('MockExamResult');
            MockQuestion = jasmine.createSpy('MockQuestion');
            

            var locals = {
                '$scope': $scope,
                '$rootScope': $rootScope,
                'entity': MockEntity,
                'previousState': MockPreviousState,
                'Answer': MockAnswer,
                'ExamResult': MockExamResult,
                'Question': MockQuestion
            };
            createController = function() {
                $injector.get('$controller')("AnswerDetailController", locals);
            };
        }));


        describe('Root Scope Listening', function() {
            it('Unregisters root scope listener upon scope destruction', function() {
                var eventType = 'testResultNotifierApp:answerUpdate';

                createController();
                expect($rootScope.$$listenerCount[eventType]).toEqual(1);

                $scope.$destroy();
                expect($rootScope.$$listenerCount[eventType]).toBeUndefined();
            });
        });
    });

});
