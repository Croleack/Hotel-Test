//
//  BRoomDetailView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct BRoomDetailView: View {
    let rooms: [BRoom]?
    @EnvironmentObject var coordinator: BCoordinator
    
    var body: some View {
	   ScrollView {
		  VStack {
			 ScrollView(.vertical) {
				
				VStack(alignment: .leading, spacing: 12) {
				    ForEach(rooms ?? []) { room in
					   makeSliderView(imageUrls: room.image_urls)
					   
					   makeRoomLabel(room.name)
					   
					   makePeculiarities(room.peculiarities)
					   
					   makeDisabledButton()
					   
					   makePriceBlock(price: room.price, period: room.price_per.lowercased())
					   
					   makeRoomDetailButton()
				    }
				}
			 }.navigationTitle("Детали номера")
		  }.padding(.leading, 14)
		  
	   }
    }
    
    
    //MARK: - funcs
    
    func makeSliderView(imageUrls: [String]) -> AnyView {
	   AnyView(
		  BSliderView(imageUrls: imageUrls)
			 .frame(minHeight: 240, maxHeight: 400)
			 .cornerRadius(32)
	   )
    }
    
    func makeRoomLabel(_ name: String) -> AnyView {
	   AnyView(
		  Text(name)
			 .font(.title)
	   )
    }
    
    func makePeculiarities(_ peculiarities: [String]) -> AnyView {
	   AnyView(
		  HStack {
			 ForEach(peculiarities, id: \.self) { peculiarity in
				Text(peculiarity)
				    .padding(.leading)
				    .foregroundColor(Color("PaleGray"))
			 }
		  }
	   )
    }
    
    func makeDisabledButton() -> AnyView {
	   AnyView(
		  Button(action: {}) {
			 HStack {
				Text("Подробнее о номере")
				Image(systemName: "chevron.right")
				    .font(.subheadline)
				    .foregroundColor(Color.blue)
				    .disabled(true)
			 }
		  }
	   )
    }
    
    func makePriceBlock(price: Int, period: String) -> AnyView {
	   AnyView(
		  HStack {
			 Text("\(price)₽")
				.font(.title)
				.fontWeight(.bold)
			 Text("\(period)")
				.font(.footnote)
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
				    .font(.headline)
				    .foregroundColor(.white)
				    .frame(maxWidth: .infinity)
				    .frame(height: 50)
				    .background(Color.blue)
				    .cornerRadius(8)
			 }
		  )
	   )
    }
}








