//
//  BPhoneValidationViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import Foundation

final class BPhoneValidationViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var editingPhone = false {
	   didSet {
		  if !editingPhone {
			 do {
				try ValidationPhone.shared.checkPhone(phone: text)
				isValidPhone = true
			 } catch {
				isValidPhone = false
			 }
		  }
	   }
    }
    @Published var isValidPhone = true
    
    var placeholder: String = "Номер телефона"
    
    func setupEditingPhone(_ editingPhone: Bool) {
	   self.editingPhone = editingPhone
    }
    
}
