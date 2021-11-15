//
//  ViewController.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import UIKit

class ViewController: UIViewController {
    var viewModelMovie = MovieViewModel()
    
    let tableView = UITableView()
    var detailView: UIView = MovieDetails(frame: CGRect.zero)
    var safeArea: UILayoutGuide!
    
    var similarMovies: [Movie] = []
    var allGenres: [Genre] = []
    var movieDetails: Movie?
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
                
        safeArea = view.layoutMarginsGuide
        setupViews()
        getAllMovies()
    }
    
    func setupViews() {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [detailView, tableView])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId)
    }
    
    func getAllMovies() {
        viewModelMovie.getAllMoviesData { (movies, err) in
            if let movies = movies {
                DispatchQueue.main.async {
                    self.similarMovies = movies
                    self.tableView.reloadData()
                }
            }
        }
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(10)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell
        cell.movie = self.similarMovies[indexPath.item]
        cell.layer.borderWidth = CGFloat(6)
        cell.layer.borderColor = tableView.backgroundColor?.cgColor
        return cell
    }
}
