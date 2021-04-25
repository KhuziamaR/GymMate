//
//  ForgotPasswordViewController.swift
//  GymMate
//
//  Created by Kinza Rehman on 4/25/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI() {
        setupTitleLabel()
      
        setupEmailTextField()
        
        setupResetButton()
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
