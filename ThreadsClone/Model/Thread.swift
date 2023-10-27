//
//  Thread.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 28.10.23.
//
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?

    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    // likes can change
    var likes: Int
    var id: String {
        return threadId ?? NSUUID().uuidString
    }

    var user: User?
}
