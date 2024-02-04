//
//  Book.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

// MARK: - LibraryResponse

public struct LibraryResponse: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: BookResponse
}

// MARK: - BookResponse

struct BookResponse: Codable {
    let isFuzzy: Bool?
    let totalCount: Int?
    let offset: Int?
    let max: Int?
    let list: [BookDTO]?
}

// MARK: - BookDTO

struct BookDTO: Codable {
    let id: Int?
    let thumbnailURL: String?
    let titleStatement: String?
    let author: String?
    let publication: String?
    let etcContent: String?
    let branchVolumes: [BranchVolume]?
    let similars: [Similar]?

    enum CodingKeys: String, CodingKey {
        case id
        case thumbnailURL = "thumbnailUrl"
        case titleStatement
        case author
        case publication
        case etcContent
        case branchVolumes
        case similars
    }
}

// MARK: - BranchVolume

struct BranchVolume: Codable {
    let id: Int?
    let name: String?
    let isCR: Bool?
    let volume: String?
    let cState: String?
    let isSubscribed: Bool?
    let hasItem: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isCR
        case volume
        case cState
        case isSubscribed
        case hasItem
    }
}

// MARK: - Similar

struct Similar: Codable {
    let id: Int?
    let titleStatement: String?
    let publication: String?
}
