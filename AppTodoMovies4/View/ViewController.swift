//
//  ViewController.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import UIKit

class ViewController: UIViewController {
    var viewModelMovie = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .blue
        viewModelMovie.getAllMoviesData()
    }
}

