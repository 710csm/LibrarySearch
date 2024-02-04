//
//  Extension+UIImage.swift
//  
//
//  Created by 최승명 on 2023/10/15.
//

import UIKit

public extension UIImage {
    var thumbnail: UIImage? {
        get async {
            let size = CGSize(width: 80, height: 100)
            return await self.byPreparingThumbnail(ofSize: size)
        }
    }
}
