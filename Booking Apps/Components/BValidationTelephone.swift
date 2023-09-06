//
//  BValidationTelephone.swift
//  Booking Apps
//
//  Created by Enzhe Gaysina on 05.09.2023.
//

import SwiftUI

struct BValidationTelephone: View {
    
    let widthStroke: CGFloat = 1

    var body: some View {

            NumberPhoneMaskView()
                .frame(height: 50)
        
//
    }
}

struct NumberPhoneMaskView: View {

    let maskPhone = "+X-XXX-XXX-XX-XX"
    @State var text = ""

    var body: some View {
        VStack {
            let textChangedBinding = Binding<String>(
                get: {
                    FilterNumberPhone.format(with: self.maskPhone, phone: self.text)
                },

                set: { self.text = $0 }
            )
            TextFieldContainer("+7", text: textChangedBinding)
        }
    }
}

struct TextFieldContainer: UIViewRepresentable {
    private var placeholder: String
    private var text: Binding<String>

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<TextFieldContainer>) -> UITextField {

        let innertTextField = UITextField(frame: .zero)
        innertTextField.placeholder = placeholder
        innertTextField.text = text.wrappedValue
        innertTextField.delegate = context.coordinator
        innertTextField.keyboardType = .numberPad

        context.coordinator.setup(innertTextField)

        return innertTextField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<TextFieldContainer>) {
        uiView.text = self.text.wrappedValue
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldContainer

        init(_ textFieldContainer: TextFieldContainer) {
            self.parent = textFieldContainer
        }

        func setup(_ textField: UITextField) {
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }

        @objc func textFieldDidChange(_ textField: UITextField) {
            self.parent.text.wrappedValue = textField.text ?? ""

            let newPosition = textField.endOfDocument
            textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
        }
    }
}

class FilterNumberPhone: ObservableObject {

    static func format(with mask: String, phone: String) -> String {
        var numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)

        if !numbers.hasPrefix("79") {
            numbers = "79" + numbers
        }

        var result = ""
        var index = numbers.startIndex

        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
struct BValidationTelephone_Previews: PreviewProvider {
    static var previews: some View {
        BValidationTelephone()
    }
}
