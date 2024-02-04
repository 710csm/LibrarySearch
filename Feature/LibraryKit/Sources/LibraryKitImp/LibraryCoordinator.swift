//
//  LibraryCoordinator.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import BaseKit
import LibraryKit
import WebViewKit
import WebViewKitImp
import Util

public final class LibraryCoordinator: BaseCoordinator & LibraryCoordinatorProtocol {
    
    // MARK: - Properties
    
    public let libraryViewModel: LibraryViewModelProtocol
    public let scene: LibraryViewControllable
    
    // MARK: - Init
    
    public init(libraryViewModel: LibraryViewModelProtocol) {
        self.libraryViewModel = libraryViewModel
        self.scene = LibraryViewController(libraryViewModel: libraryViewModel)
        
        super.init()
        
        bind()
    }
    
    // MARK: - Life Cycle
    
    public override func start() {
        navigationController.isNavigationBarHidden = false
        navigationController.viewControllers = [scene.uiviewController]
    }
    
    // MARK: - Bind
    
    private func bind() {
        libraryViewModel.didTapTableViewCell
            .subscribe(onNext: { [weak self] indexPath, book in
                guard let self else { return }
                self.showWebView(thumbnailURL: book.thumbnailURL)
            })
            .disposed(by: disposeBag)
    }
    
    private func showWebView(thumbnailURL: String?) {
        let webViewViewModel: WebViewViewModelProtocol = WebViewViewModel()
        let coordinator: WebViewCoordinatorProtocol = WebViewCoordinator(webViewViewModel: webViewViewModel)
        coordinator.webViewViewModel.thumbnailURL = thumbnailURL
        start(coordinator: coordinator)
        
        navigationController.pushViewController(coordinator.scene.uiviewController, animated: true)
    }
}
