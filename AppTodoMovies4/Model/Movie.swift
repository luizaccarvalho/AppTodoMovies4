//
//  Movie.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation

public struct Movie: Codable {
    let originalTitle: String
    let popularity: Float
    let voteCount: Int
    let backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case popularity
        case voteCount = "vote_count"
        case backdropPath = "backdrop_path"
    }
}
