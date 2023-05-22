//
//  PostViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 12.04.2023.
//

import UIKit


class PostViewController: UIViewController {
    var post: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        infoButton()
        //navigationItem.title = post?.title
    }
    private func infoButton(){
        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(didTapInfo))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc private func didTapInfo() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
