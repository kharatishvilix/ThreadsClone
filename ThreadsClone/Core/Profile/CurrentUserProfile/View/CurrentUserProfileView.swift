//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 15.09.23.
//

import Firebase
import FirebaseAuth
import SwiftUI

struct CurrentUserProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @State private var showEditProfile = false

    private var currentUser: User? {
        return viewModel.currentUser
    }

    @StateObject var viewModel = CurrentUserProfileViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)

                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            // custom border
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    .sheet(isPresented: $showEditProfile, content: {
                        EditProfileView()
                            .environmentObject(viewModel)
                    })

                    // threads and replies section

                    UserContentListView()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
