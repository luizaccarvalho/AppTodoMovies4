//
//  Genres.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 13/11/21.
//

import Foundation

struct Genres: Codable {
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        genres = try values.decode([Genre].self, forKey: .genres)
    }
}

struct Genre: Codable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
