//
//  BValidationBlock.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 05.09.2023.
//

import SwiftUI

struct BValidationBlock: View {
    @State private var phoneNumber = ""
    @State private var email = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
        VStack(alignment: .leading, spacing: 0) {
            Text("Номер телефона")
                .font(.subheadline)
                .foregroundColor(Color("PaleGray"))
            
            BValidationTelephone()
        }
        .padding()
          
            VStack(alignment: .leading, spacing: 0){
                Text("Почта")
                    .font(.subheadline)
                    .foregroundColor(Color("PaleGray"))
                
                TextField("example@mail.com", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .foregroundColor(.black)
                
                Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
                    .font(.footnote)
                    .foregroundColor(Color("PaleGray"))
                    
            }
            .padding()
        }
    }
}





struct BValidationBlock_Previews: PreviewProvider {
    static var previews: some View {
        BValidationBlock()
    }
}
