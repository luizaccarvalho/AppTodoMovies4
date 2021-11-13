//
//  MovieViewModel.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation
import RxSwift

public protocol MovieViewModelDelegate: AnyObject {
    func request()
    var movie: Observable<Movie>? { get }
}

class MovieViewModel: MovieViewModelDelegate {
    public weak var dataServiceDelegate: DataServiceDelegate?
    var movie = Observable<Movie>?
    
    func request() {
        dataServiceDelegate?.getMovie { [weak self] movie in
            if let movie = movie
        }
    }
}
