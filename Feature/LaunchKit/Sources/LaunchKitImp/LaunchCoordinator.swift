//
//  LaunchCoordinator.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

import BaseKit
import LaunchKit
import RxSwift
import RxCocoa
import Util

public final class LaunchCoordinator: BaseCoordinator & LaunchCoordinatorProtocol {
    
    // MARK: - Properties
    
    public let launchViewModel: LaunchViewModelProtocol
    public let sessionService: SessionServiceProtocol
    public let scene: LaunchViewControllable

    // MARK: - Init
    
    public init(launchViewModel: LaunchViewModelProtocol, sessionService: SessionServiceProtocol) {
        self.launchViewModel = launchViewModel
        self.sessionService = sessionService
        self.scene = LaunchViewController(launchViewModel: launchViewModel)
        
        super.init()
        
        bind()
    }
    
    // MARK: - Life Cycle
    
    public override func start() {
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [scene.uiviewController]
    }
    
    // MARK: - Bind
    
    private func bind() {
        launchViewModel.viewDidAppear
            .delay(.seconds(2), scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                guard let self else { return }
                
                self.sessionService.moveToLibrary()
            })
            .disposed(by: disposeBag)
    }
}
