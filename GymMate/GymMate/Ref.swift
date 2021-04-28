//
//  Ref.swift
//  GymMate
//
//  Created by Kinza Rehman on 4/27/21.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

let REF_USER = "users"
let URL_STORAGE_ROOT = "gs://gymmate-e5498.appspot.com"
let STORAGE_PROFILE = "profile"
let PROFILE_IMAGE_URL = "profileImageUrl"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
let STATUS = "status"
let ERROR_EMPTY_PHOTO = "Please choose your profile image"
let ERROR_EMPTY_EMAIL = "Please enter an email address"
let ERROR_EMPTY_USERNAME = "Please enter an username"
let ERROR_EMPTY_PASSWORD = "Please enter a password"

//"uid": authData.user.uid,
//"email":authData.user.email,
//"username": username,
//"profileImageUrl": "",
//"status": "Welcome to GymMate"

class Ref{
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    var databaseUsers: DatabaseReference{
        return databaseRoot.child(REF_USER)
    }
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
        
    }
    // Storage reference
    
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    
    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
