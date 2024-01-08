//
//  DateTextFieldView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 08.01.2024.
//

import SwiftUI

struct DateTextFieldView: View {
    
    @StateObject var viewModel: DateValidationViewModel
    
    var body: some View {
	   
	   VStack(alignment: .leading) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom(.baseFont, size: Constants.fontPlaceholderPrimary))
				.foregroundColor(.secondary)
		  }
		  HStack(spacing: Constants.spacing) {
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				viewModel.setupEditingDate(editing)
				
			 }
			 .font(Font.custom(.baseFont, size: Constants.fontPlaceholderActive))
			 .keyboardType(.numberPad)
			 .onChange(of: viewModel.text, perform: { oldValue in
				viewModel.text = format(with: Constants.dateFormat, date: oldValue)
			 })
		  }
	   }
	   .padding(.horizontal, Constants.paddingHorizontal)
	   .frame(height: Constants.frameHeight)
	   .background(viewModel.isValidDate ? Color(.lightGray) : Color(.error))
	   .animation(.easeInOut, value: viewModel.isValidDate)
    }
}

extension DateTextFieldView {
    
    func format(with mask: String, date: String) -> String {
	   let numbers = date.replacingOccurrences(
		  of: Constants.dateValid,
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

fileprivate extension DateTextFieldView {
    enum Constants {
	   
	   static let fontPlaceholderPrimary = 12.0
	   static let fontPlaceholderActive = 16.0
	   static let frameHeight = 52.0
	   static let paddingHorizontal = 16.0
	   static let spacing = 4.0
	   
	   static let dateFormat = "XX/XX/XXXX"
	   static let dateValid = "[^0-9]"
    }
}
