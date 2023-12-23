//
//  BTouristCellViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import Foundation

final class BTouristCellViewModel: ObservableObject {
    
    @Published var isShow = true
    let index: Int
    let nameTourists = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый"]
    let name = BMailValidationViewModel(placeholder: "Имя")
    let surname = BMailValidationViewModel(placeholder: "Фамилия")
    let dateOfBirth = BMailValidationViewModel(placeholder: "Дата рождения")
    let citizenship = BMailValidationViewModel(placeholder: "Гражданство")
    let passportNumber = BMailValidationViewModel(placeholder: "Номер загранпаспорта")
    let validityPeriodOfPassport = BMailValidationViewModel(placeholder: "Срок действия загранпаспорта")
    
    init(index: Int) {
	   self.index = index
	   if index > 0 {
		  isShow = false
	   }
    }
}
