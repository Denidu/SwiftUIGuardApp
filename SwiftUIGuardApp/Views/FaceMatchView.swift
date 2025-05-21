//
//  FaceMatchView.swift
//  SwiftUIGuardApp
//
//  Created by Denidu Gamage on 2025-05-21.
//

import SwiftUI
import AVFoundation

struct FaceMatchView: View {
    @ObservedObject var viewModel: FaceLockViewModel
    @EnvironmentObject var appState: AppState
    @StateObject private var cameraManager = CameraSessionManager()

    var body: some View {
        ZStack {
            CameraPreview(session: cameraManager.getSession())
                .ignoresSafeArea()

            if viewModel.isFaceMatched {
                Text("Face Detected ✅")
                    .padding()
                    .background(.green.opacity(0.8))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .onAppear {
                        appState.isUnlocked = true
                    }
            } else {
                Text("Searching for Face...")
                    .padding()
                    .background(.red.opacity(0.7))
                    .cornerRadius(12)
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            cameraManager.onFrameCaptured = { buffer in
                viewModel.processFrame(buffer)
            }
            cameraManager.startSession()
        }
    }
}

