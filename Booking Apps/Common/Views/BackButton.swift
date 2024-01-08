//
//  BBackButton.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    let text: String
    
    var body: some View {
	   HStack {
		  Button(action: {
			 self.presentationMode.wrappedValue.dismiss()
		  }) {
			 Image(Constants.navigImage)
				.frame(width: Constants.frameImageWidth,
					  height: Constants.frameImageHeight
				)
				.foregroundColor(.black)
				.frame(alignment: .leading)
		  }
		  Spacer()
		  Text(text)
			 .foregroundColor(.black)
			 .font(Font.custom(.baseFont, size: Constants.fontText)
				.weight(.medium))
			 .frame(width: Constants.frameTextWidth,
				   height: Constants.frameTextHeight,
				   alignment: .center
			 )
			 .lineLimit(nil)
			 .multilineTextAlignment(.center)
		  Spacer()
	   }
	   .frame(alignment: .center)
    }
}

// MARK: - Constants

fileprivate extension BackButton {
    enum Constants {
	   
	   static let navigImage = "ic-navig"
	   static let fontText = 18.0
	   static let frameImageHeight = 12.0
	   static let frameImageWidth = 6.0
	   static let frameTextHeight = 50.0
	   static let frameTextWidth = 300.0
    }
}

