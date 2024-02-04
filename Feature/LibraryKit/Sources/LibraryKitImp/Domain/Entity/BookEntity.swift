//
//  BookEntity.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

import LibraryKit

struct BookEntityResponse: BookEntityResponseProtocol {
    let totalCount: Int
    let books: [BookEntityProtocol]
    
    init(totalCount: Int, books: [BookEntity]) {
        self.totalCount = totalCount
        self.books = books
    }
}

struct BookEntity: Identifiable, BookEntityProtocol {
    let id: String
    let title: String
    let author: String
    var thumbnailURL: String?
    
    init(id: String, title: String, author: String, thumbnailURL: String?) {
        self.id = id
        self.title = title
        self.author = author
        self.thumbnailURL = thumbnailURL
    }
}
