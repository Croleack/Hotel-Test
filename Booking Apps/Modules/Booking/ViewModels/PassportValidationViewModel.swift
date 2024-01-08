//
//  PassportValidationViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import Foundation

final class PassportValidationViewModel: ObservableObject {
    
    @Published var text: String = .defString {
	   didSet {
		  updateValidity()
	   }
    }
    
    let placeholder: String
    @Published var isValid = true
    var isPassport = false
    
    init(placeholder: String) {
	   self.placeholder = placeholder
    }
    
    private func updateValidity() {
	   if !isPassport {
		  if text.isEmpty {
			 isPassport = false
		  } else {
			 isPassport = true
		  }
	   }
    }
}
