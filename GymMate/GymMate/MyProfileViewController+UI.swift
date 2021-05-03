//
//  MyProfileViewController+UI.swift
//  GymMate
//
//  Created by Kinza Rehman on 5/3/21.
//

import UIKit

extension MyProfileViewController{
    func setupLogoutButton(){
        logoutButton.setTitle("Log Out", for: UIControl.State.normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        logoutButton.backgroundColor = UIColor.red
        logoutButton.layer.cornerRadius = 5
        logoutButton.clipsToBounds = true
    }
}
