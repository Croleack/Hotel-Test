//
//  BRoomData.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import Foundation

struct RoomModel: Codable {
    let rooms: [Room]
}

struct Room: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
}

