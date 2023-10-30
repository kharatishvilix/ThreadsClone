//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation

    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button {
                    SoundManager.instance.playSound(sound: .newthread)
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }

                // threads and replies section

                UserContentListView(user: user)
            }
        }
        .refreshable {
            Task { try await FeedViewModel().fetchThreads() }
            SoundManager.instance.playSound(sound: .refresh)
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
