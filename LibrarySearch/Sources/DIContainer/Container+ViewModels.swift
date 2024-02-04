//
//  Container+ViewModels.swift
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
    func registerViewModels() {
        autoregister(LaunchViewModelProtocol.self, initializer: LaunchViewModel.init)
        autoregister(LibraryViewModelProtocol.self, initializer: LibraryViewModel.init)
    }
}
