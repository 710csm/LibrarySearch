//
//  Container+RegisterDependencies.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Swinject

extension Container {
    func registerDependencies() {
        registerCoordinators()
        registerRepositorys()
        registerViewModels()
        registerServices()
        registerUseCases()
    }
}
