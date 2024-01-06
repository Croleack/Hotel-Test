//
//  BNumberViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

class NumberViewModel: ObservableObject {
    @Published var roomData: RoomModel?
    var hotelName: String
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher = NetworkDispatcher(), hotelName: String) {
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
