//
//  ProfileHeaderView.swift
//  navigation
//
//  Created by Кирилл Левинсон on 21.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    //imgeView
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "Kot-hipster1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //nameLabel
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
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something..."
        statusLabel.isUserInteractionEnabled = true
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnyViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupAnyViews(){
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            avatarImageView.widthAnchor.constraint(
                equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(
                equalToConstant: 100),
            avatarImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16),
            avatarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16),
            
            fullNameLabel.widthAnchor.constraint(
                equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(
                equalTo: topAnchor ,
                constant: 16),
            fullNameLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: 20),
            fullNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -27),
            fullNameLabel.heightAnchor.constraint(
                equalToConstant: 16),
            
            statusLabel.topAnchor.constraint(
                equalTo: fullNameLabel.bottomAnchor,
                constant: 5),
            statusLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: 20),
            statusLabel.widthAnchor.constraint(equalToConstant: 160),
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
            statusTextField.widthAnchor.constraint(
                equalToConstant: 200),
            statusTextField.heightAnchor.constraint(
                equalToConstant: 40),
            statusTextField.topAnchor.constraint(
                equalTo: statusLabel.bottomAnchor,
                constant: 0),
            statusTextField.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: 20),
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
                equalTo: fullNameLabel.trailingAnchor),
        ])
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
