//
//  LaunchViewModel.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import LaunchKit
import RxSwift
import RxCocoa

public final class LaunchViewModel: LaunchViewModelProtocol {

    // MARK: - Input
    
    public let disposeBag: DisposeBag = DisposeBag()
    public let viewDidAppear = PublishSubject<ControlEvent<Bool>.Element>()
    
    // MARK: - Init
    
    public init() { }
}

protocol TempProtocol {
    var tempValue1: String { get }
    var tempValue2: String { get set }
}

public final class Temp: TempProtocol {
    
    let tempValue1: String = ""
    var tempValue2: String = ""

}
