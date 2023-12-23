//
//  ValidationMail.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class BValidationMail {
    
    static let shared = BValidationMail()
    
    func checkMail(mail: String) throws {
	   guard mail != "" else { throw BValidationError.emptyMail}
	   guard isMail(mail: mail) else { throw BValidationError.notMail }
    }
    
    func isMail(mail: String) -> Bool {
	   let emailSymbols = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	   let emailPrefix = NSPredicate(format:"SELF MATCHES %@", emailSymbols)
	   return emailPrefix.evaluate(with: mail)
    }
}
