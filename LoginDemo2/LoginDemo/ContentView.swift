//
//  ContentView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("goHome") var goHome = false
    
    var body: some View {
        if goHome {
            HomeView()
                .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.4)))
        } else {
            LoginView()
                .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.4)))
        }
    }
}

#Preview {
    ContentView()
}
