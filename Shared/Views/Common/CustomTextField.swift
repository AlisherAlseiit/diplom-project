//
//  CustomTextField.swift
//  diplom-project (iOS)
//
//  Created by Алишер Алсейт on 01.11.2021.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var field: String
    var iconName: String
    var placeHolder: String
    var isSecure:Bool = false
    var title: String
    var body: some View {
        HStack(spacing: 15) {
            TextFieldIcon(iconName: iconName)
            
            if !isSecure {
            TextField(title, text: $field)
                .colorScheme(.dark)
                .foregroundColor(Color.white.opacity(0.7))
                .submitLabel(.next)
            } else {
                SecureField(title, text: $field)
                    .colorScheme(.dark)
                    .foregroundColor(Color.white.opacity(0.7))
                    .autocapitalization(.none)
                    .textContentType(.password)
            }
            
        }
        .frame(height: 52)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white,
                        lineWidth: 1)
                .blendMode(.overlay)
        )
        .background(
            Color("secondaryBackground")
                .cornerRadius(16)
                .opacity(0.8)
        )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(field: .constant(""), iconName: "envelope.open.fill", placeHolder: "", title: "Email")
    }
}
