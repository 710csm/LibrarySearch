//
//  BookEntityProtocol.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Foundation

public protocol BookEntityResponseProtocol {
    var totalCount: Int { get }
    var books: [BookEntityProtocol] { get }
}

public protocol BookEntityProtocol {
    var id: String { get }
    var title: String { get }
    var author: String { get }
    var thumbnailURL: String? { get set }
}
