//
//  WebViewCoordinator.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Util
import WebViewKit

public final class WebViewCoordinator: BaseCoordinator & WebViewCoordinatorProtocol {
    
    // MARK: - Properties
    
    public var webViewViewModel: WebViewViewModelProtocol
    public let scene: WebViewControllable
    
    // MARK: - Init
    
    public init(webViewViewModel: WebViewViewModelProtocol) {
        self.webViewViewModel = webViewViewModel
        self.scene = WebViewController(webViewViewModel: webViewViewModel)
        
        super.init()
        
        bind()
    }
    
    // MARK: - Life Cycle
    
    public override func start() {
        navigationController.isNavigationBarHidden = false
    }
    
    // MARK: - Bind
    
    private func bind() {
        webViewViewModel.didTapBackButton
            .subscribe(onNext: { [weak self] _ in
                guard let self else { return } 
                self.didTapBackButton()
            })
            .disposed(by: disposeBag)
    }
    
    private func didTapBackButton() {
        scene.uiviewController.navigationController?.popViewController(animated: true)
        parentCoordinator?.didFinish(coordinator: self)
        didFinish(coordinator: self)
    }
}
