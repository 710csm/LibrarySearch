//
//  Extension+UITableView.swift
//  ios-photowidget-assignment
//
//  Created by 최승명 on 2023/09/11.
//

import UIKit

public extension UITableView {
    func registerCell<T>(_ cellClass: T.Type) where T: UITableViewCell {
        self.register(cellClass.self, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    func dequeueCell<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> T? where T: UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T
    }
}

public extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
