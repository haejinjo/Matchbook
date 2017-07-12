//
//  Book.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/11/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Book {
    
    let title: String
    let author: String
    let imageURL: String
    let description: String
    let amazonURL: String
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.author = json["author"].stringValue
        self.imageURL = json["book_image"].stringValue
        self.description = json["description"].stringValue
        self.amazonURL = json["amazon_product_url"].stringValue
    }
}
