//
//  PhotoCollectionViewCell.swift
//  navigation
//
//  Created by Кирилл Левинсон on 25.05.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        contentView.backgroundColor = .systemGray2
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    func setupSell(photo: PhotoPost){
        
    }
}

