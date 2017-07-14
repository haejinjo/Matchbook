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
import Kingfisher

class ProfileViewController: UIViewController {
    
    // PROPERTIES 
    
    var savedBooks = [Book]()
    
    // SUBVIEWS
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    // VC LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // configureTableView()
        
        backButton.layer.cornerRadius = 5
        
//        let photoHelper: MBPhotoHelper 
//        
//        photoHelper.completionHandler = { image in
//            SavedBookService.create(for: image)
//        }
        
        let currentUser = User.current
        
//        nameLabel.text = currentUser.displayName
        usernameLabel.text = "@\(currentUser.username)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let savedBook = savedBooks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedBookImageCell", for: indexPath) as! SavedBookImageCell
        
        let imageURL = URL(string: savedBook.imageURL)
        cell.savedBookImageView.kf.setImage(with: imageURL)
        
        return cell
    }
//    
//    func configureTableView() {
//        tableView.tableFooterView = UIView()
//        
//        tableView.separatorStyle = .none
//    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}


//
//extension ProfileViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let savedBook = savedBooks[indexPath.row]
//        
//        return savedBook.imageHeight
//    }
//}
