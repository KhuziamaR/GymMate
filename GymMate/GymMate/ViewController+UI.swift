//
//  ViewController+UI.swift
//  GymMate
//
//  Created by Kinza Rehman on 4/22/21.
//

import UIKit

extension ViewController {
    
    func setupHeaderTitle(){
        let title = "Create a new account"
        let subTitle = "\n\n\n\n\nLorem ipsum fdf fdsf dfsdf fdsf."
        
        let attributedText = NSMutableAttributedString(string: title,attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black
        ])
        let attributedSubText = NSMutableAttributedString(string: subTitle,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.45)
        ])
        attributedText.append(attributedSubText)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
    }
    
    func setupOrLabel(){
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
    }
    
    func setupTermsLabel(){
        
        let attributedTermsText = NSMutableAttributedString(string: "By clicking \"Create a new account\" you agree to our ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        
        let attributedSubTermsTitle = NSMutableAttributedString(string: "Terms of Service.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        
        attributedTermsText.append(attributedSubTermsTitle)
        
        termsOfServiceLabel.attributedText = attributedTermsText
        termsOfServiceLabel.numberOfLines = 0
    }
    func setupFacebookButton(){
        signInFacebookButton.setTitle("Sign in with Facebook", for: UIControl.State.normal)
        signInFacebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInFacebookButton.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signInFacebookButton.layer.cornerRadius = 5
        signInFacebookButton.clipsToBounds = true
        signInFacebookButton.setImage(UIImage(named: "icons8-facebook-52"), for: UIControl.State.normal)
        signInFacebookButton.imageView?.contentMode = .scaleAspectFit
        signInFacebookButton.tintColor = .white
        signInFacebookButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -15, bottom: 12, right: 0)
    }
    func setupGoogleButton(){
        signInGoogleButton.setTitle("Sign in with Google", for: UIControl.State.normal)
        signInGoogleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInGoogleButton.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        signInGoogleButton.layer.cornerRadius = 5
        signInGoogleButton.clipsToBounds = true
        signInGoogleButton.setImage(UIImage(named: "icons8-google-48"), for: UIControl.State.normal)
        signInGoogleButton.imageView?.contentMode = .scaleAspectFit
        signInGoogleButton.tintColor = .white
        signInGoogleButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -35, bottom: 12, right: 0)
    }
    func setupCreateAccountButton(){
        
        createAccountButton.setTitle("Create a new account", for: UIControl.State.normal)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        createAccountButton.backgroundColor = UIColor.black
        createAccountButton.layer.cornerRadius = 5
        createAccountButton.clipsToBounds = true
    }

}
