//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 28.10.23.
//

import Firebase
import Foundation

class CreateThreadViewModel: ObservableObject {
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.UploadThread(thread)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Task { try await ThreadService.fetchThreads() }
        }
    }
}
