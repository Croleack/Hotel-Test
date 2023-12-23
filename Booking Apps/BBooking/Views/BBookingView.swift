//
//  BBookingView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//
import SwiftUI
import Combine

struct BBookingView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = BBookingViewModel()
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  VStack(alignment: .leading, spacing: 0) {
			 
			 makeHorating(
				horating: viewModel.bookingData?.horating ?? 4,
				ratingName: viewModel.bookingData?.ratingName ?? ""
			 )
			 
			 makeHotelName(name: viewModel.bookingData?.hotelName ?? "")
			 
			 makeHotelAddressTwo(address: viewModel.bookingData?.hotelAdress ?? "")
			 
			 makeBookingData()
			 
			 makeBuyerInformation()
			 
			 makePhoneTextField()
			 
			 makeMailTextField()
			 
			 makeSendingCheck()
			 
			 makeTouristsInfo()
			 
			 makeBlockWithPrices(
				tourPrice: viewModel.bookingData?.tourPrice ?? 100000,
				fuelCharge: viewModel.bookingData?.fuelCharge ?? 100000,
				serviceCharge: viewModel.bookingData?.serviceCharge ?? 100000
			 )
			 
			 BButtonTransactionView(viewModel: viewModel.buttonTransaction) {
				viewModel.checkTouristsInfoAndNavigate()
			 }
			 .background(
				NavigationLink(
				    destination: coordinator.build(page: .transaction),
				    isActive: $viewModel.isActiveTransactionLink) {
					   EmptyView()
				    }
			 )
			 .alert("Заполните все поля!", isPresented: $viewModel.isShowErrorAlert) {
				Button("ОК") { }
			 }
		  }
		  .padding(.horizontal, 16)
	   }
	   .navigationBarTitleDisplayMode(.inline)
	   .navigationBarBackButtonHidden(true)
	   .toolbar  {
		  ToolbarItem(placement: .navigationBarLeading) {
			 BBackButton(text: "Бронирование")
		  }
	   }
    }
}

//MARK: - private extension BBookingView
private extension BBookingView {
    
    func makeHorating(horating: Int, ratingName: String) -> some View {
	   ZStack {
		  RoundedRectangle(cornerRadius: 5)
			 .fill(Color("PaleYellow"))
			 .frame(width: 149, height: 29)
		  HStack {
			 Image("ic-star")
			 Text("\(horating) \(ratingName)")
				.foregroundColor(Color("RichYellow"))
				.font(Font.custom("SF Pro Display", size: 16)
				    .weight(.medium))
		  }
	   }
	   .padding(.top, 24)
    }
    
    func makeHotelName(name: String) -> AnyView {
	   AnyView(
		  Text(name)
			 .font(Font.custom("SF Pro Display", size: 22)
				.weight(.medium))
			 .padding(.top, 8)
	   )
    }
    
    func makeHotelAddressTwo(address: String)-> AnyView {
	   AnyView(
		  Button(action: {}) {
			 Text(address)
				.font(Font.custom("SF Pro Display", size: 14)
				    .weight(.medium))
				.foregroundColor(Color("DeepBlue"))
				.padding(.top, 8)
				.padding(.bottom, 40)
		  }
	   )
    }
    
    func bookingDataCell(title: String, value: String) -> some View {
	   HStack(alignment: .top, spacing: 40) {
		  Text(title)
			 .font(Font.custom("SF Pro Display", size: 16))
			 .foregroundColor(Color("PaleGray"))
			 .fixedSize()
			 .frame(width: 110, alignment: .leading)
		  Text(value)
			 .font(Font.custom("SF Pro Display", size: 16))
	   }
	   .modifier(BTwoColumnsViewModifier(size: 16, lineHeight: 120, weight: .regular))
    }
    
    func makeBuyerInformation() -> some View {
	   Text("Информация о покупателе")
		  .font(Font.custom("SF Pro Display", size: 22)
			 .weight(.medium))
		  .padding(.top, 40)
    }
    
    func makeSendingCheck() -> some View {
	   Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
		  .font(Font.custom("SF Pro Display", size: 14))
		  .foregroundColor(Color("PaleGray"))
		  .padding(.top, 18)
		  .padding(.bottom, 40)
    }
    
    func makeBlockWithPrices(tourPrice: Int, fuelCharge: Int, serviceCharge: Int) -> some View {
	   VStack(spacing: 16) {
		  HStack {
			 Text("Тур")
				.font(Font.custom("SF Pro Display", size: 16))
				.foregroundColor(Color("PaleGray"))
			 Spacer()
			 Text("\(tourPrice) ₽")
		  }
		  HStack {
			 Text("Топливный сбор")
				.font(Font.custom("SF Pro Display", size: 16))
				.foregroundColor(Color("PaleGray"))
			 Spacer()
			 Text("\(fuelCharge) ₽")
		  }
		  HStack {
			 Text("Сервисный сбор")
				.font(Font.custom("SF Pro Display", size: 16))
				.foregroundColor(Color("PaleGray"))
			 Spacer()
			 Text("\(serviceCharge) ₽")
		  }
		  
		  HStack {
			 Text("К оплате")
				.font(Font.custom("SF Pro Display", size: 16))
				.foregroundColor(Color("PaleGray"))
			 Spacer()
			 Text("\(viewModel.totalAmount) ₽")
				.font(Font.custom("SF Pro Display", size: 16)
				    .weight(.medium))
				.foregroundColor(Color("DeepBlue"))
		  }
	   }
	   .padding(.top, 24)
    }
    
    func makePhoneTextField() -> some View {
	   BPhoneTextFieldView(viewModel: viewModel.phone)
		  .padding(.top, 44)
    }
    
    func makeMailTextField() -> some View {
	   BBookingTextFieldView(viewModel: viewModel.mail) { (editing) in
		  viewModel.setupEditingMail(editing)
	   }
	   .padding(.top, 24)
    }
    
    func makeBookingData() -> some View {
	   VStack(alignment: .leading, spacing: 16) {
		  bookingDataCell(title: "Вылет из",
					   value: viewModel.bookingData?.departure ?? "chik")
		  bookingDataCell(title: "Страна, город",
					   value: viewModel.bookingData?.arrivalCountry ?? "chirik")
		  bookingDataCell(title: "Даты",
					   value: "\(viewModel.bookingData?.tourDateStart ?? "") - \(viewModel.bookingData?.tourDateStop ?? "")")
		  bookingDataCell(title: "Кол-во ночей",
					   value: "\(viewModel.bookingData?.numberOfNights ?? 32) ночей")
		  bookingDataCell(title: "Отель",
					   value: viewModel.bookingData?.hotelName ?? "dsd")
		  bookingDataCell(title: "Номер",
					   value: viewModel.bookingData?.room ?? "ew")
		  bookingDataCell(title: "Питание",
					   value: viewModel.bookingData?.nutrition ?? "ds")
	   }
	   .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func makeTouristsInfo() -> some View {
	   VStack {
		  ForEach(0 ..< viewModel.tourists.count, id: \.self) { index in
			 BTouristCellView(viewModel: viewModel.toutistsCells[index])
		  }
		  if viewModel.tourists.count < 10 {
			 VStack {
				HStack {
				    Text("Добавить туриста")
				    Spacer()
				    Button {
					   viewModel.toutistsCells.append(BTouristCellViewModel(index: viewModel.tourists.count))
					   viewModel.tourists.append(BTourist.clearTourist)
				    } label: {
					   Image("ic-addTourist")
						  .frame(width: 32, height: 32)
				    }
				}
				.font(Font.custom("SF Pro Display", size: 22)
				    .weight(.medium))
				.frame(maxWidth: .infinity, alignment: .leading)
			 }
		  }
	   }
    }
}

struct BBookingView_Previews: PreviewProvider {
    static var previews: some View {
	   let viewModel = BBookingViewModel()
	   BBookingView(viewModel: viewModel)
    }
}
