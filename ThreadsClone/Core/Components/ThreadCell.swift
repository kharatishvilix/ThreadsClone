//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import SwiftUI
struct ThreadCell: View {
    let thread: Thread
    private var currentUser: User? {
        return CurrentUserProfileViewModel().currentUser
    }

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                ProfileImageView(user: thread.user, size: .small)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(thread.timestamp.timeStampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))

                        Button {
                            if thread.ownerUid == currentUser?.id {
                                ThreadService.deleteThread(threadID: thread.threadId!)
                                SoundManager.instance.playSound(sound: .deletethread)
                            }
                        } label: {
                            if thread.ownerUid == currentUser?.id {
                                Image(systemName: "trash")
                                    .foregroundColor(Color(.red))
                            } else {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(Color(.darkGray))
                            }
                        }
                    }
                    Text(thread.caption)
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
        ThreadCell(thread: dev.thread)
    }
}
