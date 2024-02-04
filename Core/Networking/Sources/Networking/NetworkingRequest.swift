//
//  NetworkingRequest.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public protocol NetworkingRequest {
    /// HTTP Method
    var method: HTTPMethod { get }
    /// API 주소
    var path: String { get }
    /// 헤더 값
    var headers: [String: String] { get }
    /// 파라미터
    var body: [String: String] { get set }
    
    func buildURLRequest() -> URLRequest
}

public extension NetworkingRequest {
    var method: HTTPMethod { .GET }
    
    /// 파라미터를 받아 URLRequest를 생성
    func buildURLRequest() -> URLRequest {
        let baseURL = URL(string: "https://library.me.go.kr/pyxis-api/2/collections/2")!
        let pathURL = baseURL.appendingPathComponent(path)
        
        // URLComponents를 통해 전달받은 파라미터를 설정
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = body.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        guard let url = urlComponents?.url else {
            fatalError("invalid url error")
        }
        
        // URLComponents로 설정한 URL로 URLRequest를 생성
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}
