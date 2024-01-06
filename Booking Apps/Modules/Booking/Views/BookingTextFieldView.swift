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
    var keyboardType: UIKeyboardType = .emailAddress
    
    var body: some View {
	   VStack(alignment: .leading) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom(.baseFont, size: Constants.fontPlaceholderPrimary))
				.foregroundColor(.secondary)
				.cornerRadius(Constants.cornerRadius)
		  }
		  HStack(spacing: Constants.spacing) {
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				completion?(editing)
			 }
			 .keyboardType(keyboardType)
			 .font(Font.custom(.baseFont, size: Constants.fontPlaceholderActive))
		  }
	   }
	   .padding(.horizontal, Constants.paddingHorizontal)
	   .frame(height: Constants.frameHeight)
	   .background(viewModel.isValid ? Color(.lightGray) : Color(.error))
	   .animation(.easeInOut, value: viewModel.isValid)
    }    
}

// MARK: - Constants

fileprivate extension BookingTextFieldView {
    enum Constants {
	   
	   static let fontPlaceholderPrimary = 12.0
	   static let fontPlaceholderActive = 16.0
	   static let paddingHorizontal = 16.0
	   static let frameHeight = 52.0
	   static let cornerRadius = 10.0
	   static let spacing = 4.0
    }
}
