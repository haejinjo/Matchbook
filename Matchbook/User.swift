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
    
    // SINGLETON
    
    private static var _current: User?
    
    // getter function allowing access to private variable and checking existence of current user
    static var current: User {
        guard let currentUser = _current else {
            fatalError("error: current user doesn't exist")
    }
        return currentUser
    }
    
    // CLASS METHODS
    
    static func setCurrent(_ user: User) {
        _current = user
    }
    
    // PROPERTIES
    
    let uid: String
    let username: String
//    let displayName: String
    
    // INIT
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
//        self.displayName = displayName
    }
    
    
    // FAILABLE INIT
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let username = dict["username"] as? String
//            let displayName = dict["displayName"] as? String
            else {return nil}
        
        self.uid = snapshot.key
        self.username = username
//        self.displayName = displayName
    }
}
