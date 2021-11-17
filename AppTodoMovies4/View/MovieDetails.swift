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
    
    let bannerImageView: UIImageView = .iconeImageView(width: 220, height: 320)
    let iconFavorite: UIButton = UIButton()
    let titleLabel: UILabel = .textLabel(text: "Title Movie", fontSize: 25, numberOfLines: 2)
    let iconPopularity = UIImageView.iconeImageView(width: 14, height: 14)
    let popularityLabel: UILabel = .textLabel(text: "Popularity", fontSize: 12)
    let iconVoteCount = UIImageView.iconeImageView(width: 12, height: 12)
    let voteCountLabel: UILabel = .textLabel(text: "Vote Count", fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        findMovie()
                
        let imageFavorite = UIImage(named: "favorite")
        let imageFavoriteBorder = UIImage(named: "favorite-border")
        iconFavorite.setImage(imageFavorite, for: .normal)
        iconFavorite.setImage(imageFavoriteBorder, for: .highlighted)
        
        iconPopularity.image = UIImage(named: "star")
        iconVoteCount.image = UIImage(named: "favorite")
        
        titleLabel.textAlignment = NSTextAlignment.left
        
        let popularityStackView = UIStackView(arrangedSubviews:[iconPopularity,
                                                                popularityLabel])
        popularityStackView.distribution = .fill
        popularityStackView.axis = .horizontal
        popularityStackView.setCustomSpacing(5, after: iconPopularity)
        
        let voteCountStackView = UIStackView(arrangedSubviews:[iconVoteCount, voteCountLabel])
        voteCountStackView.distribution = .fill
        voteCountStackView.axis = .horizontal
        voteCountStackView.setCustomSpacing(5, after: iconVoteCount)

        let detailsStackView = UIStackView(arrangedSubviews: [voteCountStackView,
                                                              popularityStackView])
        //detailsStackView.distribution = .fill
        detailsStackView.axis = .horizontal
        detailsStackView.alignment = .top
        
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, iconFavorite])
        titleStackView.distribution = .equalCentering
        titleStackView.axis = .horizontal
        titleStackView.alignment = .top
        
        let stackView = UIStackView(arrangedSubviews: [bannerImageView, titleStackView, detailsStackView])
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.backgroundColor = .black

        self.addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func findMovie() {
        viewModelMovie.getMovieData() { (movie, err) in
            if let movie = movie {
                DispatchQueue.main.async { [weak self] in
                    self?.setupViewData(movie)
                    self?.setupImage(movie)
                }
            }
        }
    }
    
    func setupViewData(_ movie: Movie) {
        self.movieDetails = movie
        self.titleLabel.text = movie.originalTitle
        
        self.popularityLabel.text = "\(movie.popularity ?? 0.0)"
        self.voteCountLabel.text = "\(movie.voteCount ?? 0) Likes"
    }
    
    func setupImage(_ movie: Movie) {
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterUrl = "\(movie.posterPath ?? "")"
        
        let completeUrl = "\(baseUrl)\(posterUrl)"
        
        if let url = URL(string: completeUrl) {
            do {
                let data = try Data(contentsOf: url)
                self.bannerImageView.image = UIImage(data: data)
            } catch {
                print(error)
            }
        }
    }
}
