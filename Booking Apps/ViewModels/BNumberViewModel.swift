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
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = URL(string: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd") else {
            return
        }
        
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: BRoomData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка загрузки данных: \(error)")
                }
            }) { [weak self] roomData in
                self?.roomData = roomData
            }
            .store(in: &cancellables)
    }
}
