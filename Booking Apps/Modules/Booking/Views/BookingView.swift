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
			 .alert("Заполните все поля!", isPresented: $viewModel.isShowErrorAlert) {
				Button("ОК") { }
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
			 BackButton(text: "Бронирование")
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
			 Image("ic-star")
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
	   Text("Информация о покупателе")
		  .font(Font.custom(.baseFont, size: 22)
			 .weight(.medium))
		  .padding(.top, 40)
    }
    
    func makeSendingCheck() -> some View {
	   Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
		  .font(Font.custom(.baseFont, size: 14))
		  .foregroundColor(Color(.paleGray))
		  .padding(.top, 8)
		  .padding(.bottom, 40)
    }
    
    func makeBlockWithPrices(tourPrice: Int, fuelCharge: Int, serviceCharge: Int) -> some View {
	   VStack(spacing: 16) {
		  HStack {
			 Text("Тур")
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(tourPrice) ₽")
		  }
		  HStack {
			 Text("Топливный сбор")
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(fuelCharge) ₽")
		  }
		  HStack {
			 Text("Сервисный сбор")
				.font(Font.custom(.baseFont, size: 16))
				.foregroundColor(Color(.paleGray))
			 Spacer()
			 Text("\(serviceCharge) ₽")
		  }
		  
		  HStack {
			 Text("К оплате")
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
		  bookingDataCell(title: "Вылет из",
					   value: viewModel.bookingData?.departure ?? .defString)
		  bookingDataCell(title: "Страна, город",
					   value: viewModel.bookingData?.arrivalCountry ?? .defString)
		  bookingDataCell(title: "Даты",
					   value: "\(viewModel.bookingData?.tourDateStart ?? .defString) - \(viewModel.bookingData?.tourDateStop ?? "")")
		  bookingDataCell(title: "Кол-во ночей",
					   value: "\(viewModel.bookingData?.numberOfNights ?? .zero) ночей")
		  bookingDataCell(title: "Отель",
					   value: viewModel.bookingData?.hotelName ?? .defString)
		  bookingDataCell(title: "Номер",
					   value: viewModel.bookingData?.room ?? .defString)
		  bookingDataCell(title: "Питание",
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
				    Text("Добавить туриста")
				    Spacer()
				    Button {
					   viewModel.toutistsCells.append(TouristCellViewModel(index: viewModel.tourists.count))
					   viewModel.tourists.append(Tourist.clearTourist)
				    } label: {
					   Image("ic-addTourist")
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

