//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 04.09.23.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
