//
//  ProfileViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 17.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let newPostButton: UIButton = {
        let button = UIButton (type: .system)
        button.setTitle("Open post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        
        addSubviews()
        setupConstraits()
        
        func addSubviews() {
            view.addSubview(profileHeaderView)
            view.addSubview(newPostButton)
        }
        
        func setupConstraits() {
            let safeAreaGuide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
                profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
                profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor,constant: 0),
                profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
                
                newPostButton.heightAnchor.constraint(equalToConstant: 50),
                newPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
                newPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
                newPostButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor,constant: 0),
            ])
        }
        
    }
}

