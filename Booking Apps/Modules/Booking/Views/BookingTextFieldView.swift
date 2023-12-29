//
//  BBookingTextField.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import SwiftUI

struct BookingTextFieldView: View {
    
    @StateObject var viewModel: MailValidationViewModel
    var completion: ((Bool)->())?
    
    var body: some View {
	   VStack(alignment: .leading) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom(.baseFont, size: 12))
				.foregroundColor(.secondary)
				.cornerRadius(10)
		  }
		  HStack(spacing: 4) {
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				completion?(editing)
			 }
			 .font(Font.custom(.baseFont, size: 16))
		  }
	   }
	   .padding(.horizontal, 16)
	   .frame(height: 52)
	   .cornerRadius(10)
	   .background(viewModel.isValid ? Color(.lightGray) : Color(.error))
	   .animation(.easeInOut, value: viewModel.isValid)
    }    
}

