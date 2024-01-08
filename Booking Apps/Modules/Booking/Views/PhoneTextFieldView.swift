//
//  BPhoneTextField.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import SwiftUI

struct PhoneTextFieldView: View {
    
    @StateObject var viewModel: PhoneValidationViewModel
    
    var body: some View {
	   
	   VStack(alignment: .leading, spacing: .zero) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom(.baseFont, size: Constants.fontPlaceholderPrimary))
				.foregroundColor(.secondary)
		  }
		  HStack {
			 if !viewModel.text.isEmpty {
				Text(Constants.startingDigit)
				    .font(Font.custom(.baseFont, size: Constants.fontPlaceholderActive))
				    .foregroundColor(!viewModel.text.isEmpty ? Color.black : .secondary)
			 }
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				viewModel.setupEditingPhone(editing)
				
			 }
			 .font(Font.custom(.baseFont, size: Constants.fontPlaceholderActive))
			 .keyboardType(.phonePad)
			 .onChange(of: viewModel.text, perform: { oldValue in
				viewModel.text = format(with: Constants.numberFormat, phone: oldValue)
			 })
		  }
	   }
	   .padding(.horizontal, Constants.paddingHorizontal)
	   .frame(height: Constants.frameHeight)
	   .background(viewModel.isValidPhone ? Color(.lightGray) : Color(.error))
	   .animation(.easeInOut, value: viewModel.isValidPhone)
	   .cornerRadius(Constants.cornerRadius)
    }
}

extension PhoneTextFieldView {
    
    func format(with mask: String, phone: String) -> String {
	   let numbers = phone.replacingOccurrences(of: Constants.numberValid,
									    with: "",
									    options: .regularExpression
	   )
	   var result = ""
	   var index = numbers.startIndex
	   for ch in mask where index < numbers.endIndex {
		  if ch == "X" {
			 result.append(numbers[index])
			 index = numbers.index(after: index)
		  } else {
			 result.append(ch)
		  }
	   }
	   return result
    }
}

// MARK: - Constants

fileprivate extension PhoneTextFieldView {
    enum Constants {
	   
	   static let fontPlaceholderPrimary = 12.0
	   static let fontPlaceholderActive = 16.0
	   static let frameImageHeight = 12.0
	   static let frameImageWidth = 6.0
	   static let frameHeight = 52.0
	   static let paddingHorizontal = 16.0
	   static let cornerRadius = 10.0
	   
	   static let numberFormat = "(XXX) XXX-XX-XX"
	   static let numberValid = "[^0-9]"
	   static let startingDigit = "+7"
    }
}
