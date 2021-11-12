//
//  DataService.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation
import Alamofire

struct DataService {
    
    func requestDetails() {
        let url = "https://api.themoviedb.org/3/movie/550?api_key=86467ac62053912b101b62a63bb02660"
        
        AF.request(url).response {
            response in debugPrint(response)
        }
    }
}
