//
//  Movie.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation

struct Paged: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decode(Int.self, forKey: .page)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
        results = try values.decode([Movie].self, forKey: .results)
    }
}

struct Movie: Codable {
    let backdropPath: String?
    let posterPath: String?
    let genres: [Genre]?
    let id: Int?
    let originalTitle: String?
    let popularity: Double?
    let voteCount: Int?
    let genreIds: [Int]?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case genres = "genres"
        case id = "id"
        case originalTitle = "original_title"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        genres = try values.decodeIfPresent([Genre].self, forKey: .genres)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
    }
}
