//
//  LoginViewController.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/11/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var signUpOrLogInButton: UIButton!
    @IBAction func signUpOrLogInButtonTapped(_ sender: UIButton) {
        
        print("log in or sign up button tapped")
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else {return}
        
        // Make login view controller a delegate of
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
} // end of class

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        print("handle user signup/login")
    }
} // end of class extension
