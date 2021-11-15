//
//  MovieCell.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 13/11/21.
//

import UIKit

class MovieCell: UITableViewCell {
    var viewModelMovie = MovieViewModel()
    var allGenres: [Genre] = []
    var moviesGenres: [Genre] = []
    
    var movie: Movie? {
        didSet {
            setupCell()
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(width: 90, height: 130)
    let titleLabel: UILabel = .textLabel(text: "Title Movie", fontSize: 16, numberOfLines: 2)
    let dateAndGenresLabel: UILabel = .textLabel(text: "Date and Genres", fontSize: 12)
    let iconCheck: UIImageView = .iconeImageView(width: 5, height: 5)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconCheck.image = UIImage(named: "check")
             
        let titleDetailsStackView = UIStackView(arrangedSubviews: [titleLabel, dateAndGenresLabel])
        titleDetailsStackView.distribution = .fillEqually
        titleDetailsStackView.alignment = .firstBaseline
        titleDetailsStackView.axis = .vertical
        titleDetailsStackView.spacing = 1
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, titleDetailsStackView, iconCheck])
        stackView.distribution = .equalCentering
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        
        addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCell() {
        setupCellData()
        setupCellImage()
    }
    
    func setupCellData() {
        let dateLabel = setupCellDate()
        let genreLabel = setupCellGenre()
        
        titleLabel.text = movie?.originalTitle
        dateAndGenresLabel.text = "\(dateLabel ?? "") \(genreLabel ?? "")"
    }
    
    func setupCellDate() -> String {
        var dateFormatted: String = ""
        
        let date = "\(movie?.releaseDate ?? "")"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let oldDate = dateFormatter.date(from: date)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "yyyy"
        
        dateFormatted = convertDateFormatter.string(from: oldDate!)
        return dateFormatted
    }
    
    func setupCellGenre() -> String {
        findAllGenres()
        
        var genres: String = ""
        
        for id in movie?.genreIds ?? [] {
            if let genre = allGenres.firstIndex(where: { $0.id == id}) {
                moviesGenres.append(allGenres[genre])
            }
        }
        
        for movieGenre in moviesGenres {
            genres += "\(movieGenre.name ?? ""), "
        }
        
        return genres
    }
    
    func findAllGenres() {
        viewModelMovie.getAllGenres { (genres, error) in
            if let genres = genres {
                DispatchQueue.main.async {
                    self.allGenres = genres
                }
            }
        }
    }
    
    func setupCellImage() {
        guard let unrwappedMovie = movie else { return }
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterUrl = "\(unrwappedMovie.posterPath ?? "")"
        
        let completeUrl = "\(baseUrl)\(posterUrl)"
        
        if let url = URL(string: completeUrl) {
            do {
                let data = try Data(contentsOf: url)
                self.iconeImageView.image = UIImage(data: data)
            } catch {
                print(error)
            }
        }
    }
}
