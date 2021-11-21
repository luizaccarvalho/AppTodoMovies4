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
    var detailView: UIView = MovieDetailsView(frame: CGRect.zero)
    var safeArea: UILayoutGuide!
    
    var similarMovies: [Movie] = []
    var allGenres: [Genre] = []
    var movieDetails: Movie?
    
    let cellId = "cellId"
    var currentPage: Int = 1
    var totalPages: Int = 1
    var totalResults: Int = 0
    
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
    
    func getAllMovies(page: Int = 1) {
        viewModelMovie.getAllMoviesData(page: page) { (movies, err) in
            if let movies = movies {
                DispatchQueue.main.async {
                    self.currentPage = movies.page
                    self.totalPages = movies.totalPages
                    self.totalResults = movies.totalResults
                    
                    self.similarMovies.append(contentsOf: movies.results)
                    self.tableView.reloadData()
                }
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func calculateIndexPathsToReload(from newSimilarMovies: [Movie]) -> [IndexPath] {
        let startIndex = similarMovies.count - newSimilarMovies.count
        let endIndex = startIndex + newSimilarMovies.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}

extension ViewController: UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell
        cell.movie = self.similarMovies[indexPath.item]
        cell.layer.borderWidth = CGFloat(6)
        //cell.layer.borderColor = tableView.backgroundColor?.cgColor
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
            let nextPage = currentPage + 1
            getAllMovies(page: nextPage)
        }
    }
}
