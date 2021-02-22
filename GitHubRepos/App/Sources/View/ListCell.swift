//
//  ListCell.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit
import Combine

final class ListCell: UITableViewCell {
    
    // UI
    private let background = ListCell.background
    private let container = ListCell.container
    private let avatarView = ListCell.avatarView
    private let indicator = ListCell.indicator
    private let labelsContainer = ListCell.labelsContainer
    private let spacer = ListCell.spacer
    private let nameLabel = ListCell.nameLabel
    private let loginLabel = ListCell.loginLabel
    private let descLabel = ListCell.descLabel
    
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetView()
    }
}

// MARK: - ReusableCell
extension ListCell: ReusableCell {}

// MARK: - ConfigurableCell
extension ListCell: ConfigurableCell {
    func configure(_ item: ListItem) {
        
        // Background
        background.backgroundColor = item.fork ? #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1):.white
        
        // Activity Indicator
        indicator.startAnimating()
        
       // Spacer
        spacer.backgroundColor = item.fork ? .white:#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        // Labels
        nameLabel.text = item.name
        loginLabel.text = item.login
        descLabel.text = item.desc
        
        // Image View
        cancellable = loadImage(for: item)
            .sink { [weak self] image in
                self?.showImage(image: image)
            }
    }
}

// MARK: - ImageLoader
extension ListCell: ImageLoaderInjected {
    
    private func showImage(image: UIImage?) {
        indicator.stopAnimating()
        avatarView.alpha = 0.0
        animator?.stopAnimation(false)
        avatarView.image = image
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3,
                                                                  delay: 0,
                                                                  options: .curveLinear,
                                                                  animations: {
            self.avatarView.alpha = 1.0
        })
    }
    
    private func loadImage(for item: ListItem) -> AnyPublisher<UIImage?, Never> {
        return Just(item.avatarUrl)
            .flatMap { url -> AnyPublisher<UIImage?, Never> in
                self.imageLoader.loadImage(from: url)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - UI
private extension ListCell {
    
    func setupView() {
        
        // Cell
        selectionStyle = .none
        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        preservesSuperviewLayoutMargins = false
        
        // Add views
        addSubview(background)
        background.addSubview(container)
        
        avatarView.addSubview(indicator)
        
        container.addArrangedSubview(avatarView)
        container.addArrangedSubview(labelsContainer)
        
        labelsContainer.addArrangedSubview(nameLabel)
        labelsContainer.addArrangedSubview(loginLabel)
        labelsContainer.addArrangedSubview(spacer)
        labelsContainer.addArrangedSubview(descLabel)

        setupLayout()
    }
    
    func setupLayout() {
        background.anchor(top: topAnchor, paddingTop: 5,
                          bottom: bottomAnchor, paddingBottom: 5,
                          left: leftAnchor, paddingLeft: 20,
                          right: rightAnchor, paddingRight: 20)
        
        container.anchor(top: background.topAnchor, paddingTop: 15,
                         bottom: background.bottomAnchor, paddingBottom: 15,
                         left: background.leftAnchor, paddingLeft: 10,
                         right: background.rightAnchor, paddingRight: 10)
        
        indicator.anchor(centerX: avatarView.centerXAnchor, centerY: avatarView.centerYAnchor)
        avatarView.anchor(width: 50, height: 50)
        
        spacer.anchor(height: 1)
    }
    
    func resetView() {
        
        // Background
        background.backgroundColor = .white

        // Spacer
        spacer.backgroundColor = .white
        
        // Labels
        nameLabel.text = ""
        loginLabel.text = ""
        descLabel.text = ""
        
        // Image View
        cancellable?.cancel()
        animator?.stopAnimation(true)
    }
}

// MARK: - Components
private extension ListCell {
    static var background: UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.20
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }
    
    static var container: UIStackView {
        let stack = UIStackView(frame: CGRect.zero)
        stack.spacing = 10
        stack.alignment = .top
        stack.axis = .horizontal
        return stack
    }
    
    static var avatarView: UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        return imageView
    }
    
    static var indicator: UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .medium)
    }
    
    static var labelsContainer: UIStackView {
        let stack = UIStackView(frame: CGRect.zero)
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }
    
    static var nameLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }
    
    static var loginLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }
    
    static var spacer: UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }
    
    static var descLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }
}
