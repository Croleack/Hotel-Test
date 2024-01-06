//
//  Extension + View.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 06.01.2024.
//

import SwiftUI

///extensions provide convenient methods for hiding the keyboard in applications,
extension View {
    func hideKeyboard() {
	   UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension UIApplication {
    func endEditing() {
	   sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
