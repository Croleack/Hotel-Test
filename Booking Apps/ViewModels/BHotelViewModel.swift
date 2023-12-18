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
		guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else {
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


