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
    
    let url = "https://api.themoviedb.org/3/movie/550?api_key=86467ac62053912b101b62a63bb02660"
    
    func getAllMoviesData() {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let movieResponse = try JSONDecoder().decode(Movie.self, from: data)
                        print(movieResponse)
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
