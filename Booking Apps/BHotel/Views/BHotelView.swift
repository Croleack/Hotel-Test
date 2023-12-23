//
//  BHotelView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct BHotelView: View {
    @ObservedObject var viewModel: BHotelViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  VStack(alignment: .leading, spacing: 0) {
			 
			 makeSliderView(imageUrls: viewModel.hotelData?.imageUrls ?? [])
			 
			 makeHotelRating(
				rating: viewModel.hotelData?.rating ?? 4,
				ratingName: viewModel.hotelData?.ratingName ?? ""
			 )
			 
			 makeHotelLabel(name: viewModel.hotelData?.name ?? "")
			 
			 makeHotelAddress(address: viewModel.hotelData?.address ?? "")
			 
			 
			 makeHotelPrice(priceHotel: viewModel.hotelData?.minimalPrice ?? 100000,
						 priceHotelForIt: viewModel.hotelData?.priceForIt.lowercased() ?? "")
			 
			 makeHotelInfo()
			 
			 makeHotelPeculiarities(viewModel.hotelData?.aboutTheHotel.peculiarities ?? [])
			 
			 makeHotelDescription(hotelDescription: viewModel.hotelData?.aboutTheHotel.description ?? "")
			 
			 createNonClickableButton(
				title: "Удобства",
				subtitle: "Самое необходимое",
				imageName: "ic-smiley"
			 )
			 .padding(.top, 31)
			 createNonClickableButton(
				title: "Что включено",
				subtitle: "Самое необходимое",
				imageName: "ic-checkmark"
			 )
			 .padding(.top, 20)
			 createNonClickableButton(
				title: "Что не включено",
				subtitle: "Самое необходимое",
				imageName: "ic-cross"
			 )
			 .padding(.top, 20)
			 
			 makeNumberSelection()
			 
		  }
		  .navigationTitle("Отель")
		  .navigationBarTitleDisplayMode(.inline)
		  .navigationBarBackButtonHidden(true)
		  .padding(.horizontal, 16)
	   }
    }
}

struct BHotelView_Previews: PreviewProvider {
    static var previews: some View {
	   BHotelView(viewModel: BHotelViewModel())
    }
}

//MARK: - private extension BHotelView

private extension BHotelView {
    
    func makeSliderView(imageUrls: [String]) -> AnyView {
	   AnyView(
		  BSliderView(imageUrls: imageUrls)
			 .padding(.top, 16)
	   )
    }
    
    func makeHotelRating(rating: Int, ratingName: String) -> some View {
	   ZStack {
		  RoundedRectangle(cornerRadius: 5)
			 .fill(Color("PaleYellow"))
			 .frame(width: 149, height: 29)
		  HStack {
			 Image("ic-star")
				.foregroundColor(Color("RichYellow"))
			 Text("\(rating) \(ratingName)")
				.foregroundColor(Color("RichYellow"))
				.font(Font.custom("SF Pro Display", size: 16)
				    .weight(.medium))
		  }
	   }
	   .padding(.top, 16)
    }
    
    func makeHotelLabel(name: String) -> AnyView {
	   AnyView(
		  Text(name)
			 .font(Font.custom("SF Pro Display", size: 22)
				.weight(.medium))
			 .padding(.top, 8)
	   )
    }
    
    func makeHotelAddress(address: String)-> AnyView {
	   AnyView(
		  Button(action: {}) {
			 Text(address)
				.font(Font.custom("SF Pro Display", size: 14)
				    .weight(.medium))
				.foregroundColor(Color("DeepBlue"))
		  }
			 .padding(.top, 8)
	   )
	   
    }
    
    func makeHotelPrice(priceHotel: Int, priceHotelForIt: String) -> some View {
	   HStack {
		  Text("от \(priceHotel) ₽")
			 .font(Font.custom("SF Pro Display", size: 30)
				.weight(.semibold))
		  Text(priceHotelForIt)
			 .font(.custom("SF Pro Display", size: CGFloat(16)))
			 .foregroundColor(Color("PaleGray"))
	   }
	   .padding(.top, 16)
    }
    
    func makeHotelInfo() -> some View {
	   Text("Об отеле")
		  .font(Font.custom("SF Pro Display", size: 22)
			 .weight(.medium))
		  .frame(maxWidth: .infinity, alignment: .leading)
		  .padding(.top, 40)
		  .padding(.bottom, 8)
    }
    
    func makeHotelPeculiarities(_ peculiarities: [String]) -> some View {
	   VStack(alignment: .leading) {
		  ForEach(peculiarities, id: \.self) { peculiarity in
			 Text(peculiarity)
				.font(Font.custom("SF Pro Display", size: 16)
				    .weight(.medium))
				.padding(.top, 8)
				.padding(.horizontal, 10)
				.foregroundColor(Color("PaleGray"))
		  }
	   }
    }
    
    func makeHotelDescription(hotelDescription: String) -> AnyView {
	   AnyView(
		  Text(hotelDescription)
			 .font(.custom("SF Pro Display",
						size: CGFloat(16)))
			 .padding(.top, 12)
			 .padding(.trailing, 16)
	   )
    }
    
    func createNonClickableButton(title: String, subtitle: String, imageName: String) -> some View {
	   HStack {
		  Image(imageName)
			 .frame(width: 20, height: 20)
		  
		  VStack(alignment: .leading) {
			 Text(title)
				.font(.custom("SF Pro Display",
						    size: CGFloat(16)))
			 Text(subtitle)
				.foregroundColor(Color("PaleGray"))
				.font(.custom("SF Pro Display",
						    size: CGFloat(14)))
		  }
		  
		  Spacer()
		  
		  Image("ic-rightArrow")
			 .foregroundColor(.black)
			 .frame(width: 6, height: 12)
	   }
	   .padding(.horizontal, 16)
    }
    
    func makeNumberSelection() -> AnyView {
	   AnyView (
		  NavigationLink(
			 destination: coordinator.build(
				page: .rooms(hotelName: "\(viewModel.hotelData?.name ?? "")"))) {
				    ZStack {
					   RoundedRectangle(cornerRadius: 15)
						  .frame(width: 343, height: 48)
						  .foregroundColor(Color("DeepBlue"))
					   Text("К выбору номера")
						  .font(.custom("SF Pro Display",
									 size: CGFloat(16)))
						  .foregroundColor(.white)
				    }
				    .padding(.top, 40)
				    .padding(.bottom, 28)
				}
	   )
    }
}
