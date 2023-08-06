//
//  ContentView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignup: Bool = false
    @State private var isKeyboardShowing: Bool = false
    @AppStorage(.loginStatus) private var isLogin: Bool = false
    
    var body: some View {
        if (isLogin) {
            HomeView()
                .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.4)))
        } else {
            NavigationStack {
                LoginView(showSignup: $showSignup)
                    .navigationDestination(isPresented: $showSignup) {
                        SignUpView(showSignup: $showSignup)
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: { _ in
                        if !showSignup {
                            isKeyboardShowing = true
                        }
                    })
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
                        isKeyboardShowing = false
                    })
            }
            .transition(AnyTransition.scale.animation(.linear(duration: 0.4)))
            .overlay {
                CircleView()
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: isKeyboardShowing)
            }
            .onAppear() {
                isKeyboardShowing = false
            }
        }
    }
    
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardShowing ? 200 : 0))
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
