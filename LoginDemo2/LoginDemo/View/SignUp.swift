//
//  SignUp.swift
//  LoginPageUICarouselAnimated
//
//  Created by Lurich on 2021/6/14.
//

import SwiftUI

struct SignUp: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var keyboardHeight: CGFloat = 0
    @State var textFieldOffsetY: CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            let rect = proxy.frame(in: .global)
            VStack {
                
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Dark"))
                    //letter Spacing
                    .kerning(1.9)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //Email add Password...
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("User Name")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        
                    TextField("Email ID", text: $email)
                    //increasing font size and changing text color...
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("Dark"))
                        .padding(.top, 4)
                    
                    Divider()
                }
                .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Password")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        
                    SecureField("123456", text: $password)
                    //increasing font size and changing text color...
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("Dark"))
                        .padding(.top, 4)
                    
                    Divider()
                }
                .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Confirm Password")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        
                    SecureField("123456", text: $confirmPassword)
                    //increasing font size and changing text color...
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("Dark"))
                        .padding(.top, 4)
                    
                    Divider()
                }
                .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Email")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        
                    SecureField("email", text: $confirmPassword)
                    //increasing font size and changing text color...
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("Dark"))
                        .padding(.top, 4)
                    
                    Divider()
                }
                .padding(.top, 25)
                
                
                //next button...
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Dark"))
                        .clipShape(Circle())
                    //shadow
                        .shadow(color: Color("lightBlue").opacity(0.6), radius: 5, x: 0, y: 0)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)

            }
            .padding()
            .offset(y: rect.maxY > (getScreenHeight() - keyboardHeight) ? -(rect.maxY - (getScreenHeight() - keyboardHeight)) : 0)
            .ignoresSafeArea(.keyboard, edges: .all)
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { output in
                if let info = output.userInfo, let height = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
                    keyboardHeight = height
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                keyboardHeight = 0
            }
            .animation(.spring(), value: keyboardHeight)
        }
        
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
