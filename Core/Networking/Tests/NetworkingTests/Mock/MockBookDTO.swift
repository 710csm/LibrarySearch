//
//  MockBookDTO.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Foundation

// MARK: - MockBookResponse

public struct MockBookResponse: Codable {
    let isFuzzy: Bool?
    let totalCount: Int?
    let offset: Int?
    let max: Int?
    let list: [MockBookDTO]?
}

// MARK: - MockBookDTO

public struct MockBookDTO: Codable {
    let id: Int?
    let thumbnailURL: String?
    let titleStatement: String?
    let author: String?
    let publication: String?
    let etcContent: String?

    enum CodingKeys: String, CodingKey {
        case id
        case thumbnailURL = "thumbnailUrl"
        case titleStatement
        case author
        case publication
        case etcContent
    }
}
