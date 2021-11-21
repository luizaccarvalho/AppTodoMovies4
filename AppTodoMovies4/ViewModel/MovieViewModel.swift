//
//  MovieViewModel.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Alamofire
import UIKit

class MovieViewModel {
    let baseUrl = "https://api.themoviedb.org/3/"
    let apiKey = "86467ac62053912b101b62a63bb02660"
    let idMovie = 550
        
    func getAllMoviesData(page: Int, completion: @escaping (Paged?, Error?) -> ()) {
        let url = "movie/\(idMovie)/similar"
        var urlAllMovies = URLComponents(string: "\(baseUrl)\(url)")
        
        urlAllMovies?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        guard let request = urlAllMovies?.url else { return }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                guard let data = data else { return }
                let movieResponse = try JSONDecoder().decode(Paged.self, from: data)
                completion(movieResponse, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    func getMovieData(completion: @escaping (Movie?, Error?) -> ()) {
        let url = "movie/\(idMovie)"
        var urlDetailMovie = URLComponents(string: "\(baseUrl)\(url)")
        
        urlDetailMovie?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
        ]
        
        guard let request = urlDetailMovie?.url else { return }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
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
        let url = "genre/movie/list"
        var urlGenres = URLComponents(string: "\(baseUrl)\(url)")
        
        urlGenres?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
        ]
        
        guard let request = urlGenres?.url else { return }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
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
