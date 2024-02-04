//
//  LaunchViewController.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import UIKit

import BaseKit
import CoreKit
import LaunchKit
import RxSwift
import RxCocoa

public final class LaunchViewController: BaseViewController & LaunchViewControllable {
    
    // MARK: - UI View
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Digital Library App"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Properties
    
    private let launchViewModel: LaunchViewModelProtocol
    
    // MARK: - Init
    
    public init(launchViewModel: LaunchViewModelProtocol) {
        self.launchViewModel = launchViewModel
        
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
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    
    private func bind() {
        self.rx.viewDidAppear
            .bind(to: launchViewModel.viewDidAppear)
            .disposed(by: disposeBag)
    }
}
