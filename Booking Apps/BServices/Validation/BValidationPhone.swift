//
//  ValidationPhone.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class BValidationPhone {
    
    static let shared = BValidationPhone()
    
    func checkPhone(phone: String) throws {
	   guard phone != "" else { throw BValidationError.emptyPhone}
	   guard isPhone(phone: phone) else { throw BValidationError.notPhone }
    }
    
    func isPhone(phone: String) -> Bool {
	   let phoneSymbols = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{2}[ -]?\d{2}$"#
	   let result = phone.range(
		  of: phoneSymbols,
		  options: .regularExpression
	   )
	   return (result != nil)
    }
}
