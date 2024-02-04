//
//  Container+UseCase.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import LibraryKit
import LibraryKitImp
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerUseCases() {
        autoregister(FetchLibraryUseCaseProtocol.self, initializer: FetchLibraryUseCase.init)
    }
}
