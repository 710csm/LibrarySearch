//
//  WebViewViewModelProtocol.swift
//  
//
//  Created by 최승명 on 2023/10/13.
//

import Foundation
import WebKit

import RxSwift
import RxCocoa

public protocol WebViewViewModelInput {
    var disposeBag: DisposeBag { get }
    var didStartLoad: PublishSubject<Void> { get }
    var didFinishLoad: PublishSubject<Void> { get }
    var didTapBackButton: PublishSubject<ControlEvent<()>.Element> { get }
    var thumbnailURL: String? { get set }
}

public protocol WebViewViewModelOutput {
    var isLoading: BehaviorRelay<Bool> { get }
    var isHidden: BehaviorRelay<Bool> { get }
    var urlRequest: URLRequest? { get }
}

public protocol WebViewViewModelAction {
    func fetchUrlRequest(thumbnailURL: String?)
}

public protocol WebViewViewModelProtocol: WebViewViewModelInput & WebViewViewModelOutput & WebViewViewModelAction {
}
