//
//  MailValidationViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class BMailValidationViewModel: ObservableObject {
    
    @Published var text: String = "" {
	   didSet {
		  if !isMail {
			 if text.isEmpty {
				isValid = false
			 } else {
				isValid = true
			 }
		  }
	   }
    }
    let placeholder: String
    @Published var isValid = true
    var isMail = false
    
    init(placeholder: String) {
	   self.placeholder = placeholder
    }
    
}
