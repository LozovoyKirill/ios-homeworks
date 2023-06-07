//
//  ProfileHeaderView.swift
//  navigation
//
//  Created by Кирилл Левинсон on 21.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "Kot-hipster1")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var backgroundView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark.app")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .black
        button.isHidden = true
        button.addTarget(self, action: #selector(backAnimation), for: .touchUpInside)
        
        return button
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton(type: .system)
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return setStatusButton
    }()
    
    //titleStatus
    private  var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something..."
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return statusLabel
    }()
    //textField
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.leftViewMode = .always//отступ
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.placeholder = "Enter your status..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        return textField
    }()
    
    private var leadingAvatarView = NSLayoutConstraint()
    private var topAvatarView = NSLayoutConstraint()
    private var widthAvatarView = NSLayoutConstraint()
    private var heightAvatarView = NSLayoutConstraint()
    
    private var widthBigAvatar = NSLayoutConstraint()
    private var heightBigAvatar = NSLayoutConstraint()
    private var topBigAvatar = NSLayoutConstraint()
    private var leadingBigAvatar = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnyViews()
        setupConstraints()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupAnyViews(){
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(backgroundView)
        addSubview(closeButton)
        backgroundView.addSubview(avatarImageView)
    }
    
    func setupConstraints() {
        
        //let safeArea = safeAreaLayoutGuide
        leadingAvatarView = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        widthAvatarView = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        heightAvatarView = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        topAvatarView = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        
        widthBigAvatar = backgroundView.widthAnchor.constraint(equalToConstant: 100)
        heightBigAvatar = backgroundView.heightAnchor.constraint(equalToConstant: 100)
        topBigAvatar = backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        leadingBigAvatar = backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([leadingAvatarView, widthAvatarView, heightAvatarView, topAvatarView, widthBigAvatar,heightBigAvatar,topBigAvatar, leadingBigAvatar])
        
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            fullNameLabel.widthAnchor.constraint(
                equalToConstant: 200),
            fullNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 136),
            fullNameLabel.heightAnchor.constraint(
                equalToConstant: 16),
            
            statusLabel.topAnchor.constraint(
                equalTo: fullNameLabel.bottomAnchor,
                constant: 5),
            statusLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 136),
            statusLabel.widthAnchor.constraint(equalToConstant: 160),
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            
           statusTextField.heightAnchor.constraint(
                equalToConstant: 40),
            statusTextField.topAnchor.constraint(
                equalTo: statusLabel.bottomAnchor,
                constant: 0),
            statusTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 136),
            statusTextField.trailingAnchor.constraint(
                equalTo: fullNameLabel.trailingAnchor, constant: -16),
            
            setStatusButton.heightAnchor.constraint(
                equalToConstant: 50),
            setStatusButton.topAnchor.constraint(
                equalTo: statusTextField.bottomAnchor,
                constant: 15),
            
            setStatusButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16),
            setStatusButton.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openAvatarView))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func openAvatarView() {
        self.setStatusButton.isEnabled = false
        self.statusTextField.isEnabled = false
        self.leadingBigAvatar.constant = 0
        self.topBigAvatar.constant = 0
        self.widthBigAvatar.constant = UIScreen.main.bounds.width
        self.heightBigAvatar.constant = UIScreen.main.bounds.height
        
        UIView.animate(withDuration: 0.5) {
            
            self.topAvatarView.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 2
            self.leadingAvatarView.constant = 0
            self.heightAvatarView.constant = UIScreen.main.bounds.width
            self.widthAvatarView.constant = UIScreen.main.bounds.width
            self.avatarImageView.layer.cornerRadius = 0
            self.backgroundView.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.5)
            self.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.isHidden = false
                self.closeButton.alpha = 1
            }
        }
    }
    
    @objc func backAnimation() {
        self.setStatusButton.isEnabled = true
        self.statusTextField.isEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
            
        } completion: { _ in
            self.closeButton.isHidden = true
            
            UIView.animate(withDuration: 0.5) {
                self.backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0)
                
                self.widthAvatarView.constant = 100
                self.heightAvatarView.constant = 100
                self.leadingAvatarView.constant = 16
                self.topAvatarView.constant = 16
                self.avatarImageView.layer.cornerRadius = 50
                
                self.layoutIfNeeded()
            } completion: { _ in
                self.widthBigAvatar.constant = 100
                self.heightBigAvatar.constant = 100
                self.leadingBigAvatar.constant = 16
                self.topBigAvatar.constant = 16
            }
        }
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        if statusLabel.text  == "" {
            statusLabel.text = "Enter the status..."
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let titleStatus = textField.text {
            statusText = titleStatus
        }
    }
}
