//
//  Extension + String.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 23.12.2023.
//

import SwiftUI
///defString - default value for expand optional
///-widthOfString - The method returns the width of the line if it were displayed with a specific font.
extension String {
    
    static let baseURL = "https://run.mocky.io/v3/"
    static let baseFont = "SF Pro Display"
    static let defString = ""
    
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
	   let fontAttributes = [NSAttributedString.Key.font: font]
	   let size = self.size(withAttributes: fontAttributes)
	   return size.width
    }
}
