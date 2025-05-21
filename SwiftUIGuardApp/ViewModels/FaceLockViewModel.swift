//
//  FaceLockViewModel.swift
//  SwiftUIGuardApp
//
//  Created by Denidu Gamage on 2025-05-21.
//

import Foundation
import Combine
import CoreMedia

class FaceLockViewModel: ObservableObject {
    @Published var isFaceMatched = false
    private let faceService = FaceRecognitionService()

    func processFrame(_ buffer: CMSampleBuffer) {
        faceService.detectFace(in: buffer) { [weak self] matched in
            DispatchQueue.main.async {
                self?.isFaceMatched = matched
            }
        }
    }
}

