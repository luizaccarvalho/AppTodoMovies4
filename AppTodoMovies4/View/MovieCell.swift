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
            
            //TODO: verificar pq esta dando erro
//            DispatchQueue.main.async {
//                if let url = URL(string: self.movie.backdropPath!) {
//                    do {
//                        let data = try Data(contentsOf: url)
//                        self.iconeImageView.image = UIImage(data: data)
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let titleGenreLabel: UILabel = .textLabel(text: "Genero", fontSize: 14)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleGenreStackView = UIStackView(arrangedSubviews: [titleLabel, titleGenreLabel])
        titleGenreStackView.spacing = 8
        titleGenreStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, titleLabel, titleGenreLabel])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.superviewFill()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
