//
//  Coordinator.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 16/01/25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}
