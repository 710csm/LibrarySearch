//
//  WebViewController.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import UIKit
import WebKit

import BaseKit
import CoreKit
import RxSwift
import WebViewKit

public final class WebViewController: BaseViewController & WebViewControllable {
    
    // MARK: - UI View
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.allowsBackForwardNavigationGestures = true
        
        return webView
    }()
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        return indicator
    }()
    private lazy var emptyView: EmptyView = {
        let view = EmptyView(frame: .zero)
        return view
    }()
    
    // MARK: - Properties
    
    private let webViewViewModel: WebViewViewModelProtocol
    
    // MARK: - Init
    
    public init(webViewViewModel: WebViewViewModelProtocol) {
        self.webViewViewModel = webViewViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        setUI()
        setNavigation()
        setWebView()
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        self.view = webView
        
        self.view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints {
            $0.center.equalTo(self.view.snp.center)
        }
        
        self.view.addSubview(emptyView)
        emptyView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setWebView() {
        guard let request = webViewViewModel.urlRequest else { return }
        webView.load(request)
    }
    
    // MARK: - Bind
    
    private func bind() {
        // input
        webView.rx.didStartLoad
            .map { _ in }
            .bind(to: webViewViewModel.didStartLoad)
            .disposed(by: disposeBag)
        
        webView.rx.didFinishLoad
            .map { _ in }
            .bind(to: webViewViewModel.didFinishLoad)
            .disposed(by: disposeBag)
        
        backButton.rx.tap
            .bind(to: webViewViewModel.didTapBackButton)
            .disposed(by: disposeBag)
        
        // output
        webViewViewModel.isLoading
            .bind(to: loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        webViewViewModel.isHidden
            .bind(to: emptyView.rx.isHidden)
            .disposed(by: disposeBag)
    }
}
