//
//  NetworkDispatcher.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 18.12.2023.
//

import Foundation

//MARK: - protocol NetworkDispatcher
protocol INetworkDispatcher {}

extension INetworkDispatcher {
    
    func fetchData<T: Decodable>(
	   apiManager: INetworkManager,
	   completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
	   guard let url = makeURL(apiManager: apiManager) else {
		  completion(.failure(.urlError(URLError(.badURL))))
		  return
	   }
	   
	   var request = makeRequest(url: url, apiManager: apiManager)
	   
	   URLSession.shared.dataTask(with: request) { data, response, error in
		  guard error == nil else {
			 completion(.failure(.noData))
			 return
		  }
		  
		  guard let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode
		  else { let responseError = (response as? HTTPURLResponse)?.statusCode ?? 500
			 completion(.failure(.responseError(responseError)))
			 return
		  }
		  
		  guard let data = data else {
			 completion(.failure(.noData))
			 return
		  }
		  
		  do {
			 let result = try JSONDecoder().decode(T.self, from: data)
			 completion(.success(result))
		  } catch let error as DecodingError {
			 completion(.failure(.decodingError(error)))
		  } catch {
			 completion(.failure(.anyError))
		  }
	   }.resume()
    }
    
    private func makeURL(apiManager: INetworkManager) -> URL? {
	   return URL(string: .baseURL + apiManager.request)
    }
    
    private func makeRequest(url: URL, apiManager: INetworkManager) -> URLRequest {
	   var request = URLRequest(url: url)
	   request.httpMethod = apiManager.method
	   return request
    }
}

//MARK: - NetworkApiDispatcher

final class NetworkDispatcher: INetworkDispatcher {
    func fetchHotels(
	   completion: @escaping (Result<BHotelData, NetworkError>) -> Void
    ) {
	   let apiRouter: NetworkManager = .hotel
	   fetchData(apiManager: apiRouter, completion: completion)
    }
    
    func fetchRooms(
	   completion: @escaping (Result<BRoomData, NetworkError>) -> Void
    ) {
	   let apiRouter: NetworkManager = .rooms
	   fetchData(apiManager: apiRouter, completion: completion)
    }
    
    func fetchBooking(
	   completion: @escaping (Result<BookingData, NetworkError>) -> Void
    ) {
	   let apiRouter: NetworkManager = .booking
	   fetchData(apiManager: apiRouter, completion: completion)
    }
}
