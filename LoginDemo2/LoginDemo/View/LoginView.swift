//
//  LoginView1.swift
//  LoginPageUICarouselAnimated
//
//  Created by Lurich on 2021/6/14.
//

import SwiftUI

struct LoginView: View {
    
    @State var maxCircleHeight: CGFloat = 0
    @State var showSignUp = false
    
    var body: some View {
        VStack {
            
            //top rings view ...
            //max height will be width of the screen
            
            // why geometry reader?
            //since height will vary for different screens...
            //so in order to get the height we used....
            GeometryReader { proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    maxCircleHeight = height
                }
                
                return AnyView(
                
                    ZStack {
                        
                        Circle()
                            .fill(Color("Dark"))
                            .offset(x: getScreenRect().width / 2, y: -height / 1.3)
                        
                        Circle()
                            .fill(Color("Dark"))
                            .offset(x: -getScreenRect().width / 2, y: -height / 1.5)
                    
                        Circle()
                            .fill(Color("lightBlue"))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                    
                    
                    }
                )
            }
            .frame(maxHeight: getScreenRect().width)
            
            
            ZStack {
                
                // transitions...
                if showSignUp {
                    
                    SignUp()
                        .transition(.move(edge: .trailing))
                }
                else {
                    
                    Login()
                        .transition(.move(edge: .trailing))
                }
                
            }
            //removing unwanted space...
            .padding(.top, -maxCircleHeight / 1.6)
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .overlay(alignment: .bottom, content: {
            HStack {
                Text(showSignUp ?  "New Member" : "Already Member")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            
                Button {
                    withAnimation {
                        showSignUp.toggle()
                    }
                } label: {
                    Text(showSignUp ? "sign in" : "sign up")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightBlue"))
                }
            }
            .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 0)
        })
        .background(
        
            //bottom rings...
            HStack {
                
                Circle()
                    .fill(Color("lightBlue"))
                    .frame(width: 80, height: 80)
                    .offset(x: -30, y: getScreenRect().height < 750 ? 10 : 0)
                
                Spacer()
                
                Circle()
                    .fill(Color("Dark"))
                    .frame(width: 110, height: 110)
                    .offset(x: 40, y: 20)
                    
            }
            .offset(y: getSafeArea().bottom + 30)
            
            ,alignment: .bottom
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
