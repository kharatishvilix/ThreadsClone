//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    private var user: User? {
        return UserService.shared.currentUser
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    ProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                            .autocorrectionDisabled(true)
                    }
                    .font(.footnote)
                    Spacer()
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        Task { try await viewModel.uploadThread(caption: caption)
                            SoundManager.instance.playSound(sound: .newthread)
                            dismiss()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            Task { try await ThreadService.fetchThreads() }
                        }
                    }
                    .font(.headline)
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct CreateThreadView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadView()
    }
}
