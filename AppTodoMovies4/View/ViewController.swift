//
//  ViewController.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    let detailMovie = UIView()
    var safeArea: UILayoutGuide!
    
    var viewModelMovie = MovieViewModel()
    var similarMovies: [Movie] = []
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupViews()
        
        viewModelMovie.getMovieData()

        viewModelMovie.getAllMoviesData { (movies, err) in
            if let movies = movies {
                DispatchQueue.main.async {
                    self.similarMovies = movies
                    self.tableView.reloadData()
                }
                print(movies)
            }
        }
        tableView.dataSource = self
    }
    
    func setupViews() {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [detailMovie, tableView])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell
        cell.movie = self.similarMovies[indexPath.item]
        return cell
    }
}

