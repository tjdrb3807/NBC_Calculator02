//
//  MainViewController.swift
//  NBC_Calculator
//
//  Created by 전성규 on 11/11/24.
//

final class MainViewController: BaseViewController {
    internal lazy var label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.numberOfLines = 1
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60.0)
        
        return label
    }()
    
    private lazy var keyPadStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10.0
        stackView.backgroundColor = .black
        
        [KeyPadStackView(
            subView: [
                KeyPadButton(title: "7"),
                KeyPadButton(title: "8"),
                KeyPadButton(title: "9"),
                KeyPadButton(title: "+"),
            ]),
         KeyPadStackView(
            subView: [
                KeyPadButton(title: "4"),
                KeyPadButton(title: "5"),
                KeyPadButton(title: "6"),
                KeyPadButton(title: "-"),
            ]),
         KeyPadStackView(
            subView: [
                KeyPadButton(title: "1"),
                KeyPadButton(title: "2"),
                KeyPadButton(title: "3"),
                KeyPadButton(title: "*"),
            ]),
         KeyPadStackView(
            subView: [
                KeyPadButton(title: "AC"),
                KeyPadButton(title: "0"),
                KeyPadButton(title: "="),
                KeyPadButton(title: "/"),
            ]),
        ].forEach {
            $0.snp.makeConstraints { $0.height.equalTo(80.0) }
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyPadStackView.arrangedSubviews.forEach {
            guard let stackView = $0 as? KeyPadStackView else { return }
            
            stackView.arrangedSubviews.forEach {
                guard let button = $0 as? KeyPadButton else { return }
                button.addTarget(self, action: #selector(touchButton(_:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func touchButton(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
    }
    
    override func addSubComponents() {
        [label, keyPadStackView].forEach { view.addSubview($0) }
    }
    
    override func setupConstraints() {
        self.makeLabelConstraints()
        self.makeKeyPadStackViewConstratins()
    }
}

// MARK: Make Constraints
extension MainViewController {
    private func makeLabelConstraints() {
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100.0)
            $0.leading.trailing.equalToSuperview().inset(30.0)
            $0.height.equalTo(100.0)
        }
    }
    
    private func makeKeyPadStackViewConstratins() {
        keyPadStackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60.0)
            $0.width.equalTo(350.0)
            $0.centerX.equalToSuperview()
        }
    }
}

#if DEBUG

import SwiftUI

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewController_Presentable()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct MainViewController_Presentable: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController { MainViewController() }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    }
}

#endif
