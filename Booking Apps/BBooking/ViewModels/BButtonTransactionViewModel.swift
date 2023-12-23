//
//  BButtonTransactionViewModel.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 21.12.2023.
//

import Foundation

final class BButtonTransactionViewModel: ObservableObject {
    
    @Published var title: String
    
    init(title: String) {
	   self.title = title
    }
}
