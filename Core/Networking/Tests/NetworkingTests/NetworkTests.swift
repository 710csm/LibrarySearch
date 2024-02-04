//
//  NetworkTests.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import XCTest

import RxBlocking

@testable import Networking

final class NetworkTests: XCTestCase {
    
    private var sut: MockNetworkServicing!
    
    override func setUpWithError() throws {
        sut = MockNetworkService(client: MockURLSessionClient())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWithMockURLSessionClient() throws {
        do {
            let result = try sut.fetch().toBlocking().first()
            
            guard let books = result?.list else {
                XCTFail("MockNetworkService에서 데이터를 불러오는데 실패하였습니다!")
                return
            }
            XCTAssertEqual(books.isEmpty, false)
        } catch {
            XCTFail("MockNetworkService에서 데이터를 불러오는데 실패하였습니다!")
        }
        
    }
}
