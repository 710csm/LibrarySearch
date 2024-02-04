//
//  Container+Services.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import LibraryKit
import LibraryKitImp
import Networking
import NetworkingImp
import Swinject
import SwinjectAutoregistration
import Util

extension Container {
    func registerServices() {
        autoregister(SessionServiceProtocol.self, initializer: SessionService.init).inObjectScope(.container)
        autoregister(HTTPClient.self, initializer: URLSessionClient.init)
        autoregister(LibraryNetworkServiceProtocol.self, initializer: LibraryNetworkService.init)
        autoregister(PagingManagerProtocol.self, initializer: PagingManager.init)
    }
}
