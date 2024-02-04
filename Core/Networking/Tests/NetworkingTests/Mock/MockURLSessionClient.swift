//
//  MockURLSessionClient.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Foundation

import Networking
import RxSwift

public struct MockURLSessionClient: HTTPClient {
    public init() {}
    
    public func perform<T: Decodable>(_ request: URLRequest) -> Observable<NetworkingResponse<T>> {
        let mockBookResponse: MockBookResponse = .init(
            isFuzzy: false,
            totalCount: 100,
            offset: 0,
            max: 100,
            list: [
                .init(id: 1, thumbnailURL: "test1", titleStatement: "test1", author: "A", publication: "publication1", etcContent: "none"),
                .init(id: 2, thumbnailURL: "test2", titleStatement: "test2", author: "B", publication: "publication2", etcContent: "none"),
                .init(id: 3, thumbnailURL: "test3", titleStatement: "test3", author: "C", publication: "publication3", etcContent: "none"),
                .init(id: 4, thumbnailURL: "test4", titleStatement: "test4", author: "D", publication: "publication4", etcContent: "none"),
                .init(id: 5, thumbnailURL: "test5", titleStatement: "test5", author: "E", publication: "publication5", etcContent: "none"),
            ]
        )
        let response = NetworkingResponse(value: mockBookResponse as! T)
        return Observable.just(response)
    }
}
