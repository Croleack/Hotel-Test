//
//  NameValidationViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import Foundation

final class NameValidationViewModel: ObservableObject {
    
    @Published var text: String = .defString {
	   didSet {
		  updateValidity()
	   }
    }
    
    let placeholder: String
    @Published var isValidName = true
    var isText = false
    
    init(placeholder: String) {
	   self.placeholder = placeholder
    }
    
    private func updateValidity() {
	   if !isText {
		  if text.isEmpty {
			 isValidName = false
		  } else {
			 isValidName = true
		  }
	   }
    }
}
