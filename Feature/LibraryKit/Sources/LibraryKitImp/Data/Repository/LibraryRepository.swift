//
//  LibraryRepository.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

import LibraryKit
import Networking
import RxSwift

public final class LibraryRepository: LibraryRepositoryProtocol {
    
    private let network: LibraryNetworkServiceProtocol
    
    public init(network: LibraryNetworkServiceProtocol) {
        self.network = network
    }
    
    public func fetchLibrary(offset: String) -> Observable<BookEntityResponseProtocol> {
        return network.fetchLibrary(offset: offset)
            .map({ libraryResponse in
                
                var bookEntities = [BookEntity]()
                
                // API 통신을 통해 받은 response를 BookEntity로 변환
                if let list = libraryResponse.data.list {
                    for bookDTO in list {
                        let book = BookEntity(
                            id: "\(bookDTO.id ?? 0)",
                            title: bookDTO.titleStatement ?? "",
                            author: bookDTO.author ?? "",
                            thumbnailURL: bookDTO.thumbnailURL
                        )
                        bookEntities.append(book)
                    }
                } else {
                    return BookEntityResponse(totalCount:  0, books: bookEntities)
                }
                
                return BookEntityResponse(totalCount: libraryResponse.data.totalCount ?? 0, books: bookEntities)
            })
    }
}
