//
//  BBookingTextField.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import SwiftUI

struct BookingTextField: View {
    
    @StateObject var viewModel: BMailValidationViewModel
    var completion: ((Bool)->())?
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 0) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom("SF Pro Display", size: 12))
				.foregroundColor(.secondary)
		  }
		  HStack(spacing: 4) {
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				completion?(editing)
			 }
			 .font(Font.custom("SF Pro Display", size: 16))
		  }
	   }
	   .padding(.horizontal)
	   .frame(height: 52)
	   .background(viewModel.isValid ? Color("BackgraundGreyColor") : Color("ErrorValidColor"))
	   .cornerRadius(10)
	   .animation(.easeInOut, value: viewModel.isValid)
    }
    
}

struct BookingTextField_Previews: PreviewProvider {
    
    static var previews: some View {
	   BookingTextField(viewModel: MailValidationViewModel(placeholder: "Name"))
    }
    
}
