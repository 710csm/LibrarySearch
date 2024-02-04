//
//  LibraryRepositoryProtocol.swift
//  
//
//  Created by 최승명 on 2023/10/13.
//

import RxSwift

public protocol LibraryRepositoryProtocol {
    func fetchLibrary(offset: String) -> Observable<BookEntityResponseProtocol>
}
