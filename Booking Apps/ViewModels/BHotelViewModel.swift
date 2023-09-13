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
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		loadData()
	}
	
	func loadData() {
		guard let url = URL(string: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3") else {
			return
		}
		
		URLSession.shared.dataTaskPublisher(for: url)
			.map(\.data)
			.decode(type: BHotelData.self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { completion in
				switch completion {
				case .finished:
					break
				case .failure(let error):
					
					print("Ошибка загрузки данных: \(error)")
				}
			}) { [weak self] hotelData in
				self?.hotelData = hotelData
			}
			.store(in: &cancellables)
	}
}


