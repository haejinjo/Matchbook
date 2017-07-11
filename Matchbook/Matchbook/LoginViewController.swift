//
//  LoginViewController.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/11/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        print("sign up button tapped")
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        
        print("log in button tapped")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
