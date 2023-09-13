//
//  BHotelView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct BHotelView: View {
    @ObservedObject var viewModel: BHotelViewModel
    @EnvironmentObject var coordinator: BCoordinator
    
    var body: some View {
	   ScrollView(.vertical) {
		  VStack(alignment: .leading, spacing: 8) {
			 
			 makeSliderView(imageUrls: viewModel.hotelData?.image_urls ?? [])
			 
			 makeHotelRating(rating: viewModel.hotelData?.rating ?? 0, ratingName: viewModel.hotelData?.rating_name ?? "")
			 
			 makeHotelLabel(name: viewModel.hotelData?.name ?? "")
			 Spacer()
			 makeHotelAddress(address: viewModel.hotelData?.adress ?? "")
			 Spacer()
			 makeHotelPrice(priceHotel: viewModel.hotelData?.minimal_price ?? 100000,
						 priceHotelForIt: viewModel.hotelData?.price_for_it.lowercased() ?? "")
			 VStack() {
				makeHotelInfo()
				
				makeHotelPeculiarities(viewModel.hotelData?.about_the_hotel.peculiarities ?? [])
				
				makeHotelDescription(hotelDescriptione: viewModel.hotelData?.about_the_hotel.description ?? "")
				
				createNonClickableButton(title: "Удобства", subtitle: "Самое необходимое", imageName: "face.smiling")
				createNonClickableButton(title: "Что включено", subtitle: "Самое необходимое", imageName: "checkmark.square")
				createNonClickableButton(title: "Что не включено", subtitle: "Самое необходимое", imageName: "multiply.square")
				
			 }
			 
			 NavigationLink(
				destination: BNumberView(viewModel: BNumberViewModel()),
				label: {
				    Text("К выбору номера")
					   .font(.headline)
					   .foregroundColor(.white)
					   .frame(maxWidth: .infinity)
					   .frame(height: 50)
					   .background(Color.blue)
					   .cornerRadius(8)
				}
			 )
		  }
	   } .padding()
		  .navigationBarTitle(Text("Отель"))
    }
}


struct BHotelView_Previews: PreviewProvider {
    static var previews: some View {
	   BHotelView(viewModel: BHotelViewModel())
    }
}

//MARK: - Funcs

func makeSliderView(imageUrls: [String]) -> AnyView {
    AnyView(
	   BSliderView(imageUrls: imageUrls)
		  .frame(minHeight: 240, maxHeight: 400)
    )
}

func makeHotelRating(rating: Int, ratingName: String) -> some View {
    ZStack {
	   RoundedRectangle(cornerRadius: 8)
		  .fill(Color("PaleYellow"))
		  .frame(width: 200, height: 25)
	   HStack {
		  Image(systemName: "star.fill")
			 .foregroundColor(Color("RichYellow"))
		  Text("\(rating) \(ratingName)")
			 .foregroundColor(Color("RichYellow"))
	   }
    }
}

func makeHotelLabel(name: String) -> AnyView {
    AnyView(
	   Text(name)
		  .font(.title)
		  .fontWeight(.semibold)
    )
}

func makeHotelAddress(address: String)-> AnyView {
    AnyView(
	   Button(action: {}) {
		  Text(address)
			 .font(.subheadline)
			 .foregroundColor(Color.blue)
	   }
		  .frame(alignment: .leading)
    )
}

func makeHotelPrice(priceHotel: Int, priceHotelForIt: String) -> some View {
    HStack {
	   Text("От: \(priceHotel)₽")
		  .font(.title)
		  .fontWeight(.bold)
	   Text(priceHotelForIt)
		  .font(.footnote)
		  .foregroundColor(Color("PaleGray"))
	   
    }.padding(.trailing, 30)
}

func makeHotelInfo() -> some View {
    Text("Об отеле")
	   .font(.headline)
	   .frame(maxWidth: .infinity, alignment: .leading)
}


func  makeHotelPeculiarities(_ peculiarities: [String]) -> some View {
    let chunkedPeculiarities = peculiarities.chunkedArray(into: 2)
    
    return VStack {
	   ForEach(chunkedPeculiarities, id: \.self) { pair in
		  HStack(spacing: 4) {
			 ForEach(pair, id: \.self) { peculiarity in
				Text(peculiarity)
				    .font(.subheadline)
				    .padding()
				    .foregroundColor(Color("PaleGray"))
				    .cornerRadius(8)
			 }
			 Spacer()
		  }
	   }
    }
}

extension Array {
    func chunkedArray(into size: Int) -> [[Element]] {
	   return stride(from: 0, to: count, by: size).map {
		  Array(self[$0..<Swift.min($0 + size, count)])
	   }
    }
}


func makeHotelDescription(hotelDescriptione: String) -> AnyView {
    AnyView(
	   Text(hotelDescriptione)
    )
}


func createNonClickableButton(title: String, subtitle: String, imageName: String) -> some View {
    HStack {
	   Image(systemName: imageName)
		  .foregroundColor(Color.black)
	   
	   VStack(alignment: .leading) {
		  Text(title)
		  Text(subtitle)
			 .foregroundColor(Color("PaleGray"))
	   }
	   Spacer()
	   Image(systemName: "chevron.right")
		  .foregroundColor(.black)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 10)
}

