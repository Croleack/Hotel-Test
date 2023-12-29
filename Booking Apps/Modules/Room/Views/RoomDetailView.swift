//
//  BRoomDetailView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct RoomDetailView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    let rooms: [Room]?
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  VStack(alignment: .leading) {
			 
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
	   }
	   .navigationBarTitleDisplayMode(.inline)
	   .navigationBarBackButtonHidden(true)
    }
}
    
    //MARK: - extension BRoomDetailView
    
private extension RoomDetailView {
    
    func makeSliderView(imageUrls: [String]) -> some View {
	   SliderView(imageUrls: imageUrls)
		  .padding(.init(
			 top: Constants.padTopSlider,
			 leading: Constants.padHorizontGeneral,
			 bottom: .zero,
			 trailing: Constants.padHorizontGeneral)
		  )
    }
    
    func makeRoomLabel(_ name: String) -> some View {
	   Text(name)
		  .font(Font.custom(.baseFont, size: Constants.fontRoomLabel)
			 .weight(.medium))
		  .padding(.init(
			 top: Constants.padTopRoomLabel,
			 leading: Constants.padHorizontGeneral,
			 bottom: .zero,
			 trailing: Constants.padHorizontGeneral)
		  )
    }
    
    func makePeculiarities(_ peculiarities: [String?]) -> some View {
	   VStack(alignment: .leading) {
		  
		  HStack {
			 if let firstPeculiarity = peculiarities[0] {
				Text(firstPeculiarity)
				    .padding(.init(
					   top: Constants.padTopPeculiarit,
					   leading: Constants.padLeadingPeculiarit,
					   bottom: .zero,
					   trailing: .zero)
				    )
			 }
			 if let secondPeculiarity = peculiarities[1] {
				Text(secondPeculiarity)
				    .padding(.init(
					   top: Constants.padTopPeculiarit,
					   leading: Constants.padLeadingPeculiaritSec,
					   bottom: .zero,
					   trailing: .zero)
				    )
			 }
		  }
		  HStack {
			 if let thirdPeculiarity = peculiarities[safe: 2] {
				Text(thirdPeculiarity ?? .defString)
			 }
		  }
		  .padding(.init(
			 top: Constants.padTopPeculiaritThird,
			 leading: Constants.padLeadingPeculiaritThird,
			 bottom: .zero,
			 trailing: .zero)
		  )
	   }
	   .font(Font.custom(.baseFont, size: Constants.fontPeculiarit)
		  .weight(.medium))
	   .foregroundColor(Color(.paleGray))
    }
    
    func makeDisabledButton() -> some View {
	   Button(action: {}) {
		  HStack(spacing: Constants.spacingDisabledBut) {
			 Text(Constants.disabledBut)

			 Image(Constants.DisabledButImage)
				.frame(width: Constants.frameDisabledButWidth,
					  height: Constants.frameDisabledButHeight)
		  }
		  .font(
			 Font.custom(.baseFont, size: Constants.fontDisabledBut)
				.weight(.medium))
		  .foregroundColor(Color(.deepBlue))
		  .disabled(true)
		  .padding(.leading, Constants.padLeadingDisabledBut)
	   }
    }
    
    func makePriceBlock(price: Int, period: String) -> some View {
	   HStack(alignment: .bottom, spacing: Constants.spacingPriceBlock) {
		  Text("\(price)₽")
			 .font(Font.custom(.baseFont, size: Constants.fontPriceBlockFirst)
				.weight(.semibold))
		  Text("\(period)")
			 .foregroundColor(Color(.paleGray))
			 .padding(.bottom, Constants.padBottomPriceBlockText)
			 .font(.custom(.baseFont, size: Constants.fontPriceBlockSec))
	   }
	   .padding(.top, Constants.padTopPriceBlock)
	   .padding(.leading, Constants.padHorizontGeneral)
    }

    
    func makeRoomDetailButton() -> some View {
	   NavigationLink(
		  destination: coordinator.build(page: .booking)) {
			 ZStack {
				RoundedRectangle(cornerRadius: Constants.corRadDetailBut)
				    .frame(width: Constants.frameRoomDetWidth,
						 height: Constants.frameRoomDetHeight)
				    .foregroundColor(Color(.deepBlue))
				Text(Constants.roomDetailBut)
				    .font(.custom(.baseFont,
							   size: Constants.fontRoomDet)
					   .weight(.medium))
				    .foregroundColor(.white)
			 }
			 .padding(.top, Constants.padTopRoomDet)
			 .padding(.horizontal, Constants.padHorizontGeneral)
		  }
    }
}

// MARK: - Constants

fileprivate extension RoomDetailView {
    enum Constants {
	   
	   static let disabledBut = "Подробнее о номере"
	   static let roomDetailBut = "Выбрать номер"
	   static let DisabledButImage = "ic-rightBlue"
	   
	   static let padHorizontGeneral = 16.0
	   static let padTopSlider = 40.0
	   static let padTopRoomLabel = 8.0
	   static let padTopPeculiarit = 13.0
	   static let padLeadingPeculiarit = 26.0
	   static let padLeadingPeculiaritSec = 18.0
	   static let padTopPeculiaritThird = 18.0
	   static let padLeadingPeculiaritThird = 26.0
	   static let padLeadingDisabledBut = 26.0
	   static let padBottomPriceBlockText = 3.0
	   static let padTopPriceBlock = 21.0
	   static let padTopRoomDet = 16.0
	   
	   static let corRadDetailBut = 15.0
	   
	   static let fontRoomLabel = 22.0
	   static let fontPeculiarit = 16.0
	   static let fontDisabledBut = 16.0
	   static let fontPriceBlockFirst = 30.0
	   static let fontPriceBlockSec = 16.0
	   static let fontRoomDet = 16.0
	   
	   static let frameDisabledButHeight = 12.0
	   static let frameDisabledButWidth = 6.0
	   static let frameRoomDetWidth = 343.0
	   static let frameRoomDetHeight = 48.0
	   
	   static let spacingDisabledBut = 12.0
	   static let spacingPriceBlock = 8.0
    }
}


