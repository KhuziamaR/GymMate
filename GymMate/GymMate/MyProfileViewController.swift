//
//  MyProfileViewController.swift
//  GymMate
//
//  Created by Kinza Rehman on 5/3/21.
//

import UIKit
import FirebaseAuth
class MyProfileViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
//        setupTitleLabel()
//        setupAvatar()
//        setupFullNameTextField()
//        setupEmailTextField()
        setupLogoutButton()
    }
    
    @IBAction func logoutButtonDidTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
     do {
       try firebaseAuth.signOut()
        let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
           let loginNavigationCongtroller = storyboard.instantiateViewController(identifier: "LoginNavigationController")
           
           // This is to get the SceneDelegate object from your view controller
           // then call the change root view controller function to change to main tab bar
           (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavigationCongtroller)
     } catch let signOutError as NSError {
       print ("Error signing out: %@", signOutError)
     }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
