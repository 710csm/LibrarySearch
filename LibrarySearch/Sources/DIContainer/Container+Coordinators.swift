//
//  Container+Coordinators.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import LaunchKit
import LaunchKitImp
import LibraryKit
import LibraryKitImp
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        autoregister(LaunchCoordinatorProtocol.self, initializer: LaunchCoordinator.init)
        autoregister(LibraryCoordinatorProtocol.self, initializer: LibraryCoordinator.init)
    }
}
