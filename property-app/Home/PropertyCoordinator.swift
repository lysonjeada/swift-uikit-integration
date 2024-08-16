import UIKit

protocol PropertyCoordinatorProtocol: AnyObject {
    func navigateToSchedule()
}

class PropertyCoordinator: PropertyCoordinatorProtocol {
    private var navigationController: UINavigationController
    private let viewModel: PropertyViewModel

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.viewModel = PropertyViewModel()
        viewModel.coordinator = self
    }

    func start() {
        let viewController = PropertyViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }

    func navigateToSchedule() {
        let scheduleViewController = ScheduleViewController()
        navigationController.present(scheduleViewController, animated: true)
    }
}
