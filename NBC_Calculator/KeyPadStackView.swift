//
//  KeyPadStackView.swift
//  NBC_Calculator
//
//  Created by 전성규 on 11/11/24.
//

import UIKit

final class KeyPadStackView: UIStackView {
    init(subView buttons: [KeyPadButton]) {
        super.init(frame: .zero)
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        spacing = 10.0
        
        buttons.forEach { addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

import SwiftUI

struct KeyPadStackView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadStackView_Presentable()
            .frame(
                width: 350.0,
                height: 80.0,
                alignment: .center)
    }
    
    struct KeyPadStackView_Presentable: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            KeyPadStackView(subView: [
                KeyPadButton(title: "7"),
                KeyPadButton(title: "8"),
                KeyPadButton(title: "9"),
                KeyPadButton(title: "+"),
            ])
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
}

#endif

