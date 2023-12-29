//
//  Tourist.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import Foundation

struct Tourist: Identifiable, Hashable {
    
    let id = UUID().uuidString
    var name: String
    var surname: String
    var dateOfBirth: String
    var citizenship: String
    var passportNumber: String
    var validityPeriodOfPassport: String
    
    static var clearTourist: Tourist {
	   Tourist(name: "",
			 surname: "",
			 dateOfBirth: "",
			 citizenship: "",
			 passportNumber: "",
			 validityPeriodOfPassport: "")
    }
}
