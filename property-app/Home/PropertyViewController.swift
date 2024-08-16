import UIKit

class PropertyViewController: UIViewController {
    
    private let viewModel: PropertyViewModel
    
    init(viewModel: PropertyViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var buyButton: UIButton = {
        return createButton(withImage: "envelope",
                            action: #selector(goToScheduleView),
                            target: self)
    }()
    
    private lazy var sellButton: UIButton = {
        return createButton(withImage: "speaker.plus.fill",
                            action: #selector(goToSellView),
                            target: self)
    }()
    
    private lazy var profileButton: UIButton = {
        return createButton(withImage: "person.crop.circle",
                            action: #selector(goToProfileView),
                            target: self)
    }()
    
    private lazy var buttonsContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: createOptionButtons())
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func goToScheduleView() {
        viewModel.showScheduleView()
    }
    
    @objc func goToSellView() {}
    
    @objc func goToProfileView() {}
    
    private func createButton(withImage imageName: String, action: Selector, target: Any?) -> UIButton {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: imageName), for: .normal)
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
            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }
    
    private func createOptionButtons() -> [UIView] {
        return [
            createButtonContainer(button: buyButton, title: "Agendados"),
            createButtonContainer(button: sellButton, title: "Anunciar"),
            createButtonContainer(button: profileButton, title: "Perfil"),
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(buttonsContainer)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            buttonsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
