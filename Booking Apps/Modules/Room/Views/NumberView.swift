//
//  BNumberView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct NumberView: View {
    @ObservedObject var viewModel: NumberViewModel
    
    //MARK: - init
    init(viewModel: NumberViewModel) {
	   self.viewModel = viewModel
    }
    
    var body: some View {
	   VStack {
		  RoomDetailView(rooms: viewModel.roomData?.rooms)
	   } .toolbar  {
		  ToolbarItem(placement: .navigationBarLeading) {
			 BackButton(text: "\(viewModel.hotelName) ")
		  }
	   }
    }
}

