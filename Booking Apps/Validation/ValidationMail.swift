//
//  ValidationMail.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class ValidationMail {
    
    static let shared = ValidationMail()
    
    private init() { }
    
    func checkMail(mail: String) throws {
	   guard mail != "" else { throw ValidationError.emptyMail}
	   guard isMail(mail: mail) else { throw ValidationError.notMail }
    }
    
    func isMail(mail: String) -> Bool {
	   let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	   let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
	   return emailPred.evaluate(with: mail)
    }
    
}
