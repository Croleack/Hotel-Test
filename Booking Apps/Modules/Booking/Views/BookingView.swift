//
//  BBookingView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//
import SwiftUI
import Combine

struct BookingView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = BookingViewModel()
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  VStack(alignment: .leading, spacing: .zero) {
			 
			 makeHorating(
				horating: viewModel.bookingData?.horating ?? .zero,
				ratingName: viewModel.bookingData?.ratingName ?? .defString
			 )
			 
			 makeHotelName(name: viewModel.bookingData?.hotelName ?? .defString)
			 
			 makeHotelAdressTwo(adress: viewModel.bookingData?.hotelAdress ?? .defString)
			 
			 makeBookingData()
			 
			 makeBuyerInformation()
			 
			 makePhoneTextField()
			 
			 makeMailTextField()
			 
			 makeSendingCheck()
			 
			 makeTouristsInfo()
			 
			 makeBlockWithPrices(
				tourPrice: viewModel.bookingData?.tourPrice ?? .zero,
				fuelCharge: viewModel.bookingData?.fuelCharge ?? .zero,
				serviceCharge: viewModel.bookingData?.serviceCharge ?? .zero
			 )
			 
			 ButtonTransactionView(viewModel: viewModel.buttonTransaction) {
				viewModel.checkTouristsInfoAndNavigate()
			 }
			 .alert(Constants.alertText, isPresented: $viewModel.isShowErrorAlert) {
				Button(Constants.alertButton) { }
			 }
		  }
		  .padding(.horizontal, 16)
		  .navigationDestination(isPresented: $viewModel.isActiveTransactionLink) {
			 coordinator.build(page: .transaction)
		  }
	   }
	   .navigationBarTitleDisplayMode(.inline)
	   .navigationBarBackButtonHidden(true)
	   .toolbar  {
		  ToolbarItem(placement: .navigationBarLeading) {
			 BackButton(text: Constants.backButton)
		  }
	   }
    }
}

//MARK: - private extension BBookingView
private extension BookingView {
    
    func makeHorating(horating: Int, ratingName: String) -> some View {
	   ZStack {
		  RoundedRectangle(cornerRadius: 5)
			 .fill(Color(.paleYellow))
			 .frame(width: 149, height: 29)
		  HStack {
			 Image(Constants.ratingStar)
			 Text("\(horating) \(ratingName)")
				.foregroundColor(Color(.richYellow))
				.font(Font.custom(.baseFont, size: 16)
				    .weight(.medium))
		  }
	   }
	   .padding(.top, 24)
    }
    
    func makeHotelName(name: String) -> some View {
		  Text(name)
			 .font(Font.custom(.baseFont, size: 22)
				.weight(.medium))
			 .padding(.top, 8)
    }
    
    func makeHotelAdressTwo(adress: String)-> some View {
		  Button(action: {}) {
			 Text(adress)
				.font(Font.custom(.baseFont, size: 14)
				    .weight(.medium))
				.foregroundColor(Color(.deepBlue))
				.padding(.top, 8)
				.padding(.bottom, 40)
		  }
    }
    
    func bookingDataCell(title: String, value: String) -> some View {
	   HStack(alignment: .top, spacing: 40) {
		  Text(title)
			 .font(Font.custom(.baseFont, size: 16))
			 .foregroundColor(Color(.paleGray))
			 .fixedSize()
			 .frame(width: 110, alignment: .leading)
		  Text(value)
			 .font(Font.custom(.baseFont, size: 16))
	   }
	   .modifier(TwoColumnsViewModifier(size: 16, lineHeight: 120, weight: .regular))
    }
    
    func makeBuyerInformation() -> some View {
	   Text(Constants.buyerInformation)
		  .font(Font.custom(.baseFont, size: 22)
			 .weight(.medium))
		  .padding(.top, 40)
    }
    
    func makeSendingCheck() -> some View {
	   Text(Constants.sendingCheck)
		  .font(Font.custom(.baseFont, size: 14))
		  .foregroundColor(Color(.paleGray))
		  .padding(.top, 8)
		  .padding(.bottom, 40)
    }
    
    func makeBlockWithPrices(tourPrice: Int, fuelCharge: Int, serviceCharge: Int) -> some View {
	   VStack(spacing: 16) {
		  HStack {
			 Text(Constants.tour)
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(tourPrice) ₽")
		  }
		  HStack {
			 Text(Constants.fuelSurcharge)
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(fuelCharge) ₽")
		  }
		  HStack {
			 Text(Constants.serviceFee)
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(serviceCharge) ₽")
		  }
		  
		  HStack {
			 Text(Constants.toPay)
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(viewModel.totalAmount) ₽")
				.font(Font.custom(.baseFont, size: 16)
				    .weight(.medium))
				.foregroundColor(Color(.deepBlue))
		  }
	   }
	   .padding(.top, 24)
    }
    
    func makePhoneTextField() -> some View {
	   PhoneTextFieldView(viewModel: viewModel.phone)
		  .padding(.top, 20)
    }
    
    func makeMailTextField() -> some View {
	   BookingTextFieldView(viewModel: viewModel.mail) { (editing) in
		  viewModel.setupEditingMail(editing)
	   }
	   .padding(.top, 8)
    }
    
    func makeBookingData() -> some View {
	   VStack(alignment: .leading, spacing: 16) {
		  bookingDataCell(title: Constants.departure,
					   value: viewModel.bookingData?.departure ?? .defString)
		  bookingDataCell(title: Constants.countryCity,
					   value: viewModel.bookingData?.arrivalCountry ?? .defString)
		  bookingDataCell(title: Constants.dates,
					   value: "\(viewModel.bookingData?.tourDateStart ?? .defString) - \(viewModel.bookingData?.tourDateStop ?? "")")
		  bookingDataCell(title: Constants.numberOfNights,
					   value: "\(viewModel.bookingData?.numberOfNights ?? .zero) \(Constants.nights)")
		  bookingDataCell(title: Constants.hotel,
					   value: viewModel.bookingData?.hotelName ?? .defString)
		  bookingDataCell(title: Constants.room,
					   value: viewModel.bookingData?.room ?? .defString)
		  bookingDataCell(title: Constants.nutrition,
					   value: viewModel.bookingData?.nutrition ?? .defString)
	   }
	   .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func makeTouristsInfo() -> some View {
	   VStack {
		  ForEach(0 ..< viewModel.tourists.count, id: \.self) { index in
			 TouristCellView(viewModel: viewModel.toutistsCells[index])
		  }
		  if viewModel.tourists.count < 10 {
			 VStack {
				HStack {
				    Text(Constants.addTourist)
				    Spacer()
				    Button {
					   viewModel.toutistsCells.append(TouristCellViewModel(index: viewModel.tourists.count))
					   viewModel.tourists.append(Tourist.clearTourist)
				    } label: {
					   Image(Constants.addTouristImage)
						  .frame(width: 32, height: 32)
				    }
				}
				.font(Font.custom(.baseFont, size: 22)
				    .weight(.medium))
				.frame(maxWidth: .infinity, alignment: .leading)
			 }
		  }
	   }
    }
}

// MARK: - Constants

fileprivate extension BookingView {
    enum Constants {
	   
	   static let alertText = "Заполните все поля!"
	   static let alertButton = "Oк"
	   static let backButton = "Бронирование"
	   static let ratingStar = "ic-star"
	   static let buyerInformation = "Информация о покупателе"
	   static let sendingCheck = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
	   static let tour = "Тур"
	   static let fuelSurcharge = "Топливный сбор"
	   static let serviceFee = "Сервисный сбор"
	   static let toPay = "К оплате"
	   static let departure = "Вылет из"
	   static let countryCity = "Страна, город"
	   static let dates = "Даты"
	   static let numberOfNights = "Кол-во ночей"
	   static let hotel = "Отель"
	   static let room = "Номер"
	   static let nutrition = "Питание"
	   static let addTourist = "Добавить туриста"
	   static let addTouristImage = "ic-addTourist"
	   static let nights = "ночей"
	   
    }
}
