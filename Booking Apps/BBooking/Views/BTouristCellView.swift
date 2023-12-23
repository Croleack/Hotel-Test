//
//  BTouristCell.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import SwiftUI

struct BTouristCellView: View {
    
    @StateObject var viewModel: BTouristCellViewModel
    
    var body: some View {
	   VStack(spacing: 20) {
		  HStack {
			 Text(viewModel.nameTourists[viewModel.index] + " турист")
			 Spacer()
			 Button {
				viewModel.isShow.toggle()
			 } label: {
				if viewModel.isShow {
				    Image("ic-up")
					   .frame(width: 6, height: 12)
				} else {
				    Image("ic-down")
					   .frame(width: 6, height: 12)
				}
			 }
		  }
		  .font(Font.custom("SF Pro Display", size: 22)
			 .weight(.medium))
		  if viewModel.isShow {
			 VStack(spacing: 40) {
				BBookingTextFieldView(viewModel: viewModel.name)
				BBookingTextFieldView(viewModel: viewModel.surname)
				BBookingTextFieldView(viewModel: viewModel.dateOfBirth)
				BBookingTextFieldView(viewModel: viewModel.citizenship)
				BBookingTextFieldView(viewModel: viewModel.passportNumber)
				BBookingTextFieldView(viewModel: viewModel.validityPeriodOfPassport)
			 }
		  }
	   }
	   .background(Color.white)
	   .animation(.easeInOut, value: viewModel.isShow)
	   .padding(.bottom, 24)
	   .padding(.trailing, 16)
    }
}

