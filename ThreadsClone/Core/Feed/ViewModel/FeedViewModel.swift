//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 28.10.23.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()

    init() {
        Task { try await fetchThreads() }
    }

    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }

    public func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadAuthor = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadAuthor
        }
    }
}
