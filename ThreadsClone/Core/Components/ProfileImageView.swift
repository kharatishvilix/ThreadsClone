//
//  ProfileImageView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 02.09.23.
//

import Kingfisher
import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case fullSize

    var dimensions: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        case .fullSize: return 250
        }
    }
}

struct ProfileImageView: View {
    var user: User?
    let size: ProfileImageSize

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray5))
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(user: dev.user, size: .small)
    }
}
