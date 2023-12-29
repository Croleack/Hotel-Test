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
					   .frame(width: 6, height: 12)
				} else {
				    Image(Constants.arrowDown)
					   .frame(width: 6, height: 12)
				}
			 }
		  }
		  .font(Font.custom(.baseFont, size: 22)
			 .weight(.medium))
		  if viewModel.isShow {
			 VStack(spacing: 8) {
				BookingTextFieldView(viewModel: viewModel.name)
				BookingTextFieldView(viewModel: viewModel.surname)
				BookingTextFieldView(viewModel: viewModel.dateOfBirth)
				BookingTextFieldView(viewModel: viewModel.citizenship)
				BookingTextFieldView(viewModel: viewModel.passportNumber)
				BookingTextFieldView(viewModel: viewModel.validityPeriodOfPassport)
			 }
			 .cornerRadius(10)
		  }
	   }
	   .background(Color.white)
	   .animation(.easeInOut, value: viewModel.isShow)
	   .padding(.bottom, 24)
    }
}

// MARK: - Constants

fileprivate extension TouristCellView {
    enum Constants {
	   
	   static let addTourist = " турист"
	   static let arrowUp = "ic-up"
	   static let arrowDown = "ic-down"
    
    }
}