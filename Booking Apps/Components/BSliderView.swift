//
//  BBImageSliderView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI

struct BSliderView: View {
    
    public let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    let imageUrls: [String]
    
    var body: some View {
	   TabView(selection: $selection) {
		  ForEach(imageUrls.indices, id: \.self) { index in
			 AsyncImage(url: URL(string: imageUrls[index])) { phase in
				if let image = phase.image{
				    image
					   .resizable()
					   .scaledToFill()
				}
				else if phase.error != nil{
				    Text("Изображение отсутствует")
				}
				else{
				    ProgressView()
				}
			 }
			 .tag(index)
		  }
	   }
	   .onReceive(timer) { _ in
		  withAnimation {
			 selection = (selection + 1) % imageUrls.count
		  }
	   }
	   .tabViewStyle(.page)
	   .indexViewStyle(.page(backgroundDisplayMode: .always))
	   .frame(height: 257)
	   .cornerRadius(15)
    }
}

