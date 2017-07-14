//
//  CreateProfilePictureViewController.swift
//  Matchbook
//
//  Created by Anika Morris on 7/13/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateProfilePictureViewController: UIViewController {
    
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var profilePictureImage: UIImageView!
    
    let photoHelper = MBPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            print("handle image")
            
        }
        
        takePhotoButton.layer.cornerRadius = 6
        nextButton.layer.cornerRadius = 6
    }
    
    // IB ACTION FUNCTIONS
    
    @IBAction func takePhotoButtonTapped(_ sender: UIButton) {
        photoHelper.presentActionSheet(from: self)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
}
