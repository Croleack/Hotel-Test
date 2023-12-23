//
//  BRoomDetailView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct BRoomDetailView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    let rooms: [BRoom]?
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  VStack(alignment: .leading, spacing: 0) {
			 
			 ForEach(rooms ?? []) { room in
				makeSliderView(imageUrls: room.imageUrls)
				
				makeRoomLabel(room.name)
				
				makePeculiarities(room.peculiarities)
				
				makeDisabledButton()
				
				makePriceBlock(
				    price: room.price,
				    period: room.pricePer.lowercased()
				)
				
				makeRoomDetailButton()
			 }
		  }
		  .padding(.horizontal, 16)
	   }
	   .navigationBarTitleDisplayMode(.inline)
	   .navigationBarBackButtonHidden(true)
    }
}
    
    //MARK: - extension BRoomDetailView
    
private extension BRoomDetailView {
    
    func makeSliderView(imageUrls: [String]) -> AnyView {
	   AnyView(
		  BSliderView(imageUrls: imageUrls)
			 .padding(.top, 24)
	   )
    }
    
    func makeRoomLabel(_ name: String) -> AnyView {
	   AnyView(
		  Text(name)
			 .font(Font.custom("SF Pro Display", size: 22)
				.weight(.medium))
			 .padding(.top, 8)
	   )
    }
    
    func makePeculiarities(_ peculiarities: [String]) -> AnyView {
	   AnyView(
		  HStack {
			 ForEach(peculiarities, id: \.self) { peculiarity in
				Text(peculiarity)
				    .foregroundColor(Color("PaleGray"))
				    .font(Font.custom("SF Pro Display", size: 16)
					   .weight(.medium))
				    .padding(.top, 8)
				    .padding(.leading, 10)
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
			 .font(
				Font.custom("SF Pro Display", size: 16)
				    .weight(.medium))
			 .foregroundColor(Color("DeepBlue"))
			 .disabled(true)
			 .padding(.top, 16)
			 .padding(.leading, 10)
		  }
	   )
    }
    
    func makePriceBlock(price: Int, period: String) -> AnyView {
	   AnyView(
		  HStack {
			 Text("\(price)₽")
				.font(Font.custom("SF Pro Display", size: 30)
				    .weight(.semibold))
			 Text("\(period)")
				.foregroundColor(.secondary)
				.font(.custom("SF Pro Display", size: CGFloat(16)))
		  }
			 .padding(.top, 16)
	   )
    }
    
    func makeRoomDetailButton() -> AnyView {
	   AnyView(
		  NavigationLink(
			 destination: coordinator.build(page: .booking)) {
				ZStack {
				    RoundedRectangle(cornerRadius: 15)
					   .frame(width: 343, height: 48)
					   .foregroundColor(Color("DeepBlue"))
				    Text("Выбрать номер")
					   .font(.custom("SF Pro Display",
								  size: CGFloat(16))
						  .weight(.medium))
					   .foregroundColor(.white)
				}
				.padding(.bottom, 16)
				.padding(.top, 16)
			 }
	   )
    }
}







