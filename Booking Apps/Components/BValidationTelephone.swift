//
//  BValidationTelephone.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 05.09.2023.
//

import SwiftUI

struct BValidationTelephone: View {
    
    @State private var phoneNumber = "+7"
    @State private var isPhoneNumberValid = false
    @State private var isValidationPerformed = false
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 0) {
		  Text("Номер телефона")
			 .font(.subheadline)
			 .foregroundColor(Color("PaleGray"))
		  
		  TextField("", text: $phoneNumber)
			 .textFieldStyle(RoundedBorderTextFieldStyle())
			 .padding()
			 .onChange(of: phoneNumber) { newValue in isPhoneNumberValid = validatePhoneNumber(newValue)
			 }
		  
		  Button("Проверить номер") {
			 isPhoneNumberValid = validatePhoneNumber(phoneNumber)
			 isValidationPerformed = true
		  }
		  
		  if isValidationPerformed {
			 if isPhoneNumberValid {
				Text("Номер действителен.")
				    .foregroundColor(.green)
			 } else {
				Text("Номер недействителен.")
				    .foregroundColor(.red)
			 }
		  }
	   }
	   .padding()
    }
    
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
	   let digits = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
	   
	   return digits.count == 11
    }
}

struct BValidationTelephone_Previews: PreviewProvider {
    static var previews: some View {
	   BValidationTelephone()
    }
}
