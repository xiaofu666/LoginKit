//
//  SignUpView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct SignUpView: View {
    @Binding var showSignup: Bool
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var askOTP: Bool = false
    @State private var OTPText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                withAnimation(.snappy) {
                    showSignup.toggle()
                }
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 15)
            
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTextField(systemIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTextField(systemIcon: "person", hint: "Full Name", isPassword: false, value: $fullName)
                    .padding(.top, 5)
                
                CustomTextField(systemIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                GradientButton(title: "Continue", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || fullName.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6, content: {
                Text("Already have an account?")
                
                Button("Login") {
                    withAnimation(.snappy) {
                        showSignup.toggle()
                    }
                }
                .fontWeight(.bold)
                .tint(.yellow)
            })
            .font(.callout)
            .hSpacing()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $askOTP, content: {
            OTPView(OTPText: $OTPText) {
                // 注册成功
            }
            .presentationDetents([.height(300)])
            .presentationCornerRadius(30)
        })
    }
}

#Preview {
    ContentView()
}
