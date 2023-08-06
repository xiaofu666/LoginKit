//
//  OTPView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct OTPView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var OTPText: String
    var submit: () -> ()
    
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
            
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("An 6 digit code has bean sent to your Email ID.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                VerifyCode(code: $OTPText)
                
                GradientButton(title: "Submit", icon: "arrow.right") {
                    dismiss()
                    submit()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(OTPText.isEmpty)
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
