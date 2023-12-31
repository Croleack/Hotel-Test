//
//  ValidationMail.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//
import Foundation

final class MailValidationService {
    
    static let shared = MailValidationService()
    
    func checkMail(mail: String) throws {
	   guard !mail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
		  throw ValidationError.emptyMail
	   }
	   
	   guard mail.count <= 255 else {
		  throw ValidationError.emptyMail
	   }
	   
	   guard isMail(mail: mail) else {
		  throw ValidationError.notMail
	   }
    }
    
    func isMail(mail: String) -> Bool {
	   let emailSymbols = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	   let emailPrefix = NSPredicate(format:"SELF MATCHES %@", emailSymbols)
	   return emailPrefix.evaluate(with: mail)
    }
}




