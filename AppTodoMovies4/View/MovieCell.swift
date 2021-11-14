//
//  MovieCell.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 13/11/21.
//

import UIKit

class MovieCell: UITableViewCell {
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.originalTitle
            titleGenreLabel.text = "Genero"
            dateLabel.text = movie.releaseDate
            
            //TODO: verificar quando vier null
            DispatchQueue.main.async {
                let baseUrl = "https://image.tmdb.org/t/p/w500"
                let posterUrl = "\(self.movie.posterPath ?? "")"

                let teste = "\(baseUrl)\(posterUrl)"

                if let url = URL(string: teste) {
                    do {
                        let data = try Data(contentsOf: url)
                        self.iconeImageView.image = UIImage(data: data)
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(width: 100, height: 200)
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 16, numberOfLines: 2)
    let titleGenreLabel: UILabel = .textLabel(text: "Genero", fontSize: 12)
    let dateLabel: UILabel = .textLabel(text: "data", fontSize: 12)
    let iconCheck: UIImageView = .iconeImageView(width: 24, height: 24)
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconCheck.image = UIImage(named: "check")
        
        let detailsStackView = UIStackView(arrangedSubviews: [dateLabel, titleGenreLabel])
        detailsStackView.distribution = .fillProportionally
        detailsStackView.axis = .horizontal
        
        let titleDetailsStackView = UIStackView(arrangedSubviews: [titleLabel, detailsStackView])
        titleDetailsStackView.distribution = .fillProportionally
        titleDetailsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, titleDetailsStackView, iconCheck])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .black
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
