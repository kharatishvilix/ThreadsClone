////
////  FollowService.swift
////  ThreadsClone
////
////  Created by Luka  Kharatishvili on 02.11.23.
////
//
//
//
//
//import Firebase
//import FirebaseFirestore
//
//private var currentUser: User? {
//    return CurrentUserProfileViewModel().currentUser
//}
//
//
//func followUser(currentUser: User, otherUser: User, completion: @escaping (Error?) -> Void) {
//    // Get the Firebase Firestore database reference.
//    let firestore = Firestore.firestore()
//
//    // Create a reference to the following node for the current user.
//    let followingRef = firestore.collection("users").document(currentUser.id).collection("following").document(currentUser.id)
//
//    // Set the following node to true.
//    followingRef.setData(["following": true], completion: { error, _ in
//        if error != nil {
//            completion(error)
//            return
//        }
//
//        // Create a reference to the followers node for the other user.
//        let followersRef = firestore.collection("users").document(User.id).collection("followers").document(User.id)
//
//        // Set the followers node to true.
//        followersRef.setData(["follower": true], completion: { error, _ in
//            if error != nil {
//                completion(error)
//                return
//            }
//
//            // The follow was successful.
//            completion(nil)
//        })
//    })
//}
