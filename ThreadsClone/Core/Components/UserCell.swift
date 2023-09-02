//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            ProfileImageView()

            VStack(alignment: .leading) {
                Text("xmefabot")
                    .fontWeight(.semibold)
                Text("Kote the cat")
            }
            .font(.footnote)
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay { RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal, 10)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
