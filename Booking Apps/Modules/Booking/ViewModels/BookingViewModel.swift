//
//  BBookingViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

final class BookingViewModel: ObservableObject {
    
    @Published var bookingData: BookingModel?
    @Published var tourists = [Tourist.clearTourist]
    
    var touristsCells = [TouristCellViewModel(index: 0)]
    let phone = PhoneValidationViewModel()
    let mail = MailValidationViewModel(placeholder: "Почта")
    let date = DateValidationViewModel(placeholder: "Дата рождения")
    let passport = PassportValidationViewModel(placeholder: "Номер загранпаспорта")
    let name = NameValidationViewModel(placeholder: "Имя")
    let buttonTransaction = ButtonTransactionViewModel(title: .defString)
    @Published var isShowErrorAlert = false
    @Published var isActiveTransactionLink = false
    
    @Published var editingMail = false {
	   didSet {
		  if !editingMail {
			 mail.isValid = MailValidationService.shared.isMail(mail: mail.text)
		  }
	   }
    }
    
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher = NetworkDispatcher()) {
	   self.networkDispatcher = networkDispatcher
	   fetchBookingData()
	   mail.isMail = true
    }
    
    func fetchBookingData() {
	   networkDispatcher.fetchBooking { [weak self] result in
		  switch result {
		  case .success(let bookingData):
			 DispatchQueue.main.async {
				self?.bookingData = bookingData
				self?.updateButtonTransactionTitle()
			 }
		  case .failure(let error):
			 print("\(error.localizedDescription)")
		  }
	   }
    }
    
    func updateButtonTransactionTitle() {
	   buttonTransaction.title = "Оплатить \(totalAmount.withSeparator) ₽"
    }
    
    func setupEditingMail(_ editingMail: Bool) {
	   self.editingMail = editingMail
    }
    
    func checkTouristsInfo() -> Bool {
	   let isMail = MailValidationService.shared.isMail(mail: mail.text)
	   let isPhone = PhoneValidationService.shared.isPhone(phone: phone.text)
	   if !isMail {
		  mail.isValid = false
	   } else {
		  mail.isValid = true
	   }
	   if !isPhone {
		  phone.isValidPhone = false
	   } else {
		  phone.isValidPhone = true
	   }
	   var result = isMail && isPhone 
	   for tourist in touristsCells {
		  let isName = checkTextCell(touristCell: tourist.name)
		  let isSurname = checkTextCell(touristCell: tourist.surname)
		  let isDateOfBirth = checkTouristDateOfBirth(touristDateOfBirth: tourist.dateOfBirth)
		  let isPassportNumber = checkTouristPassport(touristPas: tourist.passportNumber)
		  let isCitizenship = checkTextCell(touristCell: tourist.citizenship)
		  let isValidityPeriodOfPassport = checkTouristDateOfBirth(touristDateOfBirth: tourist.validityPeriodOfPassport)
		  if !isName { result = false }
		  if !isSurname { result = false }
		  if !isDateOfBirth { result = false }
		  if !isCitizenship { result = false }
		  if !isPassportNumber { result = false }
		  if !isValidityPeriodOfPassport { result = false }
	   }
	   return result
    }
    
    func deployAllTourists() {
	   for tourist in touristsCells {
		  tourist.isShow = true
	   }
    }
    
    func checkTouristCell(touristCell: MailValidationViewModel) -> Bool {
	   if touristCell.text.isEmpty {
		  touristCell.isValid = false
		  return false
	   } else {
		  touristCell.isValid = true
		  return true
	   }
    }
    
    func checkTextCell(touristCell: NameValidationViewModel) -> Bool {
	   if touristCell.text.isEmpty {
		  touristCell.isValidName = false
		  return false
	   } else {
		  touristCell.isValidName = true
		  return true
	   }
    }
    
    func checkTouristsInfoAndNavigate() {
	   if checkTouristsInfo() {
		  isActiveTransactionLink = true
	   } else {
		  isShowErrorAlert = true
		  deployAllTourists()
	   }
    }
    
  /// checkTouristDateOfBirth - the function allows you to enter only valid values
    func checkTouristDateOfBirth(touristDateOfBirth: DateValidationViewModel) -> Bool {
	   guard touristDateOfBirth.text.count == 10 else {
		  touristDateOfBirth.isValidDate = false
		  return false
	   }
	   
	   let components = touristDateOfBirth.text.split(separator: "/")
	   guard components.count == 3 else {
		  touristDateOfBirth.isValidDate = false
		  return false
	   }
	   
	   guard let day = Int(components[0]),
		    let month = Int(components[1]),
		    let year = Int(components[2]) else {
		  touristDateOfBirth.isValidDate = false
		  return false
	   }
	   
	   if !(1...12).contains(month) {
		  touristDateOfBirth.isValidDate = false
		  return false
	   }
	   
	   switch month {
	   case 1, 3, 5, 7, 8, 10, 12:
		  if !(1...31).contains(day) {
			 touristDateOfBirth.isValidDate = false
			 return false
		  }
	   case 4, 6, 9, 11:
		  if !(1...30).contains(day) {
			 touristDateOfBirth.isValidDate = false
			 return false
		  }
	   case 2:
		  let isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
		  if isLeapYear {
			 if !(1...29).contains(day) {
				touristDateOfBirth.isValidDate = false
				return false
			 }
		  } else {
			 if !(1...28).contains(day) {
				touristDateOfBirth.isValidDate = false
				return false
			 }
		  }
	   default:
		  touristDateOfBirth.isValidDate = false
		  return false
	   }
	   
	   touristDateOfBirth.isValidDate = true
	   return true
    }
    
    func checkTouristPassport(touristPas: PassportValidationViewModel) -> Bool {
	   if touristPas.text.count != 9 {
		  touristPas.isValid = false
		  return false
	   } else {
		  touristPas.isValid = true
		  return true
	   }
    }
    
    var tourPrice: Int {
	   tourists.count * (bookingData?.tourPrice ?? .zero)
    }
    var fuelCharge: Int {
	   tourists.count * (bookingData?.fuelCharge ?? .zero)
    }
    var serviceCharge: Int {
	   tourists.count * (bookingData?.serviceCharge ?? .zero)
    }
    
    var totalAmount: Int {
	   return tourPrice + fuelCharge + serviceCharge
    }
}

