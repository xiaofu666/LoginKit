//
//  VerifyCode.swift
//  SwiftUIDemo
//
//  Created by Lurich on 2023/3/1.
//

import SwiftUI

struct VerifyCode: View {
    @Binding var code: String
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<6, id: \.self) { index in
                    CodeTextBox(index)
                }
            }
            .background {
                TextField("",text: $code.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    @ViewBuilder
    func CodeTextBox(_ index: Int) -> some View {
        ZStack {
            if code.count > index {
                let startIndex = code.startIndex
                let charIndex = code.index(startIndex, offsetBy: index)
                let charToString = String(code[charIndex])
                Text(charToString)
            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let status = isKeyboardShowing && code.count == index
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? .black : .gray, lineWidth:status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.3), value: status)
        }
        .frame(maxWidth: .infinity)
        
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
