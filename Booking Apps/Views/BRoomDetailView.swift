//
//  BRoomDetailView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct BRoomDetailView: View {
    let rooms: [BRoom]?
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  ZStack {
			 Rectangle()
				.foregroundColor(.white)
			 
			 VStack(alignment: .leading) {
				ForEach(rooms ?? []) { room in
				    makeSliderView(imageUrls: room.imageUrls)
				    
				    makeRoomLabel(room.name)
					   .padding(.top, 8)
				    
				    makePeculiarities(room.peculiarities)
					   .padding(.top, 13)
				    
				    makeDisabledButton()
					   .padding(.top, 8)
				    
				    makePriceBlock(price: room.price, period: room.pricePer.lowercased())
					   .padding(.top, 16)
				    
				    makeRoomDetailButton()
					   .padding(.top, 16)
				}
			 }
		  }
		  .padding(.top, 8)
		  .padding(.horizontal, 16)
	   }
	   .navigationTitle("Номер")
	   .navigationBarTitleDisplayMode(.inline)
    }
    
    
    //MARK: - Functions
    
    func makeSliderView(imageUrls: [String]) -> AnyView {
	   AnyView(
		  BSliderView(imageUrls: imageUrls)
	   )
    }
    
    func makeRoomLabel(_ name: String) -> AnyView {
	   AnyView(
		  Text(name)
			 .font(.titleCustom)
	   )
    }
    
    func makePeculiarities(_ peculiarities: [String]) -> AnyView {
	   AnyView(
		  HStack {
			 ForEach(peculiarities, id: \.self) { peculiarity in
				Text(peculiarity)
				    .foregroundColor(Color("PaleGray"))
				    .font(.bodyCustom)
			 }
		  }
	   )
    }
    
    func makeDisabledButton() -> AnyView {
	   AnyView(
		  Button(action: {}) {
			 HStack(spacing: 12) {
				Text("Подробнее о номере")
				Image("ic-rightBlue")
				    .frame(width: 6, height: 12)
			 }
			 .font(.bodyCustom)
			 .foregroundColor(Color("DeepBlue"))
			 .disabled(true)
		  }
	   )
    }
    
    func makePriceBlock(price: Int, period: String) -> AnyView {
	   AnyView(
		  HStack {
			 Text("\(price)₽")
				.font(.largeTitleCustom)
				.fontWeight(.bold)
			 Text("\(period)")
				.font(.bodyCustom)
				.foregroundColor(Color("PaleGray"))
		  }
	   )
    }
    
    func makeRoomDetailButton() -> AnyView {
	   AnyView(
		  NavigationLink(
			 destination: BBookingView(viewModel: BBookingViewModel()),
			 label: {
				Text("Выбрать номер")
				    .font(.semiboldBodyCustom)
				    .foregroundColor(.white)
				    .frame(maxWidth: 500)
				    .frame(height: 48)
				    .background(Color.blue)
				    .cornerRadius(15)
			 }
		  )
	   )
    }
}








