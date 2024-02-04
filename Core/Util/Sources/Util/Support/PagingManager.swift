//
//  PagingManager.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

public protocol PagingManagerProtocol {
    var hasMorePage: Bool { get set }
    var totalCount: Int { get set }
    var offset: Int { get set }
    var start: Int { get set }
    
    func setItemCount(totalCount: Int, start: Int)
    func resetPage()
}

public final class PagingManager: PagingManagerProtocol {
    /// 한번에 불러오는 아이템의 수
    private final let ITEM_PER_PAGE = 20
    /// 페이지를 더 가지고 있는지 여부
    public var hasMorePage: Bool = true
    /// 모든 아이템 수
    public var totalCount: Int = 0
    /// 시작 인덱스
    public var offset: Int = 0
    /// 현재 요청에서 불러온 아이템들의 시작 인덱스
    public var start: Int = 0 {
        didSet {
            hasMorePage = start + ITEM_PER_PAGE > totalCount ? false : true
            
            if hasMorePage {
                offset += ITEM_PER_PAGE
            }
        }
    }
    
    public init() { }
    
    /// 시작 인덱스, 아이템의 총 개수를 초기화를 설정
    /// - parameter numFound: 아이템의 총 개수
    /// - parameter start: 시작 인덱스
    public func setItemCount(totalCount: Int, start: Int) {
        self.totalCount = totalCount
        self.start = start
    }
    
    /// 아이템의 총 개수, 시작 페이지, 시작 인덱스를 초기화
    public func resetPage() {
        totalCount = 0
        offset = 0
        start = 0
    }
}
