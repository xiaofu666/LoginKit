//
//  PasswordResetView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct PasswordResetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 15)
            
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            VStack(spacing: 25) {
                CustomTextField(systemIcon: "lock", hint: "Password", value: $password)
                CustomTextField(systemIcon: "lock", hint: "Confirm Password", value: $confirmPassword)
                    .padding(.top, 5)
                
                GradientButton(title: "Reset", icon: "arrow.right") {
                    dismiss()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
            }
            .padding(.top, 20)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    ContentView()
}

