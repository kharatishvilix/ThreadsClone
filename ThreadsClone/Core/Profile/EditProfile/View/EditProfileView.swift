//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 03.09.23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)

                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack {
                    // name field
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Luka Kharatishvili")
                        }
                        Spacer()
                        ProfileImageView()
                    }
                    Divider()

                    // bio
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    Divider()

                    // link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add a link...", text: $link)
                    }
                    Divider()

                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)

                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
