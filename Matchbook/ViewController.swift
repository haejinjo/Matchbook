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
import Kingfisher


class ViewController: UIViewController {
    
    var book: Book?
    
    // VC LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileButton.layer.cornerRadius = 35
        buyButton.layer.cornerRadius = 30
        saveButton.layer.cornerRadius = 30
        nextButton.layer.cornerRadius = 30
        
        let randomListIndex: Int = Int(arc4random_uniform(11))
        let randomBookIndex: Int = Int(arc4random_uniform(5))
        DataRequest.addAcceptableImageContentTypes(["image/jpg"])
        let apiToContact = "https://api.nytimes.com/svc/books/v3/lists/overview.json?list=hardcover-fiction&api-key=8b2a0ba899274e7191ac09415872c362"
        
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let randomBookChunk = json["results"]["lists"][randomListIndex]["books"][randomBookIndex]
                    let randomBook = Book(json: randomBookChunk)
                    self.book = randomBook
                    
                    self.titleLabel.text = randomBook.title
                    self.authorLabel.text = randomBook.author
                    self.summaryTextView.text = randomBook.description
                    self.coverImage.image = Image(self.loadCover(urlString: randomBook.imageURL, forced: false))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCover(urlString:String, forced:Bool) {
        if let url = URL(string: urlString) {
            print(urlString)
            
            if !forced {
                coverImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                    if ((error) != nil) {
                        print(error?.localizedDescription)
                    }
                    if cache == .memory {
                        print(cache)
                        
                        self.loadCover(urlString: urlString, forced: true)
                        
                    }
                    self.coverImage.setNeedsLayout()
                })

            } else {
                coverImage.kf.setImage(with: url, placeholder: nil, options: [.forceRefresh], progressBlock: nil, completionHandler: { (image, error, cache, url) in
                    if ((error) != nil) {
                        print(error?.localizedDescription)
                    }
                    self.coverImage.setNeedsLayout()
                })
            }
            
            
        } else {
            print("loadCover Failed, url String nil")
        }
        
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
        if let book = book {
            UIApplication.shared.openURL(URL(string: book.amazonURL)!)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let randomListIndex: Int = Int(arc4random_uniform(11))
        let randomBookIndex: Int = Int(arc4random_uniform(5))
        
        let apiToContact = "https://api.nytimes.com/svc/books/v3/lists/overview.json?list=hardcover-fiction&api-key=8b2a0ba899274e7191ac09415872c362"
        DataRequest.addAcceptableImageContentTypes(["image/jpg"])
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let randomBookChunk = json["results"]["lists"][randomListIndex]["books"][randomBookIndex]
                    let randomBook = Book(json: randomBookChunk)
                    self.book = randomBook
                    self.titleLabel.text = randomBook.title
                    self.authorLabel.text = randomBook.author
                    self.summaryTextView.text = randomBook.description
                    self.coverImage.image = Image(self.loadCover(urlString: randomBook.imageURL, forced: false))
                }
            case .failure(let error):
                print(error)
            }
        }
    } // end of next button tapped
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        
        let initialViewController = UIStoryboard.initialViewController(for: .profile)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
        
    }

}

