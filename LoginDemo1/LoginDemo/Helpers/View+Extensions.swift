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
