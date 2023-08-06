//
//  Login.swift
//  LoginPageUICarouselAnimated
//
//  Created by Lurich on 2021/6/14.
//

import SwiftUI

struct Login: View {
    
    @State var email = ""
    @State var password = ""
    @AppStorage("goHome") var goHome = false
    
    var body: some View {
        
        VStack {
            
            Text("Sign In")
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
                //increaing font size and changing text color...
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("Dark"))
                    .padding(.top, 4)
                
                Divider()
            }
            .padding(.top, 25)
            
            //Forget Password
            Button {
                
            } label: {
                
                Text("Forgot password?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            //this line will reduce the use of unwanted hastack and spacers...
            //try to user this and reduce the code in swiftui
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            
            
            //next button...
            Button {
                goHome = true
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
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
