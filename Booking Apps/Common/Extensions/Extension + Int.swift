//
//  Extension + Int.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 22.12.2023.
//

import Foundation

extension Int {
    /// to validate the number
    var withSeparator: String {
	   let formatter = NumberFormatter()
	   formatter.numberStyle = .decimal
	   return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
