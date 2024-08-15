import UIKit

class ViewController: UIViewController {
    
    var coordinator: PropertyCoordinator?
    
    private lazy var buyButton: UIButton = {
        return createButton(withImage: "envelope",
                            action: #selector(goToScheduleView),
                            target: self)
    }()
    
    private lazy var sellButton: UIButton = {
        return createButton(withImage: "scissors",
                            action: #selector(goToScheduleView),
                            target: self)
    }()
    
    private lazy var depositButton: UIButton = {
        return createButton(withImage: "arrow.down",
                            action: #selector(goToScheduleView),
                            target: self)
    }()
    
    private lazy var withdrawButton: UIButton = {
        return createButton(withImage: "arrow.up",
                            action: #selector(goToScheduleView),
                            target: self)
    }()
    
    private lazy var moreButton: UIButton = {
        return createButton(withImage: "plus",
                            action: #selector(goToScheduleView),
                            target: self)
    }()
    
    @objc func goToScheduleView() {
        coordinator?.navigateToSchedule()
    }
    
    private func createButton(withImage imageName: String, action: Selector, target: Any?) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
    
    private func createButtonContainer(button: UIButton, title: String) -> UIView {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
        containerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            // Center the button within the container
            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            // Place the label below the button
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }
    
    // Create the array of button containers
    private func createOptionButtons() -> [UIView] {
        return [
            createButtonContainer(button: buyButton, title: "Schedule"),
            createButtonContainer(button: sellButton, title: "Sell"),
            createButtonContainer(button: depositButton, title: "Deposit"),
            createButtonContainer(button: withdrawButton, title: "Withdraw"),
            createButtonContainer(button: moreButton, title: "More")
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Transact"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let stackView = UIStackView(arrangedSubviews: createOptionButtons())
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
