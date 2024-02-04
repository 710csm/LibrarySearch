//
//  BaseCoordinator.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import UIKit

import RxSwift

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
}

open class BaseCoordinator: Coordinator {
    public let disposeBag: DisposeBag = DisposeBag()
    public var navigationController = UINavigationController()
    public var childCoordinators = [Coordinator]()
    public var parentCoordinator: Coordinator?
    
    public init() { }
    
    open func start() {
        fatalError("Start method should be implemented.")
    }
    
    open func start(coordinator: Coordinator) {
        childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    open func didFinish(coordinator: Coordinator) {
        removeChildCoordinators()
    }
    
    open func removeChildCoordinators() {
        childCoordinators.forEach { $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
}
