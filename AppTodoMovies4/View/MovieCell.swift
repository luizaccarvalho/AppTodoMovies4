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
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleGenreStackView = UIStackView(arrangedSubviews: [titleLabel, titleGenreLabel, dateLabel])
        titleGenreStackView.spacing = 5
        titleGenreStackView.axis = .horizontal
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, titleLabel, titleGenreLabel, dateLabel])
        stackView.spacing = 25
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
