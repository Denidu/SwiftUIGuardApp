//
//  SwiftUIGuardAppApp.swift
//  SwiftUIGuardApp
//
//  Created by Denidu Gamage on 2025-05-21.
//

import SwiftUI

@main
struct SwiftUIGuardApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var faceLockVM = FaceLockViewModel()

    var body: some Scene {
        WindowGroup {
            if appState.isUnlocked {
                HomeView()
            } else {
                TabView {
                    LockScreenView()
                        .tabItem {
                            Label("FaceID", systemImage: "faceid")
                        }

                    FaceMatchView(viewModel: faceLockVM)
                        .tabItem {
                            Label("Live Face", systemImage: "camera.viewfinder")
                        }
                }
                .environmentObject(appState)
            }
        }
    }
}

