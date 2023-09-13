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
    
    init() {
	   fetchBookingData()
    }
    
    func fetchBookingData() {
	   
	   guard let url = URL(string: "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8")
	   else {
		  return
	   }
	   
	   URLSession.shared.dataTaskPublisher(for: url)
		  .map(\.data)
		  .decode(type: BookingData.self, decoder: JSONDecoder())
		  .receive(on: DispatchQueue.main)
		  .sink(receiveCompletion: { completion in
			 switch completion {
			 case .finished:
				break
			 case .failure(let error):
				print("error \(error)")
			 }
		  }) { [weak self] bookingData in
			 self?.bookingData = bookingData
		  }
		  .store(in: &cancellables)
    }
}


