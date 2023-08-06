//
//  HomeView.swift
//  LoginDemo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("goHome") var goHome = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                goHome = false
            }
    }
}

#Preview {
    HomeView()
}
