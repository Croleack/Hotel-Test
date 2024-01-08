//
//  DateValidationViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import Foundation

final class DateValidationViewModel: ObservableObject {
    
    @Published var text: String = .defString
    @Published var editingDate = false {
	   didSet {
		  if !editingDate {
			 do {
				try DateValidationService.shared.checkDate(date: text)
				isValidDate = true
			 } catch {
				isValidDate = false
			 }
		  }
	   }
    }
    @Published var isValidDate = true
    
    let placeholder: String
    
    init(placeholder: String) {
	   self.placeholder = placeholder
    }
    
    func setupEditingDate(_ editingDate: Bool) {
	   self.editingDate = editingDate
    }
}
