//
//  BBookingTextField.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 19.12.2023.
//

import SwiftUI

struct BBookingTextFieldView: View {
    
    @StateObject var viewModel: BMailValidationViewModel
    var completion: ((Bool)->())?
    
    var body: some View {
	   VStack(alignment: .leading) {
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
	   .padding(.horizontal, 16)
	   .background(viewModel.isValid ? Color("LightGray") : Color("Error"))
	   .animation(.easeInOut, value: viewModel.isValid)
    }    
}

