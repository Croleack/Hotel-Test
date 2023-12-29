//
//  ValidationPhone.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class PhoneValidationService {
    
    static let shared = PhoneValidationService()
    
    func checkPhone(phone: String) throws {
	   guard phone != "" else { throw ValidationError.emptyPhone}
	   guard isPhone(phone: phone) else { throw ValidationError.notPhone }
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
