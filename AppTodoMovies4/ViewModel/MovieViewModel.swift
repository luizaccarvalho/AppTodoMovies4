//
//  MovieViewModel.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Alamofire
import UIKit

class MovieViewModel {
        
    func getAllMoviesData(completion: @escaping ([Movie]?, Error?) -> ()) {
        guard let urlAllMovies =
                URL(string: "https://api.themoviedb.org/3/movie/550/similar?api_key=86467ac62053912b101b62a63bb02660&language=en-US&page=1")
        else { return }
        
        URLSession.shared.dataTask(with: urlAllMovies) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                guard let data = data else { return }
                let movieResponse = try JSONDecoder().decode(Results.self, from: data)
                completion(movieResponse.results, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    func getMovieData(completion: @escaping (Movie?, Error?) -> ()) {
        guard let urlDetailMovie =
                URL(string: "https://api.themoviedb.org/3/movie/550?api_key=86467ac62053912b101b62a63bb02660")
        else { return }
        
        URLSession.shared.dataTask(with: urlDetailMovie) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                guard let data = data else { return }
                let movieResponse = try JSONDecoder().decode(Movie.self, from: data)
                completion(movieResponse, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    func getAllGenres(completion: @escaping ([Genre]?, Error?) -> ()) {
        guard let urlGenres =
                URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=86467ac62053912b101b62a63bb02660")
        else { return }

        URLSession.shared.dataTask(with: urlGenres) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                guard let data = data else { return }
                let genresResponse = try JSONDecoder().decode(Genres.self, from: data)
                completion(genresResponse.genres, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
}
