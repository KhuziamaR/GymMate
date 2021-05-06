//
//  MyProfileViewController+UI.swift
//  GymMate
//
//  Created by Kinza Rehman on 5/3/21.
//

import UIKit
import FirebaseAuth
extension MyProfileViewController{
    func setupLogoutButton(){
        logoutButton.setTitle("Log Out", for: UIControl.State.normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        logoutButton.backgroundColor = UIColor.red
        logoutButton.layer.cornerRadius = 5
        logoutButton.clipsToBounds = true
    }
    func setupImage(){
        let user = Auth.auth().currentUser
        let imageUrl = user?.photoURL


        let imageData = try! Data(contentsOf: imageUrl!)

        image.image = UIImage(data: imageData)
        
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        
    }
    func setupUserNameLabel(){
        let user = Auth.auth().currentUser
        let username = user?.displayName
        
        
        
        let attributedText = NSMutableAttributedString(string: username!,attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 24)!, NSAttributedString.Key.foregroundColor : UIColor.black
        ])
        usernameLabel.attributedText = attributedText
        usernameLabel.sizeToFit()
        usernameLabel.textAlignment = .center
//        usernameLabel.center = self.view.center
    }
  

}
