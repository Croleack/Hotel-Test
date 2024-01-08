//
//  PassportValidationService.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import Foundation

final class PassportValidationService {
    
    static let shared = PassportValidationService()
    
    func checkPassport(passport: String) throws {
	   guard passport != "" else { throw ValidationError.emptyPassport }
	   guard isPassport(passport: passport) else { throw ValidationError.notPassport }
    }
    
    func isPassport(passport: String) -> Bool {
	   let passportPattern = #"^[А-Я]{2} \d{6}$"#
	   let result = passport.range(
		  of: passportPattern,
		  options: .regularExpression
	   )
	   return (result != nil)
    }
}
