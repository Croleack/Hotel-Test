//
//  BNumberView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct BNumberView: View {
    @ObservedObject var viewModel: BNumberViewModel
    
    //MARK: - init
    init(viewModel: BNumberViewModel) {
	   self.viewModel = viewModel
    }
    
    var body: some View {
	   VStack {
		  BRoomDetailView(rooms: viewModel.roomData?.rooms)
	   } .toolbar  {
		  ToolbarItem(placement: .navigationBarLeading) {
			 BBackButton(text: "\(viewModel.hotelName) ")
		  }
	   }
    }
}

