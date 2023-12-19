//
//  BHotelView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct BHotelView: View {
    @ObservedObject var viewModel: BHotelViewModel
    
    var body: some View {
	   ScrollView(.vertical) {
		  
		  ZStack {
			 Rectangle()
				.foregroundColor(.white)
			 
			 VStack(alignment: .leading) {
				
				makeSliderView(imageUrls: viewModel.hotelData?.imageUrls ?? [])
				
				makeHotelRating(rating: viewModel.hotelData?.rating ?? 0, ratingName: viewModel.hotelData?.ratingName ?? "")
				    .padding(.top, 16)
				
				makeHotelLabel(name: viewModel.hotelData?.name ?? "")
				    .padding(.top, 8)
				makeHotelAddress(address: viewModel.hotelData?.address ?? "")
				    .padding(.top, 8)
				makeHotelPrice(priceHotel: viewModel.hotelData?.minimalPrice ?? 100000,
							priceHotelForIt: viewModel.hotelData?.priceForIt.lowercased() ?? "")
				.padding(.top, 16)
				
				VStack() {
				    makeHotelInfo()
				    
				    makeHotelPeculiarities(viewModel.hotelData?.aboutTheHotel.peculiarities ?? [])
					   .padding(.top, 16)
				    
				    makeHotelDescription(hotelDescriptione: viewModel.hotelData?.aboutTheHotel.description ?? "")
					   .padding(.top, 12)
					   .padding(.trailing, 16)
				    
				    createNonClickableButton(title: "Удобства", subtitle: "Самое необходимое", imageName: "ic-smiley")
					   .padding(.top, 16)
				    createNonClickableButton(title: "Что включено", subtitle: "Самое необходимое", imageName: "checkmark.square")
					   .padding(.top, 20)
				    createNonClickableButton(title: "Что не включено", subtitle: "Самое необходимое", imageName: "multiply.square")
					   .padding(.top, 20)
				    
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
				.padding(.top, 40)
			 }
		  }
		  .padding(.top, 8)
		  .padding(.horizontal, 16)
	   }
	   .navigationTitle("Отель")
	   .navigationBarTitleDisplayMode(.inline)
    }
}

struct BHotelView_Previews: PreviewProvider {
    static var previews: some View {
	   BHotelView(viewModel: BHotelViewModel())
    }
}

//MARK: - Functions

func makeSliderView(imageUrls: [String]) -> AnyView {
    AnyView(
	   BSliderView(imageUrls: imageUrls)
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
			 .font(.headlineCustom)
	   }
    }
}

func makeHotelLabel(name: String) -> AnyView {
    AnyView(
	   Text(name)
		  .font(.titleCustom)
    )
}

func makeHotelAddress(address: String)-> AnyView {
    AnyView(
	   Button(action: {}) {
		  Text(address)
			 .font(.linkCustom)
			 .foregroundColor(Color("DeepBlue"))
	   }
    )
}

func makeHotelPrice(priceHotel: Int, priceHotelForIt: String) -> some View {
    HStack {
	   Text("от \(priceHotel) ₽")
		  .font(.largeTitleCustom)
	   Text(priceHotelForIt)
		  .font(.semiboldBodyCustom)
		  .foregroundColor(Color("PaleGray"))
		  .baselineOffset(-10)
    }
}

func makeHotelInfo() -> some View {
    Text("Об отеле")
	   .font(.titleCustom)
	   .frame(maxWidth: .infinity, alignment: .leading)
}

func makeHotelPeculiarities(_ peculiarities: [String]) -> some View {
    return ZStack {
	   Rectangle()
		  .foregroundColor(.green)
		  .frame(width: 295, height: 198)
	   
	   VStack(spacing: 4) {
		  ForEach(peculiarities, id: \.self) { peculiarity in
			 Text(peculiarity)
				.font(.bodyCustom)
				.padding(.vertical, 8)
				.foregroundColor(Color("PaleGray"))
				.frame(alignment: .leading)
		  }
	   }
    }
    
}

//extension Array {
//    func chunkedArray(into size: Int) -> [[Element]] {
//	   return stride(from: 0, to: count, by: size).map {
//		  Array(self[$0..<Swift.min($0 + size, count)])
//	   }
//    }
//}


func makeHotelDescription(hotelDescriptione: String) -> AnyView {
    AnyView(
	   Text(hotelDescriptione)
		  .font(.bodyCustom)
    )
}


func createNonClickableButton(title: String, subtitle: String, imageName: String) -> some View {
    HStack {
	   if imageName == "ic-smiley" {
		  Image("ic-smiley")
			 .resizable()
			 .frame(width: 20, height: 20)
			 .foregroundColor(Color.black)
	   } else {
		  Image(systemName: imageName)
			 .foregroundColor(Color.black)
			 .frame(width: 20, height: 20)
	   }
	   
	   VStack(alignment: .leading) {
		  Text(title)
			 .font(.semiboldBodyCustom)
		  Text(subtitle)
			 .foregroundColor(Color("PaleGray"))
			 .font(.captionCustom)
	   }
	   
	   Spacer()
	   
	   Image("ic-rightArrow")
		  .foregroundColor(.black)
		  .frame(width: 6, height: 12)
    }
    .padding(.horizontal, 16)
}

