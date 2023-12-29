//
//  BHotelView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct HotelView: View {
    @ObservedObject var viewModel: HotelViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  VStack(alignment: .leading) {
			 
			 makeSliderView(imageUrls: viewModel.hotelData?.imageUrls ?? [])
			 
			 makeHotelRating(
				rating: viewModel.hotelData?.rating ?? .zero,
				ratingName: viewModel.hotelData?.ratingName ?? .defString
			 )
			 
			 makeHotelLabel(name: viewModel.hotelData?.name ?? .defString)
			 
			 makeHotelAdress(adress: viewModel.hotelData?.adress ?? .defString)
			 
			 
			 makeHotelPrice(priceHotel: viewModel.hotelData?.minimalPrice ?? .zero,
						 priceHotelForIt: viewModel.hotelData?.priceForIt.lowercased() ?? .defString)
			 
			 makeHotelInfo()
			 
			 makeHotelPeculiarities()
			 
			 makeHotelDescription(hotelDescription: viewModel.hotelData?.aboutTheHotel.description ?? .defString)
			 
			 createNonClickableButton(
				title: Constants.firstUnclickableTitle,
				subtitle: Constants.firstUnclickableSubtitle,
				imageName: Constants.firstUnclickableImage
			 )
			 .padding(.top, Constants.padTopFirstNonClick)
			 createNonClickableButton(
				title: Constants.secondUnclickableTitle,
				subtitle: Constants.firstUnclickableSubtitle,
				imageName: Constants.secondUnclickableImage
			 )
			 .padding(.top, Constants.padTopSecondNonClick)
			 createNonClickableButton(
				title: Constants.thirdUnclickableTitle,
				subtitle: Constants.firstUnclickableSubtitle,
				imageName: Constants.thirdUnclickableImage
			 )
			 .padding(.top, Constants.padTopSecondNonClick)
			 
			 makeNumberSelection()
			 
		  }
		  .navigationTitle(Constants.navText)
		  .navigationBarTitleDisplayMode(.inline)
		  .navigationBarBackButtonHidden(true)
		  
	   }
    }
}

//MARK: - private extension BHotelView

private extension HotelView {
    
    func makeSliderView(imageUrls: [String]) -> some View {
	   SliderView(imageUrls: imageUrls)
		  .padding(.horizontal, Constants.padHorizontGeneral)
		  .padding(.top, Constants.padTopSlider)
    }
    
    func makeHotelRating(rating: Int, ratingName: String) -> some View {
	   ZStack {
		  
		  RoundedRectangle(cornerRadius: Constants.corRadHotelRating)
			 .fill(Color(.paleYellow))
			 .frame(width: Constants.frameHotelRatRectangleWidth,
				   height: Constants.frameHotelRatRectangleHeight)
		  
		  HStack {
			 Image(Constants.starImage)
				.foregroundColor(Color(.richYellow))
			 Text("\(rating) \(ratingName)")
				.foregroundColor(Color(.richYellow))
				.font(Font.custom(.baseFont, size: Constants.fontHotelRat)
				    .weight(.medium))
		  }
	   }
	   .padding(.init(
		  top: Constants.padTopRating,
		  leading: Constants.padHorizontGeneral,
		  bottom: .zero,
		  trailing: .zero)
	   )
    }
    
    func makeHotelLabel(name: String) -> some View {
	   Text(name)
		  .font(Font.custom(.baseFont, size: Constants.fontHotelLab)
			 .weight(.medium))
		  .padding(.init(
			 top: Constants.padTopHotelLabel,
			 leading: Constants.padHorizontGeneral,
			 bottom: .zero,
			 trailing: Constants.padTrailingHotelLabel)
		  )
    }
    
    func makeHotelAdress(adress: String)-> some View {
	   Button(action: {}) {
		  Text(adress)
			 .font(Font.custom(.baseFont, size: Constants.fontHotelAdr)
				.weight(.medium))
			 .foregroundColor(Color(.deepBlue))
	   }
	   .padding(.init(
		  top: Constants.padTopHotelAdress,
		  leading: Constants.padHorizontGeneral,
		  bottom: .zero,
		  trailing: Constants.padHorizontGeneral)
	   )
    }
    
    func makeHotelPrice(priceHotel: Int, priceHotelForIt: String) -> some View {
	   HStack(alignment: .bottom, spacing: Constants.spacingHotelPrice) {
		  Text("от \(priceHotel) ₽")
			 .font(Font.custom(.baseFont, size: Constants.fontHotelPriceFir)
				.weight(.semibold))
		  Text(priceHotelForIt)
			 .font(.custom(.baseFont, size: Constants.fontHotelPriceSec))
			 .foregroundColor(Color(.paleGray))
			 .padding(.bottom, Constants.padBottomPriceHotel)
	   }
	   .padding(.top, Constants.padTopHotelPrice)
	   .padding(.leading, Constants.padHorizontGeneral)
    }
    
    func makeHotelInfo() -> some View {
	   VStack{
		  Text(Constants.aboutHotel)
			 .font(Font.custom(.baseFont, size: Constants.fontHotelInfo)
				.weight(.medium))
			 .frame(maxWidth: .infinity, alignment: .leading)
			 .padding(.top, Constants.padTopHotelInfo)
			 .padding(.leading, Constants.padLeadingHotelInfo)
			 .padding(.bottom, Constants.padBottomHotelInfo)
	   }
    }
    
    func makeHotelPeculiarities() -> some View {
	   VStack(alignment: .leading) {
		  
		  HStack {
			 Text("\(viewModel.hotelData?.aboutTheHotel.peculiarities[0] ?? .defString)")
		  }
		  .padding(.init(
			 top: Constants.padTopFirstPecul,
			 leading: Constants.padLeadingFirstPecul,
			 bottom: .zero,
			 trailing: .zero)
		  )
		  HStack {
			 Text("\(viewModel.hotelData?.aboutTheHotel.peculiarities[1] ?? .defString)")
				.padding(.init(
				    top: Constants.padTopSecondPecul,
				    leading: Constants.padLeadingFirstPecul,
				    bottom: .zero,
				    trailing: .zero)
				)
			 Text("\(viewModel.hotelData?.aboutTheHotel.peculiarities[2] ?? .defString)")
				.padding(.init(
				    top: Constants.padTopSecondPecul,
				    leading: Constants.padLeadingThirdPecul,
				    bottom: .zero,
				    trailing: .zero)
				)
		  }
		  HStack {
			 Text("\(viewModel.hotelData?.aboutTheHotel.peculiarities[3] ?? .defString)")
				.padding(.init(
				    top: Constants.padTopSecondPecul,
				    leading: Constants.padLeadingFirstPecul,
				    bottom: .zero,
				    trailing: .zero)
				)
		  }
	   }
	   .font(Font.custom(.baseFont, size: Constants.fontPeculiarities)
		  .weight(.medium))
	   .foregroundColor(Color(.paleGray))
    }
    
    func makeHotelDescription(hotelDescription: String) -> some View {
	   Text(hotelDescription)
		  .font(.custom(.baseFont,
					 size: Constants.fontDescription))
		  .padding(.top, Constants.padTopHotelDesc)
		  .padding(.horizontal, Constants.padHorizontGeneral)
    }
    
    func createNonClickableButton(title: String,
						    subtitle: String,
						    imageName: String) -> some View {
	   HStack {
		  Image(imageName)
			 .frame(width: Constants.frameNonClickImageSecHeightWid,
				   height: Constants.frameNonClickImageSecHeightWid)
		  
		  VStack(alignment: .leading) {
			 Text(title)
				.font(.custom(.baseFont,
						    size: Constants.fontNonClickFirst))
				.padding(.bottom, Constants.padBottomClickableBut)
			 Text(subtitle)
				.foregroundColor(Color(.paleGray))
				.font(.custom(.baseFont,
						    size: Constants.fontNonClickSec))
		  }
		  .padding(.leading, Constants.padLeadingClickableButText)
		  
		  Image(Constants.rightArrowImage)
			 .foregroundColor(.black)
			 .frame(width: Constants.frameNonClickImageFirstWidth,
				   height: Constants.frameNonClickImageFirstHeight)
			 .padding(.leading, Constants.padLeadingClickableButImage)
		  
	   }
	   .padding(.leading, Constants.padLeadingClickableButGeneral)
    }
    
    func makeNumberSelection() -> some View {
	   NavigationLink(
		  destination: coordinator.build(
			 page: .rooms(hotelName: "\(viewModel.hotelData?.name ?? .defString)"))) {
				ZStack {
				    RoundedRectangle(cornerRadius: Constants.corRadNumberSel)
					   .frame(width: Constants.frameNumberSelRectangleWidth,
							height: Constants.frameNumberSelRectangleHeight)
					   .foregroundColor(Color(.deepBlue))
				    Text(Constants.chooseRoom)
					   .font(.custom(.baseFont,
								  size: Constants.fontNumSel))
					   .foregroundColor(.white)
				}
				.padding(.init(
				    top: Constants.padTopNumberSel,
				    leading:Constants.padHorizontGeneral,
				    bottom: Constants.padBottomNumberSel,
				    trailing: Constants.padHorizontGeneral))
			 }
    }
}

// MARK: - Constants

fileprivate extension HotelView {
    enum Constants {
	   static let firstUnclickableTitle = "Удобства"
	   static let secondUnclickableTitle = "Что включено"
	   static let thirdUnclickableTitle = "Что не включено"
	   static let firstUnclickableSubtitle = "Самое необходимое"
	   static let firstUnclickableImage = "ic-smiley"
	   static let secondUnclickableImage = "ic-checkmark"
	   static let thirdUnclickableImage = "ic-cross"
	   static let navText = "Отель"
	   static let starImage = "ic-star"
	   static let aboutHotel = "Об отеле"
	   static let rightArrowImage = "ic-rightArrow"
	   static let chooseRoom = "К выбору номера"
	   
	   static let padTopFirstNonClick = 31.0
	   static let padTopSecondNonClick = 20.0
	   static let padHorizontGeneral = 16.0
	   static let padTopSlider = 16.0
	   static let padTopRating = 16.0
	   static let padTopHotelLabel = 8.0
	   static let padTrailingHotelLabel = 16.0
	   static let padTopHotelAdress = 8.0
	   static let padBottomPriceHotel = 3.0
	   static let padTopHotelInfo = 40.0
	   static let padLeadingHotelInfo = 16.0
	   static let padBottomHotelInfo = 5.0
	   static let padTopFirstPecul = 21.0
	   static let padLeadingFirstPecul = 26.0
	   static let padTopSecondPecul = 18.0
	   static let padLeadingThirdPecul = 28.0
	   static let padTopHotelDesc = 17.0
	   static let padBottomClickableBut = 2.0
	   static let padLeadingClickableButImage = 120.0
	   static let padLeadingClickableButGeneral = 33.0
	   static let padTopNumberSel = 55.0
	   static let padBottomNumberSel = 28.0
	   static let padTopHotelPrice = 16.0
	   static let padLeadingClickableButText = 14.0
	   
	   static let corRadHotelRating = 5.0
	   static let corRadNumberSel = 15.0
	   
	   static let fontHotelRat = 16.0
	   static let fontHotelLab = 22.0
	   static let fontHotelAdr = 14.0
	   static let fontHotelPriceFir = 30.0
	   static let fontHotelPriceSec = 16.0
	   static let fontHotelInfo = 22.0
	   static let fontPeculiarities = 16.0
	   static let fontDescription = 16.0
	   static let fontNonClickFirst = 16.0
	   static let fontNonClickSec = 14.0
	   static let fontNumSel = 16.0
	   
	   static let frameHotelRatRectangleWidth = 149.0
	   static let frameHotelRatRectangleHeight = 29.0
	   static let frameNonClickImageFirstHeight = 12.0
	   static let frameNonClickImageFirstWidth = 6.0
	   static let frameNonClickImageSecHeightWid = 20.0
	   static let frameNumberSelRectangleWidth = 343.0
	   static let frameNumberSelRectangleHeight = 48.0
	   
	   static let spacingHotelPrice = 8.0
    }
}
