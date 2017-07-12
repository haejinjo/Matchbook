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
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController {
    
    // VC LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileButton.layer.cornerRadius = 30
        buyButton.layer.cornerRadius = 30
        saveButton.layer.cornerRadius = 30
        nextButton.layer.cornerRadius = 30
        
        let randomIndex: Int = Int(arc4random_uniform(0))
        
        let apiToContact = "https://api.nytimes.com/svc/books/v3/lists/overview.json?list=hardcover-fiction&api-key=8b2a0ba899274e7191ac09415872c362"
        
//        Alamofire.request(apiToContact).validate().responseJSON() { response in
//            switch response.result {
//            case .success:
//                if let value = response.result.value {
//                    let json = JSON(value)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
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
    @IBOutlet weak var summaryTextView: UITextView!
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

