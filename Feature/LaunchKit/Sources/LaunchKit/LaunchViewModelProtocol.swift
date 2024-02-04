//
//  LaunchViewModelProtocol.swift
//  
//
//  Created by 최승명 on 2023/10/13.
//

import RxSwift
import RxCocoa

public protocol LaunchViewModelInput {
    var disposeBag: DisposeBag { get }
    var viewDidAppear: PublishSubject<ControlEvent<Bool>.Element> { get }
}

public protocol LaunchViewModelOutput {
}

public protocol LaunchViewModelAction {
}

public protocol LaunchViewModelProtocol: LaunchViewModelInput & LaunchViewModelInput & LaunchViewModelAction { }
