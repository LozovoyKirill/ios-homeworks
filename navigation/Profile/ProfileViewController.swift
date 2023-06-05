//
//  ProfileViewController.swift
//  navigation
//
//  Created by Кирилл Левинсон on 17.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myPost = Post.make()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    public func openTapAction() {
        openAvatar()
    }
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    
    private var leadingAvatarView = NSLayoutConstraint()
    
    private var trailingAvatarView = NSLayoutConstraint()
    
    private var topAvatarView = NSLayoutConstraint()
   
    private var widthAvatarView = NSLayoutConstraint()
    
    private var heightAvatarView = NSLayoutConstraint()
    
//    private var avatarView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .blue
//        return view
//    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true//view.alpha = 0
        
        return view
    }()
    
    private lazy var openedAvatarView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = UIColor.black
        imageView.image = UIImage(named: "Kot-hipster1")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openAvatar)))
        
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let buttonSizeConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium, scale: .default)
        let buttonImage = UIImage(systemName: "xmark.app", withConfiguration: buttonSizeConfig)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(buttonImage, for: .normal)
        button.tintColor = UIColor.white
        // button.alpha = 0.0
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClose)))
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupConstraints()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.systemGray6
        navigationController?.navigationBar.isHidden = true
    }
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(backgroundView)
        view.addSubview(openedAvatarView)
        view.addSubview(closeButton)
        //
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        //openedAvatarView
        
        leadingAvatarView = openedAvatarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16)
        widthAvatarView = openedAvatarView.widthAnchor.constraint(equalToConstant: 100)
        heightAvatarView = openedAvatarView.heightAnchor.constraint(equalToConstant: 100)
        topAvatarView = openedAvatarView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16)
        NSLayoutConstraint.activate([leadingAvatarView, widthAvatarView, heightAvatarView, topAvatarView])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            //animation
            
            
            backgroundView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: screenHeight),
            
            closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            //
            
        ])
    }
    

    @objc func openAvatar() {
        
    }
    
    @objc func tapClose() {UIView.animateKeyframes(withDuration: 0.6, delay: 0.0) {
        
    }
    }
}
    
    extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard section == 1 else {return 1}
            return  myPost.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if indexPath.section == 0  {
                let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
                return cell
                
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
                cell.setupCell(model: myPost[indexPath.row])
                
                return cell
            }
            return UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0 {
                return ProfileHeaderView()
            } else {
                return nil
            }
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return 225
            } else {
                return 0
            }
        }
        // высота ячейки
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                return 160
            }
            return tableView.rowHeight
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let photosViewController = PhotosViewController()
            if indexPath.section == 0 {
                navigationController?.pushViewController(photosViewController, animated: true)
            }
        }
    }

