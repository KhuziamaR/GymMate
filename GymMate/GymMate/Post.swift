//
//  Post.swift
//  GymMate
//
//  Created by Khuziama Rehman on 5/27/21.
//

import Foundation
class Post {
    var caption: String
    var photoUrl: String
    var username: String
    
    init(captionText: String, photoUrlString: String,  usernameString: String) {
        caption = captionText
        photoUrl = photoUrlString
        username = usernameString
    }
}
