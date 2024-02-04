//
//  LibraryViewModelProtocol.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import Foundation

import RxSwift
import RxCocoa
import Util

public protocol LibraryViewModelInput {
    typealias BookCellSelectedItem = PublishSubject<(ControlEvent<IndexPath>.Element, ControlEvent<BookEntityProtocol>.Element)>
    var disposeBag: DisposeBag { get }
    var useCase: FetchLibraryUseCaseProtocol { get }
    var pagingManager: PagingManagerProtocol { get }
    var willDisplayCellEvent: PublishSubject<ControlEvent<WillDisplayCellEvent>.Element> { get }
    var didTapTableViewCell: BookCellSelectedItem { get }
}

public protocol LibraryViewModelOutput {
    var bookList: BehaviorRelay<[BookEntityProtocol]> { get }
    var isLoading: BehaviorRelay<Bool> { get }
}

public protocol LibraryViewModelAction {
    func startLoading()
    func endLoading()
    func fetchLibrary()
    func pagination(indexPath: IndexPath)
}

public protocol LibraryViewModelProtocol: LibraryViewModelInput & LibraryViewModelOutput & LibraryViewModelAction { }
