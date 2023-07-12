//
//  PhotoCollectionViewCell.swift
//  navigation
//
//  Created by Кирилл Левинсон on 25.05.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()
    
    private let imagePostView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraits()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagePostView.image = nil
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
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openImage))
        imagePostView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func openImage() {
        delegate?.didTapImageInCell(imagePostView.image, frameImage: imagePostView.frame, indexPath: indexPathCell)
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

