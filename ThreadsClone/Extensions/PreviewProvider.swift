//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 06.09.23.
//

import Foundation
import SwiftUI
extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()

    let user = User(id: NSUUID().uuidString, fullname: "Luka Kharatishvili", username: "Kharatishvilix", password: "testtest")
}
