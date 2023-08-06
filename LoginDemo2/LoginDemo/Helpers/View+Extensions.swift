//
//  View+Extensions.swift
//  SwiftUI_iOS17_Demo
//
//  Created by Lurich on 2023/8/6.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self.disabled(condition).opacity(condition ? 0.5 : 1)
    }
}

extension View {
    func getScreenRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func frame(_ size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
}


func getSafeArea() -> UIEdgeInsets {
    let safeArea = getWindow().safeAreaInsets
    return safeArea
}

func getSafeAreaRect() -> CGRect {
    let safeArea = getWindow().safeAreaInsets
    let bounds = getWindow().bounds
    return CGRect(x: safeArea.left, y: safeArea.top, width: bounds.width - safeArea.left - safeArea.right, height: bounds.height - safeArea.top - safeArea.right)
}

//MARK: ROOT View Controller
func getWindow() -> UIWindow {
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
        return .init()
    }
    guard let window = screen.windows.first else {
        return .init()
    }
    return window
}
