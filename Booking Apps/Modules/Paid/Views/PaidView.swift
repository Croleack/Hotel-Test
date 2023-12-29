//
//  BPaidView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct PaidView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
	   VStack(spacing: 0) {
		  Image("ic-firework")
			 .frame(width: 44, height: 44)
			 .padding(.top, 163)
		  Text("Ваш заказ принят в работу")
			 .font(Font.custom(.baseFont, size: 22)
				.weight(.medium))
			 .padding(.top, 57)
		  
		  Text("Подтверждение заказа №\(Int.random(in: 1...999)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление")
			 .frame(width: 329, alignment: .top)
			 .font(Font.custom(.baseFont, size: 16))
			 .foregroundColor(Color(.paleGray))
			 .multilineTextAlignment(.center)
			 .padding(.top, 20)
		  Spacer()
		  
		  NavigationLink(destination: coordinator.build(page: .hotel)) {
			 ZStack {
				RoundedRectangle(cornerRadius: 15)
				    .frame(width: 343, height: 48)
				    .foregroundColor(.blue)
				Text("Супер!")
				    .font(.custom(.baseFont,
							   size: CGFloat(16))
					   .weight(.medium))
				    .foregroundColor(.white)
			 }
			 .padding(.bottom, 28)
			 
		  }
		  .navigationBarTitleDisplayMode(.inline)
		  .navigationBarBackButtonHidden(true)
		  .toolbar  {
			 ToolbarItem(placement: .navigationBarLeading) {
				BackButton(text: "Заказ оплачен")
			 }
		  }
	   }
    }
}
