//
//  BHotel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import Foundation

struct HotelModel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: BAboutTheHotel
    
}

struct BAboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}



