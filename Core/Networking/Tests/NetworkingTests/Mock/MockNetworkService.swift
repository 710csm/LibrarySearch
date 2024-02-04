//
//  MockNetworkService.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Networking
import RxSwift

public protocol MockNetworkServicing {
    func fetch() -> Observable<MockBookResponse>
}

public struct MockNetworkService: MockNetworkServicing {
    private let client: HTTPClient

    public init(client: HTTPClient) {
        self.client = client
    }

    public func fetch() -> Observable<MockBookResponse> {
        let request = MockRequest()

        return client.perform(request.buildURLRequest())
            .map(\.value)
    }
}
