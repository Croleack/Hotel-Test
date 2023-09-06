//
//  BImageSliderView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 01.09.2023.
//

import SwiftUI

struct BImageSliderView: View {
    @State private var currentIndex = 0
    var imageUrls: [String]
    
    init(imageUrls: [String]) {
        self.imageUrls = imageUrls
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.horizontal, showsIndicators: true) {
                ZStack(alignment: .bottom) { // Выравнивание изменено на .bottom
                    HStack(spacing: 5) {
                        ForEach(imageUrls, id: \.self) { imageUrl in
                            if let url = URL(string: imageUrl),
                               let data = try? Data(contentsOf: url),
                               let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: .infinity, height: 180)
                                    .cornerRadius(16)
                            } else {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.vertical)
                    .frame(height: 200)
                    
                    HStack(spacing: 10) {
                        ForEach(0..<imageUrls.count) { index in
                            Circle()
                                .fill(self.currentIndex == index ? Color.black : Color.gray)
                                .frame(width: 10, height: 10)
                                .onTapGesture {
                                    currentIndex = index
                                }
                        }
                    }
                    .padding(.bottom, 12)
                    .background(Color.white)
                    .cornerRadius(6) // Закругление углов прямоугольника
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if currentIndex + 1 == imageUrls.count {
                    currentIndex = 0
                } else {
                    currentIndex += 1
                }
            }
        }
    }
}

struct BImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        BImageSliderView(imageUrls: [
            "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
            "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
            "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
        ])
    }
}

