//
//  WebViewViewModel.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import WebKit

import RxSwift
import RxCocoa
import WebViewKit

public final class WebViewViewModel: WebViewViewModelProtocol {
    
    // MARK: - Input

    public let disposeBag: DisposeBag = DisposeBag()
    public let didStartLoad = PublishSubject<Void>()
    public let didFinishLoad = PublishSubject<Void>()
    public let didTapBackButton = PublishSubject<ControlEvent<()>.Element>()
    public var thumbnailURL: String? {
        didSet {
            fetchUrlRequest(thumbnailURL: thumbnailURL)
        }
    }
    
    // MARK: - Output
    
    public let isLoading = BehaviorRelay<Bool>(value: false)
    public let isHidden = BehaviorRelay<Bool>(value: false)
    public var urlRequest: URLRequest?
    
    // MARK: - Init
    
    public init() {
        bind()
    }
    
    // MARK: - Action
    
    public func fetchUrlRequest(thumbnailURL: String?) {
        if let thumbnailURL, let url = URL(string: thumbnailURL) {
            isHidden.accept(true)
            urlRequest = URLRequest(url: url)
        } else {
            isHidden.accept(false)
            return
        }
    }
    
    // MARK: Bind
    
    private func bind() {
        didStartLoad
            .subscribe(onNext: { [weak self] _ in
                guard let self else { return }
                self.isLoading.accept(true)
            })
            .disposed(by: disposeBag)
        
        didFinishLoad
            .subscribe(onNext: { [weak self] _ in
                guard let self else { return }
                self.isLoading.accept(false)
            })
            .disposed(by: disposeBag)
    }
}
