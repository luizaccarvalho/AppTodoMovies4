//
//  Coordinator.swift
//  AppTodoMovies4
//
//  Created by Luiza  Carvalho on 12/11/21.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    func navigate(to viewController: UIViewController)
}
