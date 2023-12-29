//
//  NetworkError.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 18.12.2023.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case urlError(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case noData
    case anyError
    
    var localizedDescription: String {
	   switch self {
	   case .urlError(let error):
		  return "Ошибка с URL: \(error.localizedDescription)"
	   case .decodingError(let error):
		  return "Не удалось декодировать данные: \(error.localizedDescription)"
	   case .responseError(let error):
		  return "Неверный код ответа: \(error)"
	   case .noData:
		  return "Не удалось найти данные"
	   case .anyError:
		  return "Произошла неизвестная ошибка"
	   }
    }
}
