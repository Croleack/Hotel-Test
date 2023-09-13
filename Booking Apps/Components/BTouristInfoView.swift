//
//  BTouristInfoView.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 03.09.2023.
//

import SwiftUI

struct BTouristInfoView: View {
    @ObservedObject var viewModel: BBookingViewModel
    @State private var showAlert = false
    @State private var navigateToNextScreen = false
    
    init(viewModel: BBookingViewModel) {
	   self.viewModel = viewModel
    }
    
    var body: some View {
	   
	   VStack(alignment: .leading, spacing: 20) {
		  VStack {
			 
			 HStack {
				Text("Тур")
				    .foregroundColor(Color("PaleGray"))
				Spacer()
				Text("\(viewModel.bookingData?.tourPrice ?? 0)₽")
			 }
			 HStack {
				Text("Топливный сбор")
				    .foregroundColor(Color("PaleGray"))
				Spacer()
				Text("\(viewModel.bookingData?.fuelCharge ?? 0)₽")
			 }
			 HStack {
				Text("Сервисный сбор")
				    .foregroundColor(Color("PaleGray"))
				Spacer()
				Text("\(viewModel.bookingData?.serviceCharge ?? 0)₽")
			 }
			 HStack {
				Text("К оплате")
				    .foregroundColor(Color("PaleGray"))
				Spacer()
				Text("\(viewModel.totalAmount)₽")
				    .foregroundColor(.blue)
			 }
		  }
		  
		  NavigationLink(
			 destination: BPaidView(),
			 label: {
				Text("Оплатить \(viewModel.totalAmount)₽")
				    .font(.headline)
				    .foregroundColor(.white)
				    .frame(maxWidth: .infinity)
				    .frame(height: 50)
				    .background(Color.blue)
				    .cornerRadius(8)
			 }
		  ).simultaneousGesture(TapGesture().onEnded{
			 if areAllTouristsFilled() {
				navigateToNextScreen = true
				showAlert = false
			 } else {
				showAlert = true
			 }
		  }).disabled(!areAllTouristsFilled())
	   }
	   .padding()
	   .frame(maxHeight: .infinity)
	   .alert(isPresented: $showAlert) {
		  //TODO: -I used disabled because my button stopped being active after an input error. I'll come back here later
		  Alert(title: Text("Ошибка"), message: Text("Пожалуйста, заполните все поля"), dismissButton: .default(Text("OK")))
	   }
    }
    
    func areAllTouristsFilled() -> Bool {
	   for tourist in viewModel.tourists {
		  if !tourist.isFilled() {
			 return false
		  }
	   }
	   return true
    }
}

struct Tourist {
    var name = ""
    var surname = ""
    var passport = ""
    var birthDate = ""
    var citizenship = ""
    var passportValidityPeriod = ""
    
    
    func isFilled() -> Bool {
	   return !name.isEmpty && !passport.isEmpty && !birthDate.isEmpty && !surname.isEmpty && !citizenship.isEmpty && !passportValidityPeriod.isEmpty
    }
}

struct TouristTabView: View {
    @Binding var tourist: Tourist
    @State private var isExpanded = true
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 10) {
		  
		  DisclosureGroup(
			 .init(""),
			 isExpanded: $isExpanded,
			 content: {
				Text("Турист")
				    .font(.subheadline)
				
				TextField("Имя", text: $tourist.name)
				    .textFieldStyle(RoundedBorderTextFieldStyle())
				
				TextField("Фамилия", text: $tourist.surname)
				    .textFieldStyle(RoundedBorderTextFieldStyle())
				
				TextField("Дата рождения", text: $tourist.birthDate)
				    .textFieldStyle(RoundedBorderTextFieldStyle())
				
				TextField("Гражданство", text: $tourist.citizenship)
				    .textFieldStyle(RoundedBorderTextFieldStyle())
				
				TextField("Номер загранпаспорта", text: $tourist.passport)
				    .textFieldStyle(RoundedBorderTextFieldStyle())
				
				TextField("Срок действия загранпаспорта", text: $tourist.passportValidityPeriod)
				    .textFieldStyle(RoundedBorderTextFieldStyle())
			 })
	   }
	   .padding()
    }
}

struct TouristInfoView_Previews: PreviewProvider {
    static var previews: some View {
	   let viewModel = BBookingViewModel()
	   return BTouristInfoView(viewModel: viewModel)
    }
}
