//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 17.10.23.
//

import Firebase
import FirebaseStorage
import Foundation

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return nil }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")

        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to load image with an error : \(error.localizedDescription)")
            return nil
        }
    }
}
