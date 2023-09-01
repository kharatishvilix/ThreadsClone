//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 01.09.23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    var body: some View {
        VStack {
            Spacer()
            Image("threads-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding()
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(ThreadsTextFieldModifier())

                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }
            Button {
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifier())
            }
            .padding(.vertical)

            Spacer()
            Divider()
            Button {
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
