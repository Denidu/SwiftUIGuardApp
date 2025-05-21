//
//  FaceRecognitionService.swift
//  SwiftUIGuardApp
//
//  Created by Denidu Gamage on 2025-05-21.
//

import AVFoundation
import Vision

class FaceRecognitionService {
    private var faceDetectionRequest: VNDetectFaceRectanglesRequest

    init() {
        faceDetectionRequest = VNDetectFaceRectanglesRequest()
    }

    func detectFace(in buffer: CMSampleBuffer, completion: @escaping (Bool) -> Void) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) else {
            completion(false)
            return
        }

        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right, options: [:])

        do {
            try handler.perform([faceDetectionRequest])
            let hasFace = !(faceDetectionRequest.results?.isEmpty ?? true)
            completion(hasFace)
        } catch {
            print("Face detection failed: \(error)")
            completion(false)
        }
    }
}

