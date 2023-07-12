//
//  CustomTableViewCell.swift
//  navigation
//
//  Created by Кирилл Левинсон on 22.05.2023.
//

import UIKit

protocol GetLikesDelegate: AnyObject {
    func getLikes(for model: inout[Post], indexPath: IndexPath)
}

final class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: GetLikesDelegate?
    private var indexPathCell = IndexPath()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var views: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        addTapLikesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // очищение ячейки для переиспользования
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = nil
        postImageView.image = nil
        descriptionLabel.text = nil
        likes.text = nil
        views.text = nil
    }
    
    func setupCell(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        views.text = "Views: \(model.views)"
        likes.text = "♥ Likes: \(model.likes)"
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addTapLikesLabel() {
        let tapLikesLabel = UITapGestureRecognizer(target: self, action: #selector(tapLikes))
        likes.addGestureRecognizer(tapLikesLabel)
    }
    
    @objc func tapLikes() {
        delegate?.getLikes(for: &myPost, indexPath: indexPathCell)
        likes.text = "♥ Likes: " + String(myPost[indexPathCell.row].likes)
    }
    
    func addSubviews() {
        [authorLabel, postImageView, descriptionLabel, likes, views].forEach {
            contentView.addSubview($0)
        }
    }
}

extension CustomTableViewCell {
    func setupConstraints() {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        
        NSLayoutConstraint.activate([
            
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: screenWidth),
            postImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            views.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            views.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            views.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            likes.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likes.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

