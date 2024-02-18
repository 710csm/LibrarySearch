//
//  ImageLoaderWrapper.swift
//
//
//  Created by 최승명 on 2023/10/16.
//

import UIKit

import DesignSystem
import Util

public struct ImageLoaderWrapper<Base> {
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ImageLoaderCompatible {
    /// Extended type
    associatedtype ImageLoaderBase
    
    var imageLoader: ImageLoaderWrapper<ImageLoaderBase> { get set }
}

extension UIImageView: ImageLoaderCompatible {
    public var imageLoader: ImageLoaderWrapper<UIImageView> {
        get { ImageLoaderWrapper(self)  }
        set { }
    }
}

@MainActor
public extension ImageLoaderWrapper where Base: UIImageView {
     func setImage(thumbnailURL: String?) {
        guard let url = thumbnailURL else {
            self.base.image = UIImage(
                named: "image_default_book_cover",
                in: Bundle.feature,
                compatibleWith: nil
            )
            Log.error("invalid url error")
            return
        }
        
        Task {
            let image = try await ImageDownloader.shared.image(from: url)
            self.base.image = image
        }
    }
}
