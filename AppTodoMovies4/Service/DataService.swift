//
//  DataService.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation
import Alamofire

public protocol DataServiceDelegate: AnyObject {
    func getMovie() -> Movie
}

struct DataService {
    
    func getMovie() -> Movie? {
        let url = "https://api.themoviedb.org/3/movie/550?api_key=86467ac62053912b101b62a63bb02660"
        var movie: Movie
        
        AF.request(url)
            .responseDecodable(of: Movie.self) { response in
                
                guard let movies = response.value else {
                    //estourar exception
                    return
                }
                movie = movies
            }
        return movie
    }
}
