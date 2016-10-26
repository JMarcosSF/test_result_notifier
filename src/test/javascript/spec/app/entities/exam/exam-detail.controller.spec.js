'use strict';

describe('Controller Tests', function() {

    describe('Exam Management Detail Controller', function() {
        var $scope, $rootScope;
        var MockEntity, MockPreviousState, MockExam, MockQuestion, MockCourse, MockExamResult;
        var createController;

        beforeEach(inject(function($injector) {
            $rootScope = $injector.get('$rootScope');
            $scope = $rootScope.$new();
            MockEntity = jasmine.createSpy('MockEntity');
            MockPreviousState = jasmine.createSpy('MockPreviousState');
            MockExam = jasmine.createSpy('MockExam');
            MockQuestion = jasmine.createSpy('MockQuestion');
            MockCourse = jasmine.createSpy('MockCourse');
            MockExamResult = jasmine.createSpy('MockExamResult');
            

            var locals = {
                '$scope': $scope,
                '$rootScope': $rootScope,
                'entity': MockEntity,
                'previousState': MockPreviousState,
                'Exam': MockExam,
                'Question': MockQuestion,
                'Course': MockCourse,
                'ExamResult': MockExamResult
            };
            createController = function() {
                $injector.get('$controller')("ExamDetailController", locals);
            };
        }));


        describe('Root Scope Listening', function() {
            it('Unregisters root scope listener upon scope destruction', function() {
                var eventType = 'testResultNotifierApp:examUpdate';

                createController();
                expect($rootScope.$$listenerCount[eventType]).toEqual(1);

                $scope.$destroy();
                expect($rootScope.$$listenerCount[eventType]).toBeUndefined();
            });
        });
    });

});
