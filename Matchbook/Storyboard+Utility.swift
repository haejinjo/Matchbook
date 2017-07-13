//
//  Storyboard+Utility.swift
//  Matchbook
//
//  Created by Haejin Jo on 7/11/17.
//  Copyright © 2017 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit


extension UIStoryboard {
    
    // MBType = "MatchBook" type
    enum MBType: String {
        case main // a case for each of the storyboards
        case login
        case profile
        
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: MBType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: MBType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
}
