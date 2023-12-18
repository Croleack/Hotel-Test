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
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
		  case id
		  case name
		  case price
		  case pricePer = "price_per"
		  case peculiarities
		  case imageUrls = "image_urls"
    }
}

