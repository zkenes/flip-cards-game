//
//  CardProvider.swift
//  FlipCardsGame
//
//  Created by Zhanserik Kenes on 7/24/20.
//  Copyright © 2020 Zhanserik Kenes. All rights reserved.
//

import Foundation

struct CardProvider {
    static let defaultValues = "🤧😱🧑‍🦳🙆‍♂️🧟‍♂️👩‍❤️‍👩💃👩‍👦👨‍❤️‍👨🧑‍🦼👩‍🍼🧑‍✈️🧕👨🧑‍🔧🧑‍⚕️🧑‍🦳👣👈😻👐👨‍🎓👟👨‍👨‍👧‍👦🧍‍♀️🧑‍🤝‍🧑👯‍♀️👨‍🦳😓🤔🤫😶😑🙄😦😮😲👾☠️✊👍🗣️🖐🙀😼😻😹😸😺🤌👉🧑‍🦳🕵️‍♀️👩‍💼🤵👰‍♀️🧞"
    func generateCards(item: MenuItem) -> String {
        let size = item.rows * item.columns
        let values = CardProvider.defaultValues.prefix(size / 2)
        let map = values + values
        return String(map.shuffled())
    }
}
