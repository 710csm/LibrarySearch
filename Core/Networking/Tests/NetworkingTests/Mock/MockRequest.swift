//
//  MockRequest.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Networking

struct MockRequest: NetworkingRequest {
    var path: String { "" }
    var headers: [String: String] = [:]
    var body: [String : String] = [:]
}
