//
//  BaseViewController.swift
//
//
//  Created by 최승명 on 2023/10/15.
//

import UIKit

import RxSwift

open class BaseViewController: UIViewController {
    
    // MARK: - UI View
    
    public lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: navigationController,
            action: #selector(UINavigationController.popViewController(animated:))
        )
        return button
    }()
    
    // MARK: - Properties
    
    public let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
    }
    
    // MARK: - Set UI
    
    open func setBackgroundColor() {
        self.view.backgroundColor = .white
    }
    
    open func setNavigation() {
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
