//
//  FeedViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 17.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News feed"
        view.backgroundColor = UIColor.orange
        let postButton = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(didTapPost))
        navigationItem.rightBarButtonItem = postButton
    }
    
    @objc private func didTapPost() {
        _ = Post(title: "New post")
        let postVC = PostViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(postVC, animated: true)
    }
}
