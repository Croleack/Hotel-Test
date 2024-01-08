//
//  TwoColumnsViewModifier.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 22.12.2023.
//

import SwiftUI

struct TwoColumnsViewModifier: ViewModifier {
    
    var size = Constants.size
    var lineHeight = Constants.lineHeight
    var weight: Font.Weight = .regular
    
    func body(content: Content) -> some View {
	   let calcPrecent = (size / 100) * lineHeight
	   let padding = (calcPrecent - size) / 2
	   
	   return content
		  .lineSpacing(padding)
		  .padding(.vertical, padding)
    }
}

// MARK: - Constants

fileprivate extension TwoColumnsViewModifier {
    enum Constants {
	   
	   static let size: CGFloat = 16.0
	   static let lineHeight: CGFloat = 100.0

    }
}


