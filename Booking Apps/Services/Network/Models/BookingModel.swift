//
//  BBookinData.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import Foundation

struct BookingModel: Codable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    
}

