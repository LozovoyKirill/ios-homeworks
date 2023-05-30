//
//  Post.swift
//  navigation
//
//  Created by Кирилл Левинсон on 22.05.2023.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int

    static func make() -> [Post] {
        [Post(author: "Apple Original Film", description: "Удивительная история о том, как игра «Тетрис», созданная советским программистом Алексеем Пажитновым, стала популярной во всем мире.", image: "tetris", likes: 50, views: 70),
         Post(author: "Apple Original Film", description: "Фильм рассказывает историю о дружбе между роботом и человеком и что из этого может получиться.", image: "finch", likes: 16, views: 30),
         Post(author: "Sony Pictures", description: "Преподовательница университета противостоит болезни Альцгеймера.", image: "alice", likes: 67, views: 100),
         Post(author: "Neon Entertainment", description: "Безумно богатые пассажиры после крушения лайнера попадают на дикий остров.", image: "sadness", likes: 53, views: 60)
        ]
    }
}
