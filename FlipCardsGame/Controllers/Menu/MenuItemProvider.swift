//
//  MenuItemProvider.swift
//  FlipCardsGame
//
//  Created by Zhanserik Kenes on 7/24/20.
//  Copyright © 2020 Zhanserik Kenes. All rights reserved.
//

import Foundation

class MenuItemProvider {
    func defaultMenuItems() -> [MenuItem] {
        return [
            MenuItem(title: "Easy", identifier: "easy", color: .darkGray, columns: 3, rows: 4),
            MenuItem(title: "Medium", identifier: "medium", color: .darkGray, columns: 4, rows: 5),
            MenuItem(title: "Hard", identifier: "hard", color: .darkGray, columns: 5, rows: 6),
            MenuItem(title: "Extreme", identifier: "extreme", color: .darkGray, columns: 6, rows: 7)
        ]
    }
}
