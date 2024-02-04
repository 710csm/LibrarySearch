//
//  ViewControllable.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import UIKit

public protocol ViewControllable: AnyObject {
    var uiviewController: UIViewController { get }
}

public extension ViewControllable where Self: UIViewController {
    var uiviewController: UIViewController {
        return self
    }
}
