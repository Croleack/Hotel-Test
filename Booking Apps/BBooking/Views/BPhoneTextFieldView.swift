//
//  BPhoneTextField.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import SwiftUI

struct BPhoneTextFieldView: View {
    
    @StateObject var viewModel: BPhoneValidationViewModel
    
    var body: some View {
	   
	   VStack(alignment: .leading) {
		  if !viewModel.text.isEmpty {
			 Text(viewModel.placeholder)
				.font(Font.custom("SF Pro Display", size: 12))
				.foregroundColor(.secondary)
		  }
		  HStack {
			 if !viewModel.text.isEmpty {
				Text("+7")
				    .font(Font.custom("SF Pro Display", size: 16))
				    .foregroundColor(!viewModel.text.isEmpty ? Color.black : .secondary)
			 }
			 TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
				viewModel.setupEditingPhone(editing)
			 }
			 .font(Font.custom("SF Pro Display", size: 16))
			 .onChange(of: viewModel.text, perform: { oldValue in
				viewModel.text = format(with: "(XXX) XXX-XX-XX", phone: oldValue)
			 })
		  }
	   }
	   .padding(.horizontal, 16)
	   .background(viewModel.isValidPhone ? Color("LightGray") : Color("Error"))
	   .animation(.easeInOut, value: viewModel.isValidPhone)
    }
}

struct PhoneTextField_Previews: PreviewProvider {
    
    static var previews: some View {
	   VStack {
		  BPhoneTextFieldView(viewModel: BPhoneValidationViewModel())
	   }
    }
}

extension BPhoneTextFieldView {
    
    func format(with mask: String, phone: String) -> String {
	   let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
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
