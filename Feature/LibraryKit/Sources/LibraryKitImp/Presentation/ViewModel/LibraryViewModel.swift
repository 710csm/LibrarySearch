//
//  LibraryViewModel.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import Foundation

import LibraryKit
import RxSwift
import RxCocoa
import Util

public final class LibraryViewModel: LibraryViewModelProtocol {

    // MARK: - Input
    
    public let disposeBag: DisposeBag = DisposeBag()
    public let useCase: FetchLibraryUseCaseProtocol
    public let pagingManager: PagingManagerProtocol
    public let willDisplayCellEvent = PublishSubject<ControlEvent<WillDisplayCellEvent>.Element>()
    public let didTapTableViewCell = BookCellSelectedItem()
    
    // MARK: - Output
    
    public let bookList = BehaviorRelay<[BookEntityProtocol]>(value: [])
    public let isLoading = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Private

    private var books: [BookEntityProtocol] = [] {
        didSet {
            bookList.accept(books)
        }
    }
    
    // MARK: - Init
    
    public init(useCase: FetchLibraryUseCaseProtocol, pagingManager: PagingManagerProtocol) {
        self.useCase = useCase
        self.pagingManager = pagingManager
        
        bind()
    }
    
    // MARK: - Action
    
    public func startLoading() {
        isLoading.accept(true)
    }
    
    public func endLoading() {
        isLoading.accept(false)
    }
    
    public func fetchLibrary() {
        startLoading()
        
        useCase
            .execute(offset: "0")
            .subscribe(onNext: { [weak self] bookEntityResponse in
                guard let self else { return }
                
                self.pagingManager.setItemCount(totalCount: bookEntityResponse.totalCount, start: 0)
                self.books.append(contentsOf: bookEntityResponse.books)
                self.endLoading()
            })
            .disposed(by: disposeBag)
    }
    
    public func pagination(indexPath: IndexPath) {
        guard books.count == indexPath.row + 1, pagingManager.hasMorePage else {
            return
        }
        
        startLoading()
        
        useCase
            .execute(offset: "\(pagingManager.offset)")
            .subscribe(onNext: { [weak self] bookEntityResponse in
                guard let self else { return }
                
                self.pagingManager.setItemCount(totalCount: bookEntityResponse.totalCount, start: self.pagingManager.offset)
                self.books.append(contentsOf: bookEntityResponse.books)
                self.endLoading()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Bind
    
    private func bind() {
        willDisplayCellEvent
            .subscribe(onNext: { [weak self] event in
                guard let self else { return }
                
                self.pagination(indexPath: event.indexPath)
            })
            .disposed(by: disposeBag)
    }
}
