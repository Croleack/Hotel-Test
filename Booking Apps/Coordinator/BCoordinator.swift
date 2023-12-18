//
//  BCoordinator.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import Foundation
import SwiftUI

class BCoordinator: ObservableObject {
    @Published var currentScreen: Screens = .hotel

    enum Screens {
         case hotel, number, booking, paid
     }

     func navigateTo(_ screen: Screens) {
         currentScreen = screen
     }
    
    func canGoBack() -> Bool {
            return currentScreen != .hotel
        }
    }

