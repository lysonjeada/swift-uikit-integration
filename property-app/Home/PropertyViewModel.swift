import Foundation

class PropertyViewModel {
    weak var coordinator: PropertyCoordinatorProtocol?
    
    init() { }
    
    func showScheduleView() {
        coordinator?.navigateToSchedule()
    }
}
