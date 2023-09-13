//
//  BNumberView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 31.08.2023.
//

import SwiftUI

struct BNumberView: View {
    @ObservedObject var viewModel: BNumberViewModel
    @EnvironmentObject var coordinator: BCoordinator
    
    //MARK: - init
    init(viewModel: BNumberViewModel) {
	   self.viewModel = viewModel
    }
    
    var body: some View {
	   VStack {
		  BRoomDetailView(rooms: viewModel.roomData?.rooms)
	   }
    }
}
struct BNumberView_Previews: PreviewProvider {
    static var previews: some View {
	   let viewModel = BNumberViewModel()
	   return BNumberView(viewModel: viewModel)
    }
}
