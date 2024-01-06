//
//  TwoColumnsViewModifier.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 22.12.2023.
//

import SwiftUI

struct TwoColumnsViewModifier: ViewModifier {
    
    var size: CGFloat = 16
    var lineHeight: CGFloat = 100
    var weight: Font.Weight = .regular
    
    func body(content: Content) -> some View {
	   let calcPrecent: CGFloat = (size / 100) * lineHeight
	   let padding: CGFloat = (calcPrecent - size) / 2
	   
	   return content
		  .lineSpacing(padding)
		  .padding(.vertical, padding)
    }
}




