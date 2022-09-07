//
//  SIPTVApp.swift
//  SIPTV
//
//  Created by Dev on 24/08/2022.
//

import SwiftUI


@main
struct SIPTVApp: App {
    @StateObject var xtreamManager = XtreamManager.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            switch  appState.navigationSection {
                case .mainView:
                    MainView()
                        .environmentObject(xtreamManager.currentSession)
                        .environmentObject(appState)
                        
                case .profilsView:
                ProfilsView(navigationSection: $appState.navigationSection, xtreamManager: xtreamManager)
                }
        }
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

class AppState : ObservableObject{
    @Published var navigationSection : NavigationSection = .profilsView
    
    enum NavigationSection{
        case mainView
        case profilsView
    }
}

