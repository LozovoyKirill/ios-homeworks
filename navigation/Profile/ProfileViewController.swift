//
//  ProfileViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 17.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               ])
               profileHeaderView.frame = view.frame
    }
}
