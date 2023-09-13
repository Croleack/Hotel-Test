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
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: BAboutTheHotel
    
    
    enum CodingKeys: String, CodingKey {
	   case id
	   case name
	   case address = "adress"
	   case minimalPrice = "minimal_price"
	   case priceForIt = "price_for_it"
	   case rating
	   case ratingName = "rating_name"
	   case imageUrls = "image_urls"
	   case aboutTheHotel = "about_the_hotel"
    }
}

struct BAboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}



