//
//  BTouristCellViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import Foundation

final class TouristCellViewModel: ObservableObject {
    
    @Published var isShow = true
    let index: Int
    let nameTourists = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой"]
    let name = NameValidationViewModel(placeholder: "Имя")
    let surname = NameValidationViewModel(placeholder: "Фамилия")
    let dateOfBirth = DateValidationViewModel(placeholder: "Дата рождения")
    let citizenship = NameValidationViewModel(placeholder: "Гражданство")
    let passportNumber = PassportValidationViewModel(placeholder: "Номер загранпаспорта")
    let validityPeriodOfPassport = DateValidationViewModel(placeholder: "Срок действия загранпаспорта")
    
    init(index: Int) {
	   self.index = index
	   if index > .zero {
		  isShow = false
	   }
    }
}
