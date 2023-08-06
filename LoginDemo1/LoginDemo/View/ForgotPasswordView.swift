//
//  ForgotPasswordView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showResetView: Bool
    @State private var emailID: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 15)
            
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter your Email ID so that we can send the reset link.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTextField(systemIcon: "at", hint: "Email ID", value: $emailID)
                
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty)
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
