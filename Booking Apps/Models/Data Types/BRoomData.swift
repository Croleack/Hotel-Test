//
//  BRoomData.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import Foundation

struct BRoomData: Codable {
    let rooms: [BRoom]
}

struct BRoom: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}

