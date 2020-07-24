//
//  MenuViewController.swift
//  FlipCardsGame
//
//  Created by Zhanserik Kenes on 7/24/20.
//  Copyright © 2020 Zhanserik Kenes. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let menuItemsProvider = MenuItemProvider()
    var menuItems: [MenuItem] {
        get {
            return menuItemsProvider.defaultMenuItems()
        }
    }
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    func updateUI() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = verticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        let heightConstraint = verticalStackView.heightAnchor.constraint(equalToConstant: 400)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func converItem(_ item: MenuItem, index: Int) -> UIButton {
        let button = UIButton()
        let size = CGSize(width: 150, height: 44)
        button.frame = CGRect(origin: .zero, size: size)
        button.setTitleColor(item.color, for: .normal)
        button.setTitle(item.title, for: .normal)
        button.addTarget(self, action: #selector(selectMenu), for: .touchUpInside)
        button.tag = index
        return button
    }
    
    func addMenuComponents() {
        menuItems.enumerated().map { (index, item) -> UIButton in
            return converItem(item, index: index)
        }.forEach { button in
            verticalStackView.addArrangedSubview(button)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(verticalStackView)
        verticalStackView.backgroundColor = .purple
        updateUI()
        addMenuComponents()
    }
    
    @objc func selectMenu(_ sender: UIButton) {
        let index = sender.tag
        let item = menuItems[index]
        let vc = BoardViewController()
        vc.item = item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

