//
//  BBImageSliderView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct SliderView: View {
    
    public let timer = Timer.publish(every: 6, on: .main, in: .common).autoconnect()
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
				    Text("Подождите, изображение загружается")
				}
				.aspectRatio(contentMode: .fill)
				.frame(height: UIScreen.main.bounds.height / 3.3)
			 }
		  }
		  .onReceive(timer) { _ in
			 withAnimation {
				selection = (selection + 1) % imageUrls.count
			 }
		  }
		  .cornerRadius(15)
		  .tabViewStyle(.page(indexDisplayMode: .never))
		  .frame(height: UIScreen.main.bounds.height / 3.3)
		  
		  HStack {
			 ForEach(imageUrls.indices, id: \.self) { index in
				Circle()
				    .fill(selection == index ? Color.black : Color.gray.opacity(1 - Double(abs(selection - index)) / Double(imageUrls.count)))
				    .frame(width: 7, height: 7)
			 }
		  }
		  .padding(.horizontal, 10)
		  .padding(.vertical, 5)
		  .background(Color.white.cornerRadius(5))
		  .padding(.bottom, 8)
	   }
    }
}
