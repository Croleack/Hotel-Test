//
//  PassportTextFieldView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import SwiftUI

struct PassportTextFieldView: View {
    
    @StateObject var viewModel: PassportValidationViewModel
    var completion: ((Bool)->())?
    var keyboardType: UIKeyboardType = .phonePad
    
    var body: some View {
	   VStack(alignment: .leading) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom(.baseFont, size: Constants.fontPlaceholderPrimary))
				.foregroundColor(.secondary)
		  }
		  HStack(spacing: Constants.spacing) {
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				completion?(editing)
			 }
			 .font(Font.custom(.baseFont, size: Constants.fontPlaceholderActive))
			 .keyboardType(keyboardType)
			 .onChange(of: viewModel.text, perform: { oldValue in
				viewModel.text = format(with: Constants.passportFormat, passport: oldValue)
			 })
		  }
	   }
	   .padding(.horizontal, Constants.paddingHorizontal)
	   .frame(height: Constants.frameHeight)
	   .background(viewModel.isValid ? Color(.lightGray) : Color(.error))
	   .animation(.easeInOut, value: viewModel.isValid)
    }
}

extension PassportTextFieldView {
    
    func format(with mask: String, passport: String) -> String {
	   let numbers = passport.replacingOccurrences(
		  of: Constants.passportValid,
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

fileprivate extension PassportTextFieldView {
    enum Constants {
	   
	   static let fontPlaceholderPrimary = 12.0
	   static let fontPlaceholderActive = 16.0
	   static let frameHeight = 52.0
	   static let paddingHorizontal = 16.0
	   static let spacing = 4.0
	   
	   static let passportFormat = "XX XXXXXX"
	   static let passportValid = "[^А-Я0-9]"
	   static let startingFormat = "AB 123456"
    }
}
