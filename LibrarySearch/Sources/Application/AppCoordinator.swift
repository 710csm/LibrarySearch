//
//  AppCoordinator.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import UIKit

import BaseKit
import LaunchKit
import LibraryKit
import RxSwift
import Util

final class AppCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow
    private let sessionService: SessionServiceProtocol
    
    // MARK: - Init
    
    init(window: UIWindow, sessionService: SessionServiceProtocol) {
        self.window = window
        self.sessionService = sessionService
        
        super.init()
        
        bind()
    }
    
    // MARK: - Life Cycle
    
    override func start() {
        showLaunch()
    }
    
    // MARK: - Bind
    
    private func bind() {
        sessionService.library
            .subscribe(onNext: { [weak self] _ in
                guard let self else { return }
                self.showLibrary()
            })
            .disposed(by: disposeBag)
    }
    
    private func showLaunch() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(LaunchCoordinatorProtocol.self)!
        start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true
        )
    }
    
    private func showLibrary() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(LibraryCoordinatorProtocol.self)!
        start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true
        )
    }
}
