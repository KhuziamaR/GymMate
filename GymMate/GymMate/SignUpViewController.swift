//
//  SignUpViewController.swift
//  GymMate
//
//  Created by Kinza Rehman on 4/22/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
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
        Auth.auth().createUser(withEmail: "test2@gmail.com", password: "123456")
        {(authDataResult,error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email)
                let dict: Dictionary<String,Any> = [
                    "uid": authData.user.uid,
                    "email":authData.user.email,
                    "profileImageUrl": "",
                    "status": "Welcome to GymMate"
                ]
                Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict,withCompletionBlock: {
                    (error,ref) in
                    if error == nil {
                        print("Done")
                    }
                })
            }
            
        }
    }
}
