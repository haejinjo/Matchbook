//
//  ViewController.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/10/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    // VC LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// IB OUTLETS
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    

// IB ACTIONS
    @IBAction func buyButtonTapped(_ sender: UIButton) {
    }
    @IBAction func saveButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
    }
    @IBAction func profileButtonTapped(_ sender: UIButton) {
    }




}

