//
//  BBookingView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//
import SwiftUI
import Combine

struct BBookingView: View {
    @ObservedObject var viewModel: BBookingViewModel
    @EnvironmentObject var coordinator: BCoordinator
    
    
    var body: some View {
	   ScrollView(.vertical) {
		  VStack(alignment: .leading, spacing: 10) {
			 
			 makeHorating(horating: viewModel.bookingData?.horating ?? 0, ratingName: viewModel.bookingData?.ratingName ?? "")
			 
			 makeHotelName(name: viewModel.bookingData?.hotelName ?? "")
			 
			 makeHotelAddressTwo(address: viewModel.bookingData?.hotelAdress ?? "")
			 
			 VStack(alignment: .leading, spacing: 8) {
				makeLabelWithValue(label: "Вылет из", value: viewModel.bookingData?.departure, trailingPadding: 50)
				makeLabelWithValue(label: "Страна, город", value: viewModel.bookingData?.arrivalCountry, trailingPadding: 9)
				makeLabelWithValue(label: "Даты", value: "\(viewModel.bookingData?.tourDateStart ?? "") - \(viewModel.bookingData?.tourDateStop ?? "")", trailingPadding: 79)
				makeLabelWithValue(label: "Кол-во ночей", value: "\(viewModel.bookingData?.numberOfNights ?? 0) ночей", trailingPadding: 15)
				makeLabelWithValue(label: "Отель", value: viewModel.bookingData?.hotelName, trailingPadding: 74)
				makeLabelWithValue(label: "Номер", value: viewModel.bookingData?.room, trailingPadding: 66)
				makeLabelWithValue(label: "Питание", value: viewModel.bookingData?.nutrition, trailingPadding: 51)
			 }
			 
			 
			 makeBuyerInformation()
			 
			 //In this view, we create validation of mail and phone data.
			 BValidationBlock()
			 
			 //block in which we add new tourists
			 VStack(alignment: .leading) {
				ForEach(0..<viewModel.tourists.count, id: \.self) { index in
				    TouristTabView(tourist: $viewModel.tourists[index])
				}
				Button(action: {
				    viewModel.tourists.append(Tourist())
				}) {
				    HStack {
					   Text("Добавить туриста")
					   Spacer()
					   Image(systemName: "chevron.down")
				    }
				}
				.padding()
			 }
			 BTouristInfoView(viewModel: viewModel)
			 
		  }.padding(.leading, 14)
	   }.navigationBarTitle(Text("Бронирование"))
	   
    }
    
}

//MARK: - funcs

func makeHorating(horating: Int, ratingName: String) -> some View {
    ZStack {
	   RoundedRectangle(cornerRadius: 8)
		  .fill(Color("PaleYellow"))
		  .frame(width: 200, height: 25)
	   HStack {
		  Image(systemName: "star.fill")
			 .foregroundColor(Color("RichYellow"))
		  
		  Text("\(horating) \(ratingName)")
			 .foregroundColor(Color("RichYellow"))
	   }
    }
}

func makeHotelName(name: String) -> AnyView {
    AnyView(
	   Text(name)
		  .font(.title)
		  .fontWeight(.bold)
    )
}

func makeHotelAddressTwo(address: String)-> AnyView {
    AnyView(
	   Button(action: {}) {
		  Text(address)
			 .font(.subheadline)
			 .foregroundColor(Color.blue)
	   }
		  .frame(alignment: .leading)
    )
}


func makeLabelWithValue(label: String, value: String?, trailingPadding: CGFloat) -> some View {
    HStack {
	   Text(label)
		  .foregroundColor(Color("PaleGray"))
		  .padding(.trailing, trailingPadding) 
	   Text(value ?? "")
    }
}

func makeBuyerInformation() -> some View {
    Text("Информация о покупателе")
	   .font(.title)
}

struct BBookingView_Previews: PreviewProvider {
    static var previews: some View {
	   let viewModel = BBookingViewModel()
	   BBookingView(viewModel: viewModel)
    }
}
