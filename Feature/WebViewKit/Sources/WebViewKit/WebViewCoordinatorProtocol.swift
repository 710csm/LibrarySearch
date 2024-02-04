//
//  WebViewCoordinatorProtocol.swift
//  
//
//  Created by 최승명 on 2023/10/13.
//

import Util

public protocol WebViewCoordinatorProtocol: Coordinator {
    var webViewViewModel: WebViewViewModelProtocol { get set }
    var scene: WebViewControllable { get }
}
