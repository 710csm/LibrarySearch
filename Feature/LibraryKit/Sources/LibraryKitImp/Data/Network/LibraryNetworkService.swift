//
//  LibraryNetworkService.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

import Networking
import RxSwift

public protocol LibraryNetworkServiceProtocol {
    func fetchLibrary(offset: String) -> Observable<LibraryResponse>
}

public final class LibraryNetworkService: LibraryNetworkServiceProtocol {
    
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    public func fetchLibrary(offset: String) -> Observable<LibraryResponse> {
        var request = LibraryRequest()
        request.body = [
            "all": "k|a|library",
            "offset": offset
        ]
        
        return client.perform(request.buildURLRequest())
            .map(\.value)
    }
}
