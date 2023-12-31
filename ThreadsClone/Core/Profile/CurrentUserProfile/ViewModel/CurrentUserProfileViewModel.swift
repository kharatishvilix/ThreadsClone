//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 04.09.23.
//

import Combine
import Foundation
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var threads = [Thread]()

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
    }
    

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
}
