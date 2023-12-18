//
//  Booking_AppsApp.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

@main
//struct YourApp: App {
//    @StateObject var coordinator = BCoordinator()
//    
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                BHotelView(viewModel: BHotelViewModel())
//                    .environmentObject(coordinator)
//            }
//        }
//    }
//}


struct HotelMockApp: App {
    
    init() {
	   let navig = UINavigationBarAppearance()
	   navig.configureWithDefaultBackground()
	   navig.titleTextAttributes = [
		  .font : UIFont(name: "SFProDisplay-Medium", size: 18)
		  ?? .systemFont(ofSize: 18, weight: .medium)
	   ]
	   navig.shadowColor = .clear
	   navig.backgroundColor = .white
	   
	   UINavigationBar.appearance().standardAppearance = navig
	   UINavigationBar.appearance().compactAppearance = navig
	   UINavigationBar.appearance().scrollEdgeAppearance = navig
	   
	   UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some Scene {
	   WindowGroup {
		  CoordinatorView()
	   }
    }
}
