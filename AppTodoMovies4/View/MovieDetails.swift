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
    
    let bannerImageView: UIImageView = .iconeImageView(width: 500, height: 500)
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 16, numberOfLines: 2)
    let popularityLabel: UILabel = .textLabel(text: "Popularity", fontSize: 12)
    let voteCountLabel: UILabel = .textLabel(text: "Vote", fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        
        bannerImageView.backgroundColor = UIColor.gray
        titleLabel.backgroundColor = UIColor.red
        
        let stackView = UIStackView(arrangedSubviews: [bannerImageView, titleLabel, popularityLabel, voteCountLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 2
        
        //self.addSubview(bannerImageView)
        self.addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
