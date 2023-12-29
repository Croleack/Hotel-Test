//
//  MailValidationViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class MailValidationViewModel: ObservableObject {
    
    @Published var text: String = .defString {
	   didSet {
		  updateValidity()
	   }
    }
    
    let placeholder: String
    @Published var isValid = true
    var isMail = false
    
    init(placeholder: String) {
	   self.placeholder = placeholder
    }
    
    private func updateValidity() {
	   if !isMail {
		  if text.isEmpty {
			 isValid = false
		  } else {
			 isValid = true
		  }
	   }
    }
}
