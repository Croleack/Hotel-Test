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
    var imageUrls: [String]
    
    var body: some View {
	   VStack {
		  TabView(selection: $selection) {
			 ForEach(0..<imageUrls.count, id: \.self) { i in
				if let url = URL(string: imageUrls[i]),
				   //TODO: - in the future, this function should be rewritten for an asynchronous network call
				   let data = try? Data(contentsOf: url),
				   let uiImage = UIImage(data: data) {
				    
				    Image(uiImage: uiImage)
					   .resizable()
					   .scaledToFit()
					   .clipShape(RoundedRectangle(cornerRadius: 8))
				} else {
				    Image(systemName: "photo.fill")
					   .resizable()
				}
			 }
		  }
		  .tabViewStyle(PageTabViewStyle())
		  .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
		  .onReceive(timer) { _ in
			 withAnimation {
				selection = selection < imageUrls.count - 1 ? selection + 1 : 0
			 }
		  }
	   }
    }
}

