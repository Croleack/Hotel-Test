//
//  BTouristCell.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import SwiftUI

struct TouristCellView: View {
    
    @StateObject var viewModel: TouristCellViewModel
    
    var body: some View {
	   VStack(spacing: .zero) {
		  HStack {
			 Text(viewModel.nameTourists[viewModel.index] + Constants.addTourist)
			 Spacer()
			 Button {
				viewModel.isShow.toggle()
			 } label: {
				if viewModel.isShow {
				    Image(Constants.arrowUp)
				} else {
				    Image(Constants.arrowDown)
				}
			 }
			 .frame(width: Constants.frameImageWidth,
				   height: Constants.frameImageHeight
			 )
		  }
		  .padding(.trailing, Constants.padTrailingNameTourists)
		  .padding(.bottom, Constants.padBottomNameTourists)
		  .font(Font.custom(.baseFont, size: Constants.fontText)
			 .weight(.medium))
		  if viewModel.isShow {
			 VStack(spacing: Constants.spacingBookingText) {
				NameTextFieldView(viewModel: viewModel.name)
				    .cornerRadius(Constants.cornerRadiusText)
				NameTextFieldView(viewModel: viewModel.surname)
				    .cornerRadius(Constants.cornerRadiusText)
				DateTextFieldView(viewModel: viewModel.dateOfBirth)
				    .cornerRadius(Constants.cornerRadiusText)
				NameTextFieldView(viewModel: viewModel.citizenship)
				    .cornerRadius(Constants.cornerRadiusText)
				PassportTextFieldView(viewModel: viewModel.passportNumber)
				    .cornerRadius(Constants.cornerRadiusText)
				DateTextFieldView(viewModel: viewModel.validityPeriodOfPassport)
				    .cornerRadius(Constants.cornerRadiusText)
			 }
		  }
	   }
	   .background(Color.white)
	   .animation(.easeInOut, value: viewModel.isShow)
	   .padding(.bottom, Constants.padBottomBookingText)
	   .onTapGesture {
		  UIApplication.shared.endEditing()
	   }
    }
}

// MARK: - Constants

fileprivate extension TouristCellView {
    enum Constants {
	   
	   static let addTourist = " турист"
	   static let arrowUp = "ic-up"
	   static let arrowDown = "ic-down"
	   
	   static let padTrailingNameTourists = 10.0
	   static let padBottomNameTourists = 20.0
	   static let padBottomBookingText = 24.0
	   
	   static let cornerRadiusText = 12.0
	   
	   static let fontText = 22.0
	   
	   static let frameImageHeight = 12.0
	   static let frameImageWidth = 6.0
	   
	   static let spacingBookingText = 8.0
    }
}
