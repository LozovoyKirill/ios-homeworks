//
//  Photo.swift
//  navigation
//
//  Created by Кирилл Левинсон on 24.05.2023.
//

import UIKit

struct PhotoPost {
    var photoImage: String
    
    static func makeArray() -> [PhotoPost] {
        var image = [PhotoPost]()
        image.append(PhotoPost(photoImage: "photo1"))
        image.append(PhotoPost(photoImage: "photo2"))
        image.append(PhotoPost(photoImage: "photo3"))
        image.append(PhotoPost(photoImage: "photo4"))
        image.append(PhotoPost(photoImage: "photo5"))
        image.append(PhotoPost(photoImage: "photo6"))
        image.append(PhotoPost(photoImage: "photo7"))
        image.append(PhotoPost(photoImage: "photo8"))
        image.append(PhotoPost(photoImage: "photo9"))
        image.append(PhotoPost(photoImage: "photo10"))
        image.append(PhotoPost(photoImage: "photo11"))
        image.append(PhotoPost(photoImage: "photo12"))
        image.append(PhotoPost(photoImage: "photo13"))
        image.append(PhotoPost(photoImage: "photo14"))
        image.append(PhotoPost(photoImage: "photo15"))
        image.append(PhotoPost(photoImage: "photo16"))
        image.append(PhotoPost(photoImage: "photo17"))
        image.append(PhotoPost(photoImage: "photo18"))
        image.append(PhotoPost(photoImage: "photo19"))
        image.append(PhotoPost(photoImage: "photo20"))

        return image

    }
}


