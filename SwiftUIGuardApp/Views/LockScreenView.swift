//
//  LockScreenView.swift
//  SwiftUIGuardApp
//
//  Created by Denidu Gamage on 2025-05-21.
//

import SwiftUI

struct LockScreenView: View {
    @EnvironmentObject var appState: AppState
    @State private var authService = BiometricAuthService()


    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "lock.shield")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Text("App Locked")
                .font(.title2)

            Button("Unlock with FaceID") {
                authService.authenticateWithBiometrics { success in
                    if success {
                        appState.isUnlocked = true
                    }
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}


#Preview {
    LockScreenView()
}
