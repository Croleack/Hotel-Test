//
//  Coordinator.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 18.12.2023.
//

import SwiftUI

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
	   path.append(page)
    }
    
    func pop() {
	   path.removeLast()
    }
    
    func popToRoot() {
	   path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
	   switch page {
	   case .hotel:
		  BHotelView(viewModel: BHotelViewModel())
	   case .rooms:
		  BRoomDetailView(rooms: [])
	   case .booking:
		  BBookingView(viewModel: BBookingViewModel())
	   case .transaction:
		  BPaidView()
	   }
    }
}
