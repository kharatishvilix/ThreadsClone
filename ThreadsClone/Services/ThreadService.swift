//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 28.10.23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
struct ThreadService {
    static func UploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }

    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }

    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }

    static func deleteThread(threadID: String) {
        let threadReference = Firestore.firestore().collection("threads").document(threadID)
        threadReference.delete()
    }
}
