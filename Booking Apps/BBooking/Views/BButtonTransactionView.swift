//
//  BButtonTransaction.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 21.12.2023.
//

import SwiftUI

struct BButtonTransactionView: View {
    
    @StateObject var viewModel: BButtonTransactionViewModel
    var completion: ()->()
    
    var body: some View {
	   HStack {
		  Spacer()
		  Button {
			 completion()
		  } label: {
			 Text(viewModel.title)
				.foregroundColor(Color.white)
				.font(.custom("SF Pro Display",
						    size: CGFloat(16))
				    .weight(.medium))
				.frame(maxWidth: .infinity)
				.padding(.vertical)
				.background(Color.blue)
				.cornerRadius(15)
		  }
		  Spacer()
	   }
	   .padding(.top, 22)
    }
}

