//
//  InfoViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 12.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Info"
        view.backgroundColor = .systemBackground
        
        let button = UIButton(type: .system)
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(didTapShowAlert), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc private func didTapShowAlert() {
        let alertController = UIAlertController(title: "Alert", message: "This is an alert message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("User tapped OK")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("User tapped Cancel")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
