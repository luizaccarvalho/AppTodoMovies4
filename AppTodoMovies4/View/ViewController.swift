//
//  ViewController.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import UIKit
import Alamofire
import RxSwift

class ViewController: UIViewController {
    public weak var viewModel: MovieViewModelDelegate?
    let disposeBag = DisposeBag()
    
    lazy var titleOriginal: UILabel = {
        let label = UILabel()
        //label.text = movie.originalTitle
        label.textColor = .red
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel?.request()
        bindObservable()

        view.addSubview(titleOriginal)
    }
    
    private func bindObservable() {
        viewModel?.movie.subscribeOnMain(by: disposeBag) { [weak self] data in
            guard let self = self else { return }
            self.titleOriginal.text = data.originalTitle
        }
    }
}

