//
//  LoginView.swift
//  SwiftUI_iOS17_Demo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct LoginView: View {
    @Binding var showSignup: Bool
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    @State private var showResetView: Bool = false
    @State private var askOTP: Bool = false
    @State private var OTPText: String = ""
    @AppStorage(.loginStatus) private var isLogin: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer(minLength: 0)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTextField(systemIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTextField(systemIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button("Forgot Password?") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.yellow)
                .hSpacing(.trailing)
                
                GradientButton(title: "Login", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6, content: {
                Text("Don't have an account?")
                
                Button("SignUp") {
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
        .sheet(isPresented: $showForgotPasswordView, content: {
            ForgotPasswordView(showResetView: $showResetView)
                .presentationDetents([.height(300)])
                .presentationCornerRadius(30)
        })
        .sheet(isPresented: $showResetView, content: {
            PasswordResetView()
                .presentationDetents([.height(350)])
                .presentationCornerRadius(30)
        })
        .sheet(isPresented: $askOTP, content: {
            OTPView(OTPText: $OTPText) {
                withAnimation(.snappy) {
                    isLogin = true
                }
            }
            .presentationDetents([.height(300)])
            .presentationCornerRadius(30)
        })
    }
}

#Preview {
    ContentView()
}
