//
//  BookCell.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.

import UIKit

import CoreKit
import ImageLoader
import LibraryKit

final class BookCell: UITableViewCell {
    
    // MARK: - UI View
    
    private lazy var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    private lazy var bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    private lazy var bookThumbnailViewContainer: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var bookThumbnailView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookThumbnailView.image = UIImage(named: "image_default_book_cover", in: Bundle.feature, compatibleWith: nil)
    }
 
    // MARK: - Set UI
    
    private func setUI() {
        self.selectionStyle = .none
        
        self.contentView.addSubview(bookThumbnailViewContainer)
        bookThumbnailViewContainer.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(100)
            $0.top.greaterThanOrEqualToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        bookThumbnailViewContainer.applyShadow()
        
        bookThumbnailViewContainer.addSubview(bookThumbnailView)
        bookThumbnailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        bookThumbnailView.clipsToBounds = true
        bookThumbnailView.layer.cornerRadius = 4
        
        self.contentView.addSubview(bookTitleLabel)
        bookTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(bookThumbnailViewContainer.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        self.contentView.addSubview(bookAuthorLabel)
        bookAuthorLabel.snp.makeConstraints {
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookThumbnailViewContainer.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func configureCell(book: BookEntityProtocol) {
        bookTitleLabel.text = book.title
        bookAuthorLabel.text = book.author
        bookThumbnailView.imageLoader.setImage(thumbnailURL: book.thumbnailURL)
    }
}
