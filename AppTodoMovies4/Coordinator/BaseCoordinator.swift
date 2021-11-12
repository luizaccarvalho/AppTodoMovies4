//
//  BaseCoordinator.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation
import UIKit

public class BaseCoordinator: Coordinator {
    public var configuration: CoordinatorConfiguration
    
    public required init(configuration: CoordinatorConfiguration) {
        self.configuration = configuration
    }
    
    public func navigate(to viewController: UIViewController) {
    
    }
}
