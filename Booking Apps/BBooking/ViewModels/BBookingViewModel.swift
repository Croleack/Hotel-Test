//
//  BBookingViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI
import Combine

final class BBookingViewModel: ObservableObject {
    
    @Published var bookingData: BookingData?
    @Published var tourists = [BTourist.clearTourist]
    
    var toutistsCells = [BTouristCellViewModel(index: 0)]
    let phone = BPhoneValidationViewModel()
    let mail = BMailValidationViewModel(placeholder: "Почта")
    let buttonTransaction = BButtonTransactionViewModel(title: " ")
    @Published var isShowErrorAlert = false
    @Published var isActiveTransactionLink = false
    
    @Published var editingMail = false {
	   didSet {
		  if !editingMail {
			 do {
				try BValidationMail.shared.checkMail(mail: mail.text)
				mail.isValid = true
			 } catch {
				mail.isValid = false
			 }
		  }
	   }
    }
    
    private let networkDispatcher: BNetworkDispatcher
    
    init(networkDispatcher: BNetworkDispatcher = BNetworkDispatcher()) {
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
	   let isMail = BValidationMail.shared.isMail(mail: mail.text)
	   let isPhone = BValidationPhone.shared.isPhone(phone: phone.text)
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
    
    func checkTouristCell(touristCell: BMailValidationViewModel) -> Bool {
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
	   let tourPrice = bookingData?.tourPrice ?? 0
	   let fuelCharge = bookingData?.fuelCharge ?? 0
	   let serviceCharge = bookingData?.serviceCharge ?? 0
	   
	   return tourPrice + fuelCharge + serviceCharge
    }
}

