//
//  TestUtil.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/14.
//

import Foundation

public final class TestUtil {
    public static func loadHJSON(for fileName: String, in bundleClass: AnyClass) -> Data? {
        guard let path = Bundle(for: bundleClass).path(forResource: fileName, ofType: "json")
        else {
            return nil
        }
        
        do {
            let url = URL(filePath: path)
            let data = try Data(contentsOf: url)
            return data
        } catch {
            return nil
        }
    }
    
    public static func loadHJSONPath(for fileName: String, in bundleClass: AnyClass) -> String {
        guard let path = Bundle(for: bundleClass).path(forResource: fileName, ofType: "json")
        else {
            return ""
        }
        
        return path
    }

}
