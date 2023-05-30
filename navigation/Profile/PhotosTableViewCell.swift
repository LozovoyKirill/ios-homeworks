//
//  PhotosTableViewCell.swift
//  navigation
//
//  Created by Кирилл Левинсон on 24.05.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    var photoImage1 = UIImageView()
    var photoImage2 = UIImageView()
    var photoImage3 = UIImageView()
    var photoImage4 = UIImageView()
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        addFourImage()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage1.image = nil
        photoImage2.image = nil
        photoImage3.image = nil
        photoImage4.image = nil
        titleLable.text = nil
        arrowImage.image = nil
    }
    
    private func addFourImage() {
        photoImage1 = addPhoto (nameImageView: "photoImage1", nameimage: "photo1" )
        photoImage2 = addPhoto (nameImageView: "photoImage2", nameimage: "photo2" )
        photoImage3 = addPhoto (nameImageView: "photoImage3", nameimage: "photo3" )
        photoImage4 = addPhoto (nameImageView: "photoImage4", nameimage: "photo4" )
    }
    
    private func addSubview(){
        [photoImage1, photoImage2, arrowImage, photoImage3, photoImage4, titleLable, contentWhiteView].forEach {
            contentView.addSubview($0)
        }
    }
    private func setupContraints() {
        
        let imageSize: CGFloat = contentView.frame.width / 4
        
        NSLayoutConstraint.activate([
            
            //             contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            //            titleLable
            titleLable.topAnchor.constraint(equalTo: contentWhiteView.topAnchor ,constant: 12),
            titleLable.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor,constant: 12),
            
            //            photoImage1
            photoImage1.widthAnchor.constraint(equalToConstant: imageSize),
            photoImage1.heightAnchor.constraint(equalToConstant: imageSize),
            photoImage1.topAnchor.constraint(equalTo: titleLable.bottomAnchor,constant: 12),
            photoImage1.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor,constant: 12),
            photoImage1.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -12),

            //            photoImage2
            photoImage2.widthAnchor.constraint(equalToConstant: imageSize),
            photoImage2.heightAnchor.constraint(equalToConstant: imageSize),
            photoImage2.topAnchor.constraint(equalTo: titleLable.bottomAnchor,constant: 12),
            photoImage2.leadingAnchor.constraint(equalTo: photoImage1.trailingAnchor,constant: 8),
            photoImage2.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -12),
            
            //            photoImage3
            photoImage3.widthAnchor.constraint(equalToConstant: imageSize),
            photoImage3.heightAnchor.constraint(equalToConstant: imageSize),
            photoImage3.topAnchor.constraint(equalTo: titleLable.bottomAnchor,constant: 12),
            photoImage3.leadingAnchor.constraint(equalTo: photoImage2.trailingAnchor,constant: 8),
            photoImage3.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -12),
            
            //            photoImage4
            photoImage4.widthAnchor.constraint(equalToConstant: imageSize),
            photoImage4.heightAnchor.constraint(equalToConstant: imageSize),
            photoImage4.topAnchor.constraint(equalTo: titleLable.bottomAnchor,constant: 12),
            photoImage4.leadingAnchor.constraint(equalTo: photoImage3.trailingAnchor,constant: 8),
            photoImage4.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -12),
            
            //            arrowImage
            arrowImage.widthAnchor.constraint(equalToConstant: 30),
            arrowImage.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -12),
            arrowImage.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor)
        ])
    }
}

extension PhotosTableViewCell {
    func addPhoto(nameImageView: String, nameimage: String) -> UIImageView {
        let nameImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 6
            imageView.image = UIImage(named: nameimage)
            imageView.clipsToBounds = true
            return imageView
        }()
        return nameImageView
    }
}

