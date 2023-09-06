//
//  BRoomDetailViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 02.09.2023.
//

import SwiftUI
import Combine

class BRoomDetailViewModel: ObservableObject {
    @Published var roomName: String = ""
    @Published var peculiarities: [String] = []
    @Published var price: String = ""
    @Published var price_per: String = ""
    @Published var image_urls: [URL] = []
    
    init(room: BRoom) {
        self.roomName = room.name
        self.price = String(room.price)
        self.price_per = room.price_per
        self.peculiarities = room.peculiarities
        
        if let image_urls = room.image_urls {
            self.image_urls = image_urls
        } else {
            self.imageUrls = []
        }
    }
}

// Добавьте функцию для создания ViewModel с данными после получения данных
func createRoomDetailViewModel(from roomData: BRoomData) -> BRoomDetailViewModel {
    let roomInfo = roomData.rooms.first ?? BRoom(id: 0, name: "", price: 0, pricePer: "", peculiarities: [], imageUrls: [])
    return BRoomDetailViewModel(room: roomInfo)
}

// Ваша функция fetchRoomData остается без изменений
func fetchRoomData(completion: @escaping (Result<BRoomData, Error>) -> Void) {
    let urlString = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
    
    guard let url = URL(string: urlString) else {
        completion(.failure(NetworkError.invalidURL))
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NetworkError.noData))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let roomData = try decoder.decode(BRoomData.self, from: data)
            completion(.success(roomData))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

enum NetworkError: Error {
    case invalidURL
    case noData
}

