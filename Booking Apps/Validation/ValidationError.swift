//
//  ValidationError.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

enum ValidationError: Error {
    
    case emptyMail
    case nonExistentMail
    case notMail
    case emptyPhone
    case nonExistentPhone
    case notPhone
    
}
