//
//  ProfileViewController.swift
//  Matchbook
//
//  Created by Anika Morris on 7/12/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import FirebaseAuthUI
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 5
        
        let currentUser = User.current
        
        usernameLabel.text = "@\(currentUser.username)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    

    
}
