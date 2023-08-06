//
//  HomeView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct HomeView: View {
    @AppStorage(.loginStatus) private var isLogin: Bool = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                withAnimation(.snappy) {
                    isLogin = false
                }
            }
    }
}

#Preview {
    HomeView()
}
