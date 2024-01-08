//
//  Extension + collection.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 29.12.2023.
//

import Foundation
///- so that the application does not crash when the third value does not arrive
/// on the second screen makePeculiarities
extension Collection {
    subscript(safe index: Index) -> Element? {
	   return indices.contains(index) ? self[index] : nil
    }
}
