//
//  DateValidationService.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import Foundation

final class DateValidationService {
    
    static let shared = DateValidationService()
    
    func checkDate(date: String) throws {
	   guard date != "" else { throw ValidationError.emptyDate }
	   guard isDate(date: date) else { throw ValidationError.notDate }
    }
    
    func isDate(date: String) -> Bool {
	   let dateSymbols = #"^\d{2}/\d{2}/\d{4}$"#
	   let result = date.range(
		  of: dateSymbols,
		  options: .regularExpression
	   )
	   return (result != nil)
    }
}
