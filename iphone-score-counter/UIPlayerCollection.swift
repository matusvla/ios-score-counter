//
//  UIPlayerCollection.swift
//  Score counter
//
//  Created by Vladislav Matus on 18/07/2019.
//  Copyright © 2019 Vladislav Matus. All rights reserved.
//

import UIKit

class UIPlayerCollection: UIStackView {

    private var players = [UIOnePlayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInside()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupInside()
    }
    
    private func setupInside() {
        // Add the button to the stack
        for p in players {
            addArrangedSubview(p)
        }
    }
    
    func changeNoOfPlayers(newNo: Int) {
        if newNo - players.count > 0 {
            for _ in 1...newNo - players.count {
                addPlayer()
            }
        } else if players.count - newNo > 0 {
            for _ in 1...players.count - newNo {
                removePlayer()
            }
        }
    }
    
    private func addPlayer() {
        let newPlayer = UIOnePlayer()
        players.append(newPlayer)
        addArrangedSubview(newPlayer)
    }
    
    private func removePlayer() {
        players.last!.removeFromSuperview() //todo make bulletproof
        players.removeLast()
    }
}
