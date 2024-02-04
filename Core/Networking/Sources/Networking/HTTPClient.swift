//
//  HTTPClient.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//


import Foundation

import RxSwift

public protocol HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) -> Observable<NetworkingResponse<T>>
}
