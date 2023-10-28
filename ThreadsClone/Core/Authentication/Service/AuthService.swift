//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 04.09.23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
class AuthService {
    // is user logged in?

    @Published var userSession: FirebaseAuth.User?
    init() {
        self.userSession = Auth.auth().currentUser
    }

    //
    static let shared = AuthService()

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }

//    func login(withEmail email: String, password: String) {
//        print("DEBUG: Login with email \(email)")
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
//                return
//            }
//            guard let user = result?.user else { return }
//            self.userSession = user
//        }
//    }

    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            try await uploadUserData(withEmail: email, password: password, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() {
        try? Auth.auth().signOut() // signs out on back end
        userSession = nil // removes session locally
        UserService.shared.reset() // resets user data, such as names, usernames
    }

    // upload data to database
    @MainActor
    private func uploadUserData(withEmail email: String, password: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, username: username, password: password, email: email)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
