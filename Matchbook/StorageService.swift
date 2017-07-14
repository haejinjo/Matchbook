//
//  StorageService.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/14/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

// FOR UPLOADING IMAGES


struct StorageService {
    
    // FUNC -- RETURNS DOWNLOAD URL FOR THE IMAGE
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        
        // convert from UIImage to Data + reduce img quality to speed up storage
        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil) // failure to convert to Data
        }
        
        // upload data to path provided by parameter, reference
        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            completion(metadata?.downloadURL())
        })
    }
    
    
}

extension StorageService {
    static func newSavedBookImageReference() -> StorageReference {
        let uid = User.current.uid
        
        return Storage.storage().reference().child("image/posts/\(uid).jpg")
    }
}
