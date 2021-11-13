//
//  MovieViewModel.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Alamofire
import UIKit

class MovieViewModel {
    
    weak var vc: ViewController?
    var similiarMovies = [Movie]()
    
    func getAllMoviesData() {
        let urlAllMovies = "https://api.themoviedb.org/3/movie/550/similar?api_key=86467ac62053912b101b62a63bb02660&language=en-US&page=1"
        
        URLSession.shared.dataTask(with: URL(string: urlAllMovies)!) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let moviesResponse = try
                            JSONDecoder().decode(Results.self, from: data)
//                        for modelMovies in moviesResponse.results{
//                            self.similiarMovies.append(modelMovies)
//                        }
                        self.similiarMovies.append(contentsOf: moviesResponse.results)
                        print(self.similiarMovies)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
    func getMovieData() {
        let urlMovie = "https://api.themoviedb.org/3/movie/550?api_key=86467ac62053912b101b62a63bb02660"

        URLSession.shared.dataTask(with: URL(string: urlMovie)!) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let movieResponse = try
                            JSONDecoder().decode(Results.self, from: data)
//                        for modelMovies in moviesResponse.results{
//                            self.similiarMovies.append(modelMovies)
//                        }
//                        self.movie = movieResponse
//                        print(self.movie)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
