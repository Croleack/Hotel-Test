//
//  BBImageSliderView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct SliderView: View {
    ///timer needed for auto-scrolling images
    public let timer = Timer.publish(every: Constants.timer,
							  on: .main,
							  in: .common).autoconnect()
    @State private var selection = 0
    
    let imageUrls: [String]
    
    var body: some View {
	   ZStack (alignment: .bottom) {
		  TabView(selection: $selection) {
			 ForEach(imageUrls.indices, id: \.self)  { index in
				AsyncImage(url: URL(string: imageUrls[index])) { image in
				    image
					   .resizable()
				    
				} placeholder: {
				    Text(Constants.textWait)
				}
				.aspectRatio(contentMode: .fill)
				.frame(height: UIScreen.main.bounds.height / Constants.coefficientScreen)
			 }
		  }
		  .onReceive(timer) { _ in
			 withAnimation {
				selection = (selection + 1) % imageUrls.count
			 }
		  }
		  .cornerRadius(Constants.cornerRadiusImage)
		  .tabViewStyle(.page(indexDisplayMode: .never))
		  .frame(height: UIScreen.main.bounds.height / Constants.coefficientScreen)
		  
		  HStack {
			 ForEach(imageUrls.indices, id: \.self) { index in
				Circle()
				    .fill(selection == index ?
						Color.black : Color.gray.opacity(1 - Double(abs(selection - index)) /
												   Double(imageUrls.count)))
				    .frame(width: Constants.frameCircleWidthHeight,
						 height: Constants.frameCircleWidthHeight)
			 }
		  }
		  .padding(.horizontal, Constants.padHorPageControl)
		  .padding(.vertical, Constants.padVertPageControl)
		  .background(Color.white.cornerRadius(Constants.cornerRadiusPageControl))
		  .padding(.bottom, Constants.padBottomPageControl)
	   }
    }
}

// MARK: - Constants

fileprivate extension SliderView {
    enum Constants {
	   
	   static let textWait = "Подождите, изображение загружается"
	   static let padHorPageControl = 10.0
	   static let padVertPageControl = 5.0
	   static let padBottomPageControl = 8.0
	   static let cornerRadiusPageControl = 5.0
	   static let cornerRadiusImage = 15.0
	   static let coefficientScreen = 3.3
	   static let frameCircleWidthHeight = 7.0
	   static let timer = 6.0
	   
    }
}
