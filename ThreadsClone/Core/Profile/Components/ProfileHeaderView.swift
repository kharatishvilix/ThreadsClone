//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 16.09.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    init(user: User?) {
        self.user = user
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? " ")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ?? " ")
                        .font(.subheadline)
                }
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }

                Text("31k followers")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            Spacer()
            ProfileImageView()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
