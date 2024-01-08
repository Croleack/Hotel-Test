//
//  NameValidationService.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import Foundation

final class NameValidationService {
    
    static let shared = NameValidationService()
    
    func checkName(name: String) throws {
	   guard !name.isEmpty else { throw ValidationError.emptyName }
	   guard isValidName(name: name) else { throw ValidationError.notName }
    }
    
    func isValidName(name: String) -> Bool {
	   let nameSymbols = #"^[a-zA-Zа-яА-Я]+$"#
	   let result = name.range(
		  of: nameSymbols,
		  options: .regularExpression
	   )
	   return (result != nil)
    }
}
