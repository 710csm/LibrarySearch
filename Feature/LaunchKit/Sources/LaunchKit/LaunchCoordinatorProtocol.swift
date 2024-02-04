//
//  LaunchCoordinatorProtocol.swift
//  
//
//  Created by 최승명 on 2023/10/13.
//

import CoreKit

public protocol LaunchCoordinatorProtocol: Coordinator {
    var launchViewModel: LaunchViewModelProtocol { get }
    var sessionService: SessionServiceProtocol { get }
    var scene: LaunchViewControllable { get }
}
