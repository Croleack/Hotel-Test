//
//  BBackButton.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 20.12.2023.
//

import SwiftUI

struct BBackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    let text: String
    
    var body: some View {
	   HStack {
		  Button(action: {
			 self.presentationMode.wrappedValue.dismiss()
		  }) {
			 Image("ic-navig")
				.frame(width: 6, height: 12)
				.foregroundColor(.black)
				.frame(alignment: .leading)
		  }
		  Spacer()
		  Text(text)
			 .foregroundColor(.black)
			 .font(Font.custom("SF Pro Display", size: 18)
				.weight(.medium))
			 .frame(width: 300, height: 50, alignment: .center)
			 .lineLimit(nil)
			 .multilineTextAlignment(.center)
		  Spacer()
	   }
	   .frame(alignment: .center)
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
	   BBackButton(text: "Back")
    }
}
