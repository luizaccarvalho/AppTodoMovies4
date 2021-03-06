//
//  MovieDetailsView.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 14/11/21.
//

import UIKit

class MovieDetailsView: UIView {
    var viewModelMovie = MovieViewModel()
    var movieDetails: Movie?
    
    let bannerImageView: UIImageView = UIImageView()
    let iconFavorite: UIButton = UIButton()
    let titleLabel: UILabel = .textLabel(text: "Title Movie", fontSize: 25, numberOfLines: 2)
    let iconPopularity = UIImageView.iconeImageView(width: 14, height: 14)
    let popularityLabel: UILabel = .textLabel(text: "Popularity", fontSize: 12)
    let iconVoteCount = UIImageView.iconeImageView(width: 12, height: 12)
    let voteCountLabel: UILabel = .textLabel(text: "Vote Count", fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        findMovie()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func findMovie() {
        viewModelMovie.getMovieData() { [weak self] (movie, err) in
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
        
        let voteCount: String = formatValues(value: Double(movie.voteCount ?? 0))
        let popularity: String = formatValues(value: movie.popularity)
        
        self.popularityLabel.text = "\(popularity)"
        self.voteCountLabel.text = "\(voteCount) Likes"
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
    
    func formatValues(value: Double?) -> String {
        let number = value ?? 0.0
        
        let thousand = number / 1000
        let million = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1.0 {
            return "\(round(billion*10)/10)B"
        } else if million >= 1.0 {
            return "\(round(million*10)/10)M"
        } else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        } else {
            return "\(Int(number))"
        }
    }
    
    func setupPopularityStackView() -> UIStackView {
        iconPopularity.image = UIImage(named: "star")

        let popularityStackView = UIStackView(arrangedSubviews:[iconPopularity,
                                                                popularityLabel])
        popularityStackView.distribution = .fill
        popularityStackView.axis = .horizontal
        popularityStackView.setCustomSpacing(5, after: iconPopularity)
        
        return popularityStackView
    }
    
    func setupVoteCountStackView() -> UIStackView {
        iconVoteCount.image = UIImage(named: "favorite")

        let voteCountStackView = UIStackView(arrangedSubviews:[iconVoteCount, voteCountLabel])
        voteCountStackView.distribution = .fill
        voteCountStackView.axis = .horizontal
        voteCountStackView.setCustomSpacing(5, after: iconVoteCount)
        
        return voteCountStackView
    }
    
    func setupDetailsStackView() -> UIStackView {
        let popularityStackView = setupPopularityStackView()
        let voteCountStackView = setupVoteCountStackView()
        
        let detailsStackView = UIStackView(arrangedSubviews: [voteCountStackView,
                                                              popularityStackView])
        detailsStackView.distribution = .fill
        detailsStackView.axis = .horizontal
        detailsStackView.alignment = .top
        
        return detailsStackView
    }
    
    func setupTitleStackView() -> UIStackView {
        let imageFavorite = UIImage(named: "favorite")
        let imageFavoriteBorder = UIImage(named: "favorite-border")
        iconFavorite.setImage(imageFavorite, for: .normal)
        iconFavorite.setImage(imageFavoriteBorder, for: .highlighted)
                
        titleLabel.textAlignment = NSTextAlignment.left

        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, iconFavorite])
        titleStackView.distribution = .equalCentering
        titleStackView.axis = .horizontal
        titleStackView.alignment = .top
        
        return titleStackView
    }
    
    func setupViews() {
        let detailsStackView = setupDetailsStackView()
        let titleStackView = setupTitleStackView()
        
        let stackView = UIStackView(arrangedSubviews: [bannerImageView, titleStackView, detailsStackView])
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .black

        self.addSubview(stackView)
        stackView.superviewFill()
    }
}
