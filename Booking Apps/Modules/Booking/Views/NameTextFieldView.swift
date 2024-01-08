//
//  NameTextFieldView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import SwiftUI

struct NameTextFieldView: View {
    
    @StateObject var viewModel: NameValidationViewModel
    var completion: ((Bool)->())?
    var keyboardType: UIKeyboardType = .default
    
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
			 .onChange(of: viewModel.text, perform: { newValue in
				viewModel.text = format(text: newValue)
			 })
		  }
	   }
	   .padding(.horizontal, Constants.paddingHorizontal)
	   .frame(height: Constants.frameHeight)
	   .background(viewModel.isValidName ? Color(.lightGray) : Color(.error))
	   .animation(.easeInOut, value: viewModel.isValidName)
    }
}

extension NameTextFieldView {
    func format(text: String) -> String {
	   let letters = text.replacingOccurrences(
		  of: "[^a-zA-Zа-яА-Я]",
		  with: "",
		  options: .regularExpression
	   )
	   return letters
    }
}

// MARK: - Constants

fileprivate extension NameTextFieldView {
    enum Constants {
	   
	   static let fontPlaceholderPrimary = 12.0
	   static let fontPlaceholderActive = 16.0
	   static let frameHeight = 52.0
	   static let paddingHorizontal = 16.0
	   static let spacing = 4.0
    }
}
