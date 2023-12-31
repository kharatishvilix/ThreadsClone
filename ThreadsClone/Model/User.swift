//
//  User.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 04.09.23.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let username: String
    let password: String
    let email: String

    // optional
    var profileImageUrl: String?
    var bio: String?
}
