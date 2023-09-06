//
//  BHotel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import Foundation

struct BHotelData: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: BAboutTheHotel
}


