(function() {
    'use strict';

    angular
        .module('testResultNotifierApp')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider
        .state('exam-result', {
            parent: 'entity',
            url: '/exam-result',
            data: {
                authorities: ['ROLE_USER'],
                pageTitle: 'ExamResults'
            },
            views: {
                'content@': {
                    templateUrl: 'app/entities/exam-result/exam-results.html',
                    controller: 'ExamResultController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
            }
        })
        .state('exam-result-detail', {
            parent: 'entity',
            url: '/exam-result/{id}',
            data: {
                authorities: ['ROLE_USER'],
                pageTitle: 'ExamResult'
            },
            views: {
                'content@': {
                    templateUrl: 'app/entities/exam-result/exam-result-detail.html',
                    controller: 'ExamResultDetailController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                entity: ['$stateParams', 'ExamResult', function($stateParams, ExamResult) {
                    return ExamResult.get({id : $stateParams.id}).$promise;
                }],
                previousState: ["$state", function ($state) {
                    var currentStateData = {
                        name: $state.current.name || 'exam-result',
                        params: $state.params,
                        url: $state.href($state.current.name, $state.params)
                    };
                    return currentStateData;
                }]
            }
        })
        .state('exam-result-detail.edit', {
            parent: 'exam-result-detail',
            url: '/detail/edit',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam-result/exam-result-dialog.html',
                    controller: 'ExamResultDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: ['ExamResult', function(ExamResult) {
                            return ExamResult.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('^', {}, { reload: false });
                }, function() {
                    $state.go('^');
                });
            }]
        })
        .state('exam-result.new', {
            parent: 'exam-result',
            url: '/new',
            data: {
                authorities: ['ROLE_ADMIN', 'ROLE_TEACHER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam-result/exam-result-dialog.html',
                    controller: 'ExamResultDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: function () {
                            return {
                                id: null
                            };
                        }
                    }
                }).result.then(function() {
                    $state.go('exam-result', null, { reload: 'exam-result' });
                }, function() {
                    $state.go('exam-result');
                });
            }]
        })
        .state('exam-result.edit', {
            parent: 'exam-result',
            url: '/{id}/edit',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam-result/exam-result-dialog.html',
                    controller: 'ExamResultDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: ['ExamResult', function(ExamResult) {
                            return ExamResult.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('exam-result', null, { reload: 'exam-result' });
                }, function() {
                    $state.go('^');
                });
            }]
        })
        .state('exam-result.delete', {
            parent: 'exam-result',
            url: '/{id}/delete',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/exam-result/exam-result-delete-dialog.html',
                    controller: 'ExamResultDeleteController',
                    controllerAs: 'vm',
                    size: 'md',
                    resolve: {
                        entity: ['ExamResult', function(ExamResult) {
                            return ExamResult.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('exam-result', null, { reload: 'exam-result' });
                }, function() {
                    $state.go('^');
                });
            }]
        });
    }

})();
