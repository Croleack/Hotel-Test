//
//  Extension + String.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 23.12.2023.
//

import SwiftUI

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
	   let fontAttributes = [NSAttributedString.Key.font: font]
	   let size = self.size(withAttributes: fontAttributes)
	   return size.width
    }
}
