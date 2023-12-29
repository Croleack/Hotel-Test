//
//  BButtonTransaction.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 21.12.2023.
//

import SwiftUI

struct ButtonTransactionView: View {
    
    @StateObject var viewModel: ButtonTransactionViewModel
    var completion: ()->()
    
    var body: some View {
	   HStack {
		  Spacer()
		  Button {
			 completion()
		  } label: {
			 Text(viewModel.title)
				.foregroundColor(Color.white)
				.font(.custom(.baseFont,
						    size: CGFloat(16))
				    .weight(.medium))
				.frame(maxWidth: .infinity)
				.padding(.vertical)
				.background(Color(.deepBlue))
				.cornerRadius(15)
		  }
		  Spacer()
	   }
	   .padding(.top, 22)
	   .padding(.horizontal, -12)
    }
}

