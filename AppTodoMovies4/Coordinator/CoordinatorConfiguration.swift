//
//  CoordinatorConfiguration.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import UIKit

public class CoordinatorConfiguration {
    public weak var navigationController: UINavigationController?
    public weak var viewController: UIViewController?
    
    public init(navigationController: UINavigationController? = nil,
                viewController: UIViewController? = nil) {
        self.viewController = viewController
        self.navigationController = navigationController
    }
}
