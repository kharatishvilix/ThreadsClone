//
//  ThreadsButtonModifier.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 01.09.23.
//

import SwiftUI

struct ThreadsButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352, height: 44)
            .background(.black)
            .cornerRadius(9)
    }
}
