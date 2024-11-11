//
//  BaseViewController.swift
//  NBC_Calculator
//
//  Created by 전성규 on 11/11/24.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubComponents()
        self.setupConstraints()
    }
    
    func addSubComponents() {
        // Override code..
    }
    
    func setupConstraints() {
        // Overried code..
    }
}
