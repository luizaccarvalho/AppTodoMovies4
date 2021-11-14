//
//  UIImageView.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 13/11/21.
//

import UIKit

extension UIImageView {
    static func iconeImageView (width: CGFloat = 64, height: CGFloat = 64) -> UIImageView {
        let image = UIImageView()
        image.size(size: .init(width: width, height: width))
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.layer.cornerRadius = 0
        image.clipsToBounds = true
        
        return image
    }
}
