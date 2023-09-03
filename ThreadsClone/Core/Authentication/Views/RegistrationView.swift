//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 01.09.23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image("threads-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding()
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(ThreadsTextFieldModifier())

                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
            }
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifier())
            }
            .padding(.vertical)

            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account? ")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }

    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationView()
        }
    }
}
