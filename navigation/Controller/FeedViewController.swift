//
//  FeedViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 17.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    private lazy var button1: UIButton = {
        var button1 = UIButton()
        button1.setTitle("Button 1", for: .normal)
        button1.setTitleColor(.blue, for: .normal)
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        return button1
    }()
    
    private lazy var button2: UIButton = {
        var button2 = UIButton()
        button2.setTitle("Button 2", for: .normal)
        button2.setTitleColor(.red, for: .normal)
        button2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        return button2
    }()
    
    private let stackViewButtons: UIStackView = {
        let UIStackView = UIStackView()
        UIStackView.axis = .vertical
        UIStackView.spacing = 10
        UIStackView.translatesAutoresizingMaskIntoConstraints = false
        return UIStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "Feed"
        addSubviews()
        setupContraints()
        view.addSubview(stackViewButtons)
    }
    
    private func addSubviews() {
        
        view.addSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(button1)
        stackViewButtons.addArrangedSubview(button2)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            stackViewButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func button1Pressed() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    @objc func button2Pressed() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}

