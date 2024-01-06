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
    
    var toutistsCells = [TouristCellViewModel(index: 0)]
    let phone = PhoneValidationViewModel()
    let mail = MailValidationViewModel(placeholder: "Почта")
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
    
    private func updateButtonTransactionTitle() {
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
	   for tourist in toutistsCells {
		  let isName = checkTouristCell(touristCell: tourist.name)
		  let isSurname = checkTouristCell(touristCell: tourist.surname)
		  let isDateOfBirth = checkTouristCell(touristCell: tourist.dateOfBirth)
		  let isPassportNumber = checkTouristCell(touristCell: tourist.passportNumber)
		  let isCitizenship = checkTouristCell(touristCell: tourist.citizenship)
		  let isValidityPeriodOfPassport = checkTouristCell(touristCell: tourist.validityPeriodOfPassport)
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
	   for tourist in toutistsCells {
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
    
    func checkTouristsInfoAndNavigate() {
	   if checkTouristsInfo() {
		  isActiveTransactionLink = true
	   } else {
		  isShowErrorAlert = true
		  deployAllTourists()
	   }
    }
    
    var totalAmount: Int {
	   let tourPrice = bookingData?.tourPrice ?? .zero
	   let fuelCharge = bookingData?.fuelCharge ?? .zero
	   let serviceCharge = bookingData?.serviceCharge ?? .zero
	   
	   return tourPrice + fuelCharge + serviceCharge
    }
}

