//
//  LibraryViewController.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import UIKit

import CoreKit
import LibraryKit
import RxSwift

public final class LibraryViewController: BaseViewController & LibraryViewControllable {
    
    // MARK: - UI View
    
    private lazy var bookTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.registerCell(BookCell.self)
        return tableView
    }()
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        return indicator
    }()
    
    // MARK: - Properties
    
    private let libraryViewModel: LibraryViewModelProtocol
    
    // MARK: - Init
    
    public init(libraryViewModel: LibraryViewModelProtocol) {
        self.libraryViewModel = libraryViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        setUI()
        
        libraryViewModel.fetchLibrary()
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        self.view.addSubview(bookTableView)
        bookTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.bottom.equalTo(self.view.snp.bottom)
        }
        
        self.view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints {
            $0.center.equalTo(self.view.snp.center)
        }
    }
    
    // MARK: - Bind
    
    private func bind() {
        // input
        bookTableView.rx.willDisplayCell
            .bind(to: libraryViewModel.willDisplayCellEvent)
            .disposed(by: disposeBag)
        
        Observable.zip(
            bookTableView.rx.itemSelected,
            bookTableView.rx.modelSelected(BookEntityProtocol.self)
        )
        .bind(to: libraryViewModel.didTapTableViewCell)
        .disposed(by: disposeBag)
        
        // output
        libraryViewModel.bookList
            .bind(to: bookTableView.rx.items(
                cellIdentifier: BookCell.reuseIdentifier,
                cellType: BookCell.self
            )) { (row, item, cell) in
                cell.configureCell(book: item)
            }
            .disposed(by: disposeBag)
        
        libraryViewModel.isLoading
            .bind(to: loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
            
    }
}
