//
//  SignUpViewController.swift
//  GymMate
//
//  Created by Kinza Rehman on 4/22/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD
class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    
    var image:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        setupTitleLabel()
        setupAvatar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
 
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        self.signUp( onSuccess: {
            // switch view on success
            let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
               let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
               
               // This is to get the SceneDelegate object from your view controller
               // then call the change root view controller function to change to main tab bar
               (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
          
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
}
