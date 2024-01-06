//
//  BButtonTransaction.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 21.12.2023.
//

import SwiftUI

struct ButtonTransactionView: View {
    
    @StateObject var viewModel: ButtonTransactionViewModel
    var completion: ()->()
    
    var body: some View {
	   HStack {
		  Spacer()
		  Button {
			 completion()
		  } label: {
			 Text(viewModel.title)
				.foregroundColor(Color.white)
				.font(.custom(.baseFont,
						    size: CGFloat(Constants.fontText))
				    .weight(.medium))
				.frame(maxWidth: .infinity)
				.padding(.vertical)
				.background(Color(.deepBlue))
				.cornerRadius(Constants.corRadius)
		  }
		  Spacer()
	   }
	   .padding(.top, Constants.padTop)
	   .padding(.bottom, Constants.padBot)
	   .padding(.horizontal, Constants.padHor)
    }
}

// MARK: - Constants

fileprivate extension ButtonTransactionView {
    enum Constants {
	   
	   static let padTop = 22.0
	   static let padBot = 28.0
	   static let padHor = -12.0
	   static let corRadius = 15.0
	   static let fontText = 16.0
    }
}
