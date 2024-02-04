//
//  LibraryRequest.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Networking

struct LibraryRequest: NetworkingRequest {
    var path: String { "/search" }
    var headers: [String: String] = [:]
    var body: [String : String] = [:]
}
