//
//  EmptyView.swift
//
//
//  Created by 최승명 on 2023/10/15.
//

import UIKit

import DesignSystem

final class EmptyView: UIView {
    
    // MARK: - UI View
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "썸네일 URL이 없습니다."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
