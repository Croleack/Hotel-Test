//
//  Colors.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 29.12.2023.
//

import SwiftUI

enum Colors {
    case richYellow
    case paleYellow
    case paleGray
    case lightGray
    case error
    case deepBlue
    case listColor
    
    var value: Color {
	   switch self {
	   case .richYellow:
		  return Color("RichYellow")
	   case .paleYellow:
		  return Color("PaleYellow")
	   case .paleGray:
		  return Color("PaleGray")
	   case .lightGray:
		  return Color("LightGray")
	   case .error:
		  return Color("Error")
	   case .deepBlue:
		  return Color("DeepBlue")
	   case .listColor:
		  return Color("ListColor")
	   }
    }
}
