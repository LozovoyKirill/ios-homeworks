//
//  PostViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 12.04.2023.
//

import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {
    var post: Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = post?.title
        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(didTapInfo))
        navigationItem.rightBarButtonItem = infoButton
        view.backgroundColor = UIColor.green
    }
    @objc private func didTapInfo() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
