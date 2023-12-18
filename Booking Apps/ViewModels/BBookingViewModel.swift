//
//  BBookingViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI
import Combine

class BBookingViewModel: ObservableObject {
    
    @Published var bookingData: BookingData?
    @Published var tourists: [Tourist] = [Tourist()]
    
    var totalAmount: Int {
	   let tourPrice = bookingData?.tourPrice ?? 0
	   let fuelCharge = bookingData?.fuelCharge ?? 0
	   let serviceCharge = bookingData?.serviceCharge ?? 0
	   return tourPrice + fuelCharge + serviceCharge
    }
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher = NetworkDispatcher()) {
	   self.networkDispatcher = networkDispatcher
	   fetchBookingData()
    }
    
    func fetchBookingData() {
	   networkDispatcher.fetchBooking { [weak self] result in
		  switch result {
		  case .success(let bookingData):
			 self?.bookingData = bookingData
		  case .failure(let error):
			 print("\(error.localizedDescription)")
		  }
	   }
    }
}


