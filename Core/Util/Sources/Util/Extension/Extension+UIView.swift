//
//  Extension+UIView.swift
//  ios-photowidget-assignment
//
//  Created by 최승명 on 2023/09/11.
//

import UIKit

extension UIView {
    public func applyShadow(
        shadowColor: UIColor = .gray,
        shadowOpacity: Float = 0.4,
        shadowRadius: CGFloat = 6,
        shadowOffset: CGSize = CGSize(width: 0, height: 0)
    ) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
    }
}
