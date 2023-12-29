//
//  NetworkManager.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 18.12.2023.
//

import Foundation

protocol INetworkManager {
    var request: String { get }
    var method: String { get }
}

extension INetworkManager {
    var jsonEncoder: JSONEncoder {
	   let encoder = JSONEncoder()
	   encoder.keyEncodingStrategy = .convertToSnakeCase
	   return encoder
    }
}

enum NetworkManager: INetworkManager {
    
    case hotel
    case rooms
    case booking
    
    var request: String {
	   switch self {
	   case .hotel:
		  return "d144777c-a67f-4e35-867a-cacc3b827473"
	   case .rooms:
		  return "8b532701-709e-4194-a41c-1a903af00195"
	   case .booking:
		  return "63866c74-d593-432c-af8e-f279d1a8d2ff"
	   }
    }
    
    var method: String {
	   switch self {
	   case .hotel, .rooms, .booking:
		  return "GET"
	   }
    }
}
