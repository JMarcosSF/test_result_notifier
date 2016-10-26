(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider
        .state('exam', {
            parent: 'entity',
            url: '/exam',
            data: {
                authorities: ['ROLE_USER'],
                pageTitle: 'Exams'
            },
            views: {
                'content@': {
                    templateUrl: 'app/entities/exam/exams.html',
                    controller: 'ExamController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
            }
        })
        .state('exam-detail', {
            parent: 'entity',
            url: '/exam/{id}',
            data: {
                authorities: ['ROLE_USER'],
                pageTitle: 'Exam'
            },
            views: {
                'content@': {
                    templateUrl: 'app/entities/exam/exam-detail.html',
                    controller: 'ExamDetailController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                entity: ['$stateParams', 'Exam', function($stateParams, Exam) {
                    return Exam.get({id : $stateParams.id}).$promise;
                }],
                previousState: ["$state", function ($state) {
                    var currentStateData = {
                        name: $state.current.name || 'exam',
                        params: $state.params,
                        url: $state.href($state.current.name, $state.params)
                    };
                    return currentStateData;
                }]
            }
        })
        .state('exam-detail.edit', {
            parent: 'exam-detail',
            url: '/detail/edit',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam/exam-dialog.html',
                    controller: 'ExamDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: ['Exam', function(Exam) {
                            return Exam.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('^', {}, { reload: false });
                }, function() {
                    $state.go('^');
                });
            }]
        })
        .state('exam.new', {
            parent: 'exam',
            url: '/new',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam/exam-dialog.html',
                    controller: 'ExamDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: function () {
                            return {
                                name: null,
                                id: null
                            };
                        }
                    }
                }).result.then(function() {
                    $state.go('exam', null, { reload: 'exam' });
                }, function() {
                    $state.go('exam');
                });
            }]
        })
        .state('exam.edit', {
            parent: 'exam',
            url: '/{id}/edit',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam/exam-dialog.html',
                    controller: 'ExamDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: ['Exam', function(Exam) {
                            return Exam.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('exam', null, { reload: 'exam' });
                }, function() {
                    $state.go('^');
                });
            }]
        })
        .state('exam.delete', {
            parent: 'exam',
            url: '/{id}/delete',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam/exam-delete-dialog.html',
                    controller: 'ExamDeleteController',
                    controllerAs: 'vm',
                    size: 'md',
                    resolve: {
                        entity: ['Exam', function(Exam) {
                            return Exam.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('exam', null, { reload: 'exam' });
                }, function() {
                    $state.go('^');
                });
            }]
        });
    }

})();
