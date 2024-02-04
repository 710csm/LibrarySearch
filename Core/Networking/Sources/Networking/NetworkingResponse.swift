//
//  NetworkingResponse.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

public struct NetworkingResponse<T> {
    public let value: T
    
    public init(value: T) {
        self.value = value
    }
}
