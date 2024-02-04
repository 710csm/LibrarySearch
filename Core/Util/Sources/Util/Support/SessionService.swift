//
//  SessionService.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import RxSwift

public protocol SessionServiceProtocol {
    var library: Observable<Void> { get }
    
    func moveToLibrary()
}

public final class SessionService: SessionServiceProtocol {
    
    private let librarySubject = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    
    public var library: Observable<Void> {
        return librarySubject.asObservable()
    }
    
    public init() {}
    
    public func moveToLibrary() {
        librarySubject.onNext(Void())
    }
}
