//
//  BHotelViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI
import Combine

class BHotelViewModel: ObservableObject {
    
    @Published var hotelData: BHotelData?
    private let networkDispatcher: BNetworkDispatcher
    
    init(networkDispatcher: BNetworkDispatcher = BNetworkDispatcher()) {
	   self.networkDispatcher = networkDispatcher
	   loadData()
    }
    
    func loadData() {
	   networkDispatcher.fetchHotels { [weak self] result in
		  switch result {
		  case .success(let hotelData):
			 DispatchQueue.main.async {
				self?.hotelData = hotelData
			 }
		  case .failure(let error):
			 print("\(error.localizedDescription)")
		  }
	   }
    }
}


