//
//  ValidationError.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

enum ValidationError: Error {
    case emptyMail
    case notMail
    case emptyPhone
    case notPhone
    case emptyDate
    case notDate
    case emptyPassport
    case notPassport
    case emptyName
    case notName
}
