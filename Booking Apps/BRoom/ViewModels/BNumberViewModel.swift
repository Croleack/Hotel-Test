//
//  BNumberViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI
import Combine

class BNumberViewModel: ObservableObject {
    @Published var roomData: BRoomData?
    var hotelName: String
    private let networkDispatcher: BNetworkDispatcher
    
    init(networkDispatcher: BNetworkDispatcher = BNetworkDispatcher(), hotelName: String) {
	   self.networkDispatcher = networkDispatcher
	   self.hotelName = hotelName
	   loadData()
    }
    
    func loadData() {
	   networkDispatcher.fetchRooms { [weak self] result in
		  switch result {
		  case .success(let roomData):
			 self?.roomData = roomData
		  case .failure(let error):
			 print("\(error.localizedDescription)")
		  }
	   }
    }
}
