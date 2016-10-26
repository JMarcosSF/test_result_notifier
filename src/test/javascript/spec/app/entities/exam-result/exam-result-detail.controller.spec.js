'use strict';

describe('Controller Tests', function() {

    describe('ExamResult Management Detail Controller', function() {
        var $scope, $rootScope;
        var MockEntity, MockPreviousState, MockExamResult, MockUser, MockQuestion, MockAnswer, MockCourse, MockExam;
        var createController;

        beforeEach(inject(function($injector) {
            $rootScope = $injector.get('$rootScope');
            $scope = $rootScope.$new();
            MockEntity = jasmine.createSpy('MockEntity');
            MockPreviousState = jasmine.createSpy('MockPreviousState');
            MockExamResult = jasmine.createSpy('MockExamResult');
            MockUser = jasmine.createSpy('MockUser');
            MockQuestion = jasmine.createSpy('MockQuestion');
            MockAnswer = jasmine.createSpy('MockAnswer');
            MockCourse = jasmine.createSpy('MockCourse');
            MockExam = jasmine.createSpy('MockExam');
            

            var locals = {
                '$scope': $scope,
                '$rootScope': $rootScope,
                'entity': MockEntity,
                'previousState': MockPreviousState,
                'ExamResult': MockExamResult,
                'User': MockUser,
                'Question': MockQuestion,
                'Answer': MockAnswer,
                'Course': MockCourse,
                'Exam': MockExam
            };
            createController = function() {
                $injector.get('$controller')("ExamResultDetailController", locals);
            };
        }));


        describe('Root Scope Listening', function() {
            it('Unregisters root scope listener upon scope destruction', function() {
                var eventType = 'testResultNotifierApp:examResultUpdate';

                createController();
                expect($rootScope.$$listenerCount[eventType]).toEqual(1);

                $scope.$destroy();
                expect($rootScope.$$listenerCount[eventType]).toBeUndefined();
            });
        });
    });

});
