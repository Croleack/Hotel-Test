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
    let nameTourists = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый"]
    let name = MailValidationViewModel(placeholder: "Имя")
    let surname = MailValidationViewModel(placeholder: "Фамилия")
    let dateOfBirth = MailValidationViewModel(placeholder: " Дата рождения")
    let citizenship = MailValidationViewModel(placeholder: "Гражданство")
    let passportNumber = MailValidationViewModel(placeholder: "Номер загранпаспорта")
    let validityPeriodOfPassport = MailValidationViewModel(placeholder: "Срок действия загранпаспорта")
    
    init(index: Int) {
	   self.index = index
	   if index > .zero {
		  isShow = false
	   }
    }
}
