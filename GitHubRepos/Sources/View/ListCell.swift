//
//  ListCell.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit

final class ListCell: UITableViewCell {
    
    // UI
    private let background = ListCell.background
    private let container = ListCell.container
    private let headerContainer = ListCell.headerContainer
    private let spacer = ListCell.spacer
    private let nameLabel = ListCell.nameLabel
    private let loginLabel = ListCell.loginLabel
    private let descLabel = ListCell.descLabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
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
        
        // Spacer
        spacer.backgroundColor = item.fork ? .white:#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        // Labels
        nameLabel.text = item.name
        loginLabel.text = item.login
        descLabel.text = item.desc
    }
}

// MARK: - UI
extension ListCell {
    private func setupView() {
        
        // Cell
        selectionStyle = .none
        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        preservesSuperviewLayoutMargins = false
        
        // Add views
        addSubview(background)
        background.addSubview(container)
        headerContainer.addArrangedSubview(nameLabel)
        headerContainer.addArrangedSubview(loginLabel)
        container.addArrangedSubview(headerContainer)
        container.addArrangedSubview(spacer)
        container.addArrangedSubview(descLabel)

        setupLayout()
    }
    
    private func setupLayout() {
        background.anchor(top: topAnchor, paddingTop: 5,
                          bottom: bottomAnchor, paddingBottom: 5,
                          left: leftAnchor, paddingLeft: 20,
                          right: rightAnchor, paddingRight: 20)
        
        container.anchor(top: background.topAnchor, paddingTop: 15,
                         bottom: background.bottomAnchor, paddingBottom: 15,
                         left: background.leftAnchor, paddingLeft: 10,
                         right: background.rightAnchor, paddingRight: 10)
        
        spacer.anchor(height: 1)
    }
    
    private func resetView() {
        
        // Background
        background.backgroundColor = .white
        
        // Spacer
        spacer.backgroundColor = .lightGray
        
        // Labels
        nameLabel.text = ""
        loginLabel.text = ""
        descLabel.text = ""
    }
}

// MARK: - UIView
private extension UIView {
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
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }
    
    static var headerContainer: UIStackView {
        let stack = UIStackView(frame: CGRect.zero)
        stack.alignment = .bottom
        stack.distribution = .fill
        stack.axis = .horizontal
        return stack
    }
    
    static var spacer: UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }
    
    static var nameLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }
    
    static var loginLabel: UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }
    
    static var descLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }
}
