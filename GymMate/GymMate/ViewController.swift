//
//  ViewController.swift
//  GymMate
//
//  Created by Kinza Rehman on 4/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var signInGoogleButton: UIButton!
    @IBOutlet weak var signInFacebookButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    
    func setupUI(){
        setupHeaderTitle()
        setupOrLabel()
        setupTermsLabel()
        setupFacebookButton()
        setupGoogleButton()
        setupCreateAccountButton()
       
        
        
        
        
       
        
    }

}

