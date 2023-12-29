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
	   VStack(spacing: .zero) {
		  Image(Constants.fireworkImage)
			 .frame(width: Constants.frameFireworkImageWidthHeight,
				   height: Constants.frameFireworkImageWidthHeight)
			 .padding(.top, Constants.padTopFireworkImage)
		  Text(Constants.orderAccepted)
			 .font(Font.custom(.baseFont, size: Constants.fontOrderAccepted)
				.weight(.medium))
			 .padding(.top, Constants.padTopOrderAccepted)
		  
		  Text(Constants.confirmationMessage)
			 .frame(width: Constants.frameConfirmationMessageWidth,
				   alignment: .top)
			 .font(Font.custom(.baseFont, size: Constants.fontConfirmationMessage))
			 .foregroundColor(Color(.paleGray))
			 .multilineTextAlignment(.center)
			 .padding(.top, Constants.padTopConfirmationMessage)
		  Spacer()
		  
		  NavigationLink(destination: coordinator.build(page: .hotel)) {
			 ZStack {
				RoundedRectangle(cornerRadius: Constants.cornerRadiusRectang)
				    .frame(width: Constants.frameRoundedRectangleWidth,
						 height: Constants.frameRoundedRectangleHeight)
				    .foregroundColor(.blue)
				Text(Constants.superText)
				    .font(.custom(.baseFont,
							   size: Constants.fontSuperText)
					   .weight(.medium))
				    .foregroundColor(.white)
			 }
			 .padding(.bottom, Constants.padTopSuperText)
			 
		  }
		  .navigationBarTitleDisplayMode(.inline)
		  .navigationBarBackButtonHidden(true)
		  .toolbar  {
			 ToolbarItem(placement: .navigationBarLeading) {
				BackButton(text: Constants.orderPaid)
			 }
		  }
	   }
    }
}


// MARK: - Constants

fileprivate extension PaidView {
    enum Constants {
	   
	   static let fireworkImage = "ic-firework"
	   static let orderAccepted = "Ваш заказ принят в работу"
	   static let confirmationMessage = "Подтверждение заказа №\(Int.random(in: 1...999)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление"
	   static let superText = "Супер!"
	   static let orderPaid = "Заказ оплачен"
	   
	   static let padTopFireworkImage = 163.0
	   static let padTopOrderAccepted = 57.0
	   static let padTopConfirmationMessage = 20.0
	   static let padTopSuperText = 28.0
	   
	   static let fontOrderAccepted = 22.0
	   static let fontConfirmationMessage = 16.0
	   static let fontSuperText = 16.0
	   
	   static let frameFireworkImageWidthHeight = 44.0
	   static let frameConfirmationMessageWidth = 329.0
	   static let frameRoundedRectangleWidth = 343.0
	   static let frameRoundedRectangleHeight = 48.0
	   
	   static let cornerRadiusRectang = 15.0
    }
}
