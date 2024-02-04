//
//  URLSessionClient.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

import Networking
import RxSwift
import RxCocoa

public struct URLSessionClient: HTTPClient {
    public init() {}
    
    /// URLRequest를 받아 API 통신 후 제네릭 타입의 Observable response를 리턴
    public func perform<T: Decodable>(_ request: URLRequest) -> Observable<NetworkingResponse<T>> {
        return URLSession.shared.rx.data(request: request)
            .retry(3)
            .observe(on: MainScheduler.asyncInstance)
            .map { result -> NetworkingResponse<T> in
                let item: T = try JSONDecoder().decode(T.self, from: result)
                return NetworkingResponse(value: item)
            }
            .asObservable()
    }
}
