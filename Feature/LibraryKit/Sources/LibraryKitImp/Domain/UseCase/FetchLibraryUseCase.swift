//
//  FetchLibraryUseCase.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import LibraryKit
import RxSwift

public final class FetchLibraryUseCase: FetchLibraryUseCaseProtocol {

    private let repository: LibraryRepositoryProtocol

    public init(repository: LibraryRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(offset: String) -> Observable<BookEntityResponseProtocol> {
        // 레파지토리에서 받아온 데이터를 view model로 전달
        return repository.fetchLibrary(offset: offset)
    }
}
