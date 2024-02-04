//
//  AppDelegate.swift
//  LibrarySearch
//
//  Created by 최승명 on 2023/10/11.
//

import UIKit

import Swinject
import Util

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    
    static let container = Container()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        AppDelegate.container.registerDependencies()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        appCoordinator = AppCoordinator(
            window: window!,
            sessionService: AppDelegate.container.resolve(SessionServiceProtocol.self)!
        )
        appCoordinator.start()
        
        return true
    }
}
