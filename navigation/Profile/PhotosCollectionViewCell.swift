//
//  PhotoCollectionViewCell.swift
//  navigation
//
//  Created by Кирилл Левинсон on 25.05.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let imagePostView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //настройка контента
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(imagePostView)
    }
    
    func setupCell(model: PhotoPost) {
        imagePostView.image = UIImage(named: model.photoImage)
    }
    
        private func setConstraits() {
    
            NSLayoutConstraint.activate([
                imagePostView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imagePostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imagePostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                imagePostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    }

