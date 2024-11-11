//
//  KeyPadButton.swift
//  NBC_Calculator
//
//  Created by 전성규 on 11/11/24.
//

import UIKit

final class KeyPadButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 30.0)
        layer.cornerRadius = 80.0 / 2
        setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KeyPadButton {
    private func setBackgroundColor() {
        guard let title = self.titleLabel?.text else { return }
        guard Int(title) != nil else {
            backgroundColor = .orange
            return
        }
        
        backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
    }
}

#if DEBUG

import SwiftUI

struct KeyPadButtonButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadButtonButton_Presentable()
            .frame(
                width: 80.0,
                height: 80.0,
                alignment: .center)
    }
    
    struct KeyPadButtonButton_Presentable: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            KeyPadButton(title: "2")
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
}

#endif
