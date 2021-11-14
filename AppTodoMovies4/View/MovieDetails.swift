//
//  MovieDetails.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 14/11/21.
//

import UIKit

class MovieDetails: UIView {
    var viewModelMovie = MovieViewModel()
    var movieDetails: Movie?
    
    let bannerImageView: UIImageView = .iconeImageView(width: 290, height: 250)
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 16, numberOfLines: 2)
    let popularityLabel: UILabel = .textLabel(text: "Popularity", fontSize: 12)
    let voteCountLabel: UILabel = .textLabel(text: "Vote", fontSize: 12)
    let iconFavorite = UIImageView.iconeImageView(width: 24, height: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        findMovie()
        
        bannerImageView.backgroundColor = UIColor.gray
        iconFavorite.image = UIImage(named: "favorite")
        
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, iconFavorite])
        titleStackView.distribution = .fillProportionally
        titleStackView.axis = .horizontal
        titleStackView.backgroundColor = .black
        
        let detailsStackView = UIStackView(arrangedSubviews: [popularityLabel, voteCountLabel])
        titleStackView.distribution = .fillEqually
        titleStackView.axis = .horizontal
        
        let stackView = UIStackView(arrangedSubviews: [bannerImageView, titleStackView, detailsStackView])
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.backgroundColor = .black
        
        //self.addSubview(bannerImageView)
        self.addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func findMovie() {
        viewModelMovie.getMovieData() { (movie, err) in
            if let movie = movie {
                DispatchQueue.main.async {
                    self.movieDetails = movie
                    self.titleLabel.text = movie.originalTitle
                    self.popularityLabel.text = "\(movie.popularity)"
                    self.voteCountLabel.text = "\(movie.voteCount)"
                    
                    let baseUrl = "https://image.tmdb.org/t/p/w500"
                    let posterUrl = "\(movie.posterPath ?? "")"
                    
                    let teste = "\(baseUrl)\(posterUrl)"
                    
                    if let url = URL(string: teste) {
                        do {
                            let data = try Data(contentsOf: url)
                            self.bannerImageView.image = UIImage(data: data)
                        } catch {
                            print(error)
                        }
                    }
                }
                print(movie)
            }
        }
    }
}
