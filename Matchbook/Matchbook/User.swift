//
//  User.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/11/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    
    // PROPERTIES
    
    let uid: String
    let username: String
    
    // INIT
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    
    // FAILABLE INIT
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let username = dict["usrename"] as? String
            else {return nil}
        
        self.uid = snapshot.key
        self.username = username
    }
}
