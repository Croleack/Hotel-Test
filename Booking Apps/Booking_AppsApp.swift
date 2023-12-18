//
//  Booking_AppsApp.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

@main
struct YourApp: App {
    @StateObject var coordinator = BCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BHotelView(viewModel: BHotelViewModel())
                    .environmentObject(coordinator)
            }
        }
    }
}


