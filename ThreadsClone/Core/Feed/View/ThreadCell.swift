//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image("profile-avatar")
                    .resizable()
//                    .scaledToFit()
                    .frame(width: 60, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Kharatishvilix")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10 m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))

                        Button {
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Text("Thread text goes here")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)

                    HStack(spacing: 16) {
                        Button {
                        } label: {
                            Image(systemName: "heart")
                        }

                        Button {
                        } label: {
                            Image(systemName: "bubble.right")
                        }

                        Button {
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }

                        Button {
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                }
            }
            Divider()
        }
        .padding()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell()
    }
}
