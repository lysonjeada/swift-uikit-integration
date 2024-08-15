//
//  PropertyCoordinator.swift
//  property-app
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 13/08/24.
//

import Foundation

import UIKit

class PropertyCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func navigateToSchedule() {
        let scheduleViewController = ScheduleViewController()
        navigationController.present(scheduleViewController, animated: true)
    }
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
