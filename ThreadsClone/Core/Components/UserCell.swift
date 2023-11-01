//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            ProfileImageView(user: user, size: .small)

            VStack(alignment: .leading) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .font(.footnote)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/,
                   label: {
                       Text("Follow")
                   })
                   .foregroundColor(.black)
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
        UserCell(user: dev.user)
    }
}
