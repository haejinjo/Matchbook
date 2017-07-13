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
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User


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
        
        signUpOrLogInButton.layer.cornerRadius = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
} // end of class

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {  
            print("Error signing in: \(error.localizedDescription)")
            
            return
        }
        
        guard let user = user
            else { return }
        
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            
            // if pre-existing user
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
                
                User.setCurrent(user)
                
                // go to main storyboard
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                }
            // else a new user!
            else {
                print("New user!")
                self.performSegue(withIdentifier: Constants.Segue.toCreatUsername, sender: self)
            }
        })
        
        print("handle user signup/login")
    }
    
    
} // end of class extension
