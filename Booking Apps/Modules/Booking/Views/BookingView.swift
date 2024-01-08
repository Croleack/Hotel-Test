//
//  BBookingView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//
import SwiftUI

struct BookingView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = BookingViewModel()
    @State private var isKeyboardVisible = false
    
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
				.padding(.bottom, Constants.padBottomBuyerInformation)
			 makePhoneTextField()
				.padding(.bottom, Constants.padBottomPhoneTextField)
			 
			 makeMailTextField()
			 
			 makeSendingCheck()
			 
			 makeTouristsInfo()
			 
			 makeBlockWithPrices()
			 
			 ButtonTransactionView(viewModel: viewModel.buttonTransaction) {
				viewModel.checkTouristsInfoAndNavigate()
				hideKeyboard()
			 }
			 .alert(Constants.alertText, isPresented: $viewModel.isShowErrorAlert) {
				Button(Constants.alertButton) { }
			 }
		  }
		  .padding(.horizontal, Constants.padHorizontGeneral)
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
		  RoundedRectangle(cornerRadius: Constants.corHorating)
			 .fill(Color(.paleYellow))
			 .frame(width: Constants.frameRectangleHoratingWidth,
				   height: Constants.frameRectangleHoratingHeight)
		  HStack(spacing: Constants.spacingHorating) {
			 Image(Constants.ratingStar)
				.foregroundColor(Color(.richYellow))
				.scaledToFit()
				.frame(width: Constants.frameImageHoratHeiWid,
					  height: Constants.frameImageHoratHeiWid)
			 Text("\(horating) \(ratingName)")
				.foregroundColor(Color(.richYellow))
				.font(Font.custom(.baseFont, size: Constants.fontHorating)
				    .weight(.medium))
		  }
	   }
	   .padding(.top, Constants.padTopHorating)
    }
    
    func makeHotelName(name: String) -> some View {
	   Text(name)
		  .font(Font.custom(.baseFont, size: Constants.fontHotelName)
			 .weight(.medium))
		  .padding(.top, Constants.padTopHotelName)
    }
    
    func makeHotelAdressTwo(adress: String)-> some View {
	   Button(action: {}) {
		  Text(adress)
			 .font(Font.custom(.baseFont, size: Constants.fontHotelAdress)
				.weight(.medium))
			 .foregroundColor(Color(.deepBlue))
			 .padding(.top, Constants.padTopHotelAdress)
			 .padding(.bottom, Constants.padBottomHotelAdress)
	   }
    }
    
    func bookingDataCell(title: String, value: String) -> some View {
	   HStack(alignment: .top, spacing: Constants.spacingBookingData) {
		  Text(title)
			 .font(Font.custom(.baseFont, size: Constants.fontBookingData))
			 .foregroundColor(Color(.paleGray))
			 .fixedSize()
			 .frame(width: Constants.frameBookingDataWidth, alignment: .leading)
		  Text(value)
			 .font(Font.custom(.baseFont, size: Constants.fontBookingData))
	   }
	   .modifier(TwoColumnsViewModifier(size: Constants.fontBookingData,
								 lineHeight: Constants.lineHeight,
								 weight: .regular))
    }
    
    func makeBuyerInformation() -> some View {
	   Text(Constants.buyerInformation)
		  .font(Font.custom(.baseFont, size: Constants.fontBuyerInformation)
			 .weight(.medium))
		  .padding(.top, Constants.padTopBuyerInformation)
    }
    
    func makeSendingCheck() -> some View {
	   Text(Constants.sendingCheck)
		  .font(Font.custom(.baseFont, size: Constants.fontSendingCheck))
		  .foregroundColor(Color(.paleGray))
		  .padding(.top, Constants.padTopSendingCheck)
		  .padding(.bottom, Constants.padBottomSendingCheck)
    }
    
    func makeBlockWithPrices() -> some View {
	   VStack(spacing: Constants.spacingBlockWith) {
		  HStack {
			 Text(Constants.tour)
				.font(Font.custom(.baseFont, size: Constants.fontBlockWithPrices))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(viewModel.tourPrice) \(.ruble)")
		  }
		  HStack {
			 Text(Constants.fuelSurcharge)
				.font(Font.custom(.baseFont, size: Constants.fontBlockWithPrices))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(viewModel.fuelCharge) \(.ruble)")
		  }
		  HStack {
			 Text(Constants.serviceFee)
				.font(Font.custom(.baseFont, size: Constants.fontBlockWithPrices))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(viewModel.serviceCharge) \(.ruble)")
		  }
		  
		  HStack {
			 Text(Constants.toPay)
				.font(Font.custom(.baseFont, size: Constants.fontBlockWithPrices))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(viewModel.totalAmount) \(.ruble)")
				.font(Font.custom(.baseFont, size: Constants.fontBlockWithPrices)
				    .weight(.medium))
				.foregroundColor(Color(.deepBlue))
		  }
	   }
	   .padding(.top, Constants.padTopBlockWithPrices)
    }
    
    func makePhoneTextField() -> some View {
	   PhoneTextFieldView(viewModel: viewModel.phone)
		  .cornerRadius(Constants.corTextField)
		  .onTapGesture {
			 UIApplication.shared.endEditing()
		  }
    }
    
    func makeMailTextField() -> some View {
	   BookingTextFieldView(viewModel: viewModel.mail) { (editing) in
		  viewModel.setupEditingMail(editing)
	   }
	   .cornerRadius(Constants.corTextField)
	   .onTapGesture {
		  UIApplication.shared.endEditing()
	   }
    }
    
    func makeBookingData() -> some View {
	   VStack(alignment: .leading, spacing: Constants.spacingBooking) {
		  bookingDataCell(title: Constants.departure,
					   value: viewModel.bookingData?.departure ?? .defString)
		  bookingDataCell(title: Constants.countryCity,
					   value: viewModel.bookingData?.arrivalCountry ?? .defString)
		  bookingDataCell(title: Constants.dates,
					   value: "\(viewModel.bookingData?.tourDateStart ?? .defString) - " +
					   "\(viewModel.bookingData?.tourDateStop ?? .defString)")
		  bookingDataCell(title: Constants.numberOfNights,
					   value: "\(viewModel.bookingData?.numberOfNights ?? .zero)" +
					   " \(Constants.nights)")
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
		  ForEach(.zero ..< viewModel.tourists.count, id: \.self) { index in
			 TouristCellView(viewModel: viewModel.touristsCells[index])
		  }
		  if viewModel.tourists.count < Constants.maximumTourists {
			 VStack {
				HStack {
				    Text(Constants.addTourist)
				    Spacer()
				    Button {
					   viewModel.touristsCells
						  .append(TouristCellViewModel(index: viewModel.tourists.count))
					   viewModel.tourists.append(Tourist.clearTourist)
					   viewModel.updateButtonTransactionTitle()
				    } label: {
					   Image(Constants.addTouristImage)
						  .frame(width: Constants.frameAddTouristImage,
							    height: Constants.frameAddTouristImage
						  )
				    }
				}
				.font(Font.custom(.baseFont, size: Constants.fontTouristsInfo)
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
	   static let sendingCheck = "Эти данные никому не передаются. После оплаты мы " +
	   "вышлем чек на указанный вами номер и почту"
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
	   
	   static let padHorizontGeneral = 16.0
	   static let padBottomBuyerInformation = 20.0
	   static let padBottomPhoneTextField = 8.0
	   static let padTopHorating = 24.0
	   static let padTopHotelName = 8.0
	   static let padTopHotelAdress = 8.0
	   static let padBottomHotelAdress = 24.0
	   static let padTopSendingCheck = 8.0
	   static let padBottomSendingCheck = 40.0
	   static let padTopBlockWithPrices = 24.0
	   static let padTopBuyerInformation = 24.0
	   
	   static let corHorating = 5.0
	   static let corTextField = 12.0
	   
	   static let fontHorating = 16.0
	   static let fontHotelName = 22.0
	   static let fontHotelAdress = 14.0
	   static let fontBookingData = 16.0
	   static let fontBuyerInformation = 22.0
	   static let fontSendingCheck = 14.0
	   static let fontBlockWithPrices = 16.0
	   static let fontTouristsInfo = 22.0
	   
	   static let frameRectangleHoratingHeight = 29.0
	   static let frameRectangleHoratingWidth = 149.0
	   static let frameImageHoratHeiWid = 15.0
	   static let frameBookingDataWidth = 110.0
	   static let frameAddTouristImage = 32.0
	   
	   static let spacingBookingData = 40.0
	   static let spacingBlockWith = 16.0
	   static let spacingBooking = 16.0
	   static let spacingHorating = 2.0
	   
	   static let lineHeight = 120.0
	   static let maximumTourists = 8
    }
}
