//
//  ImageLoader.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/12.
//

import UIKit

import Util

public final class ImageLoader {
    public static let shared = ImageLoader()
    private init() {}
    
    func downloadImageData(from url: URL) async throws -> UIImage? {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return UIImage(data: data)
    }
}

public final actor ImageDownloader {
    public static let shared = ImageDownloader()
    private init() { }
    
    private var cache: [URL: UIImage] = [:]
    
    public func image(from urlPath: String) async throws -> UIImage? {
        guard let url = URL(string: urlPath) else {
            
            return nil
        }
        
        // 캐시된 이미지가 있으면 리턴
        if let cached = cache[url] {
            return cached
        }
        
        // 이미지를 비동기로 url로 부터 다운로드
        let image = try await downloadImage(from: url)
        
        // thumbnail 이미지를 캐싱해주도록 변경.
        // 이전에는 캐싱된 이미지는 그대로. 캐싱되지 않은 이미지는 thumbnail 로 변경해서 반환.(캐싱되지 않은 경우만 thumbnail 로 변경)
        guard let thumbnailImage = await image?.thumbnail else {
            return nil
        }
        
        cache[url] = cache[url, default: thumbnailImage]
        
        return cache[url]!
    }
    
    private func downloadImage(from url: URL) async throws -> UIImage? {
        let imageLoader = ImageLoader.shared
        return try await imageLoader.downloadImageData(from: url)
    }
}
