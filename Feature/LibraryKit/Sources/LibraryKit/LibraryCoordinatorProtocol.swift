//
//  LibraryCoordinatorProtocol.swift
//
//
//  Created by 최승명 on 2023/10/13.
//

import BaseKit
import Util

public protocol LibraryCoordinatorProtocol: Coordinator {
    var libraryViewModel: LibraryViewModelProtocol { get }
    var scene: LibraryViewControllable { get }
}
