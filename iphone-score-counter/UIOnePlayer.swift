//
//  UIOnePlayer.swift
//  Score counter
//
//  Created by Vladislav Matus on 18/07/2019.
//  Copyright © 2019 Vladislav Matus. All rights reserved.
//

import UIKit

class UIOnePlayer: UIStackView {
    
    private var scoreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInside()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupInside()
    }
    
    @objc private func scoreButtonTapped(button: scoreButton) {
        var score = Int(scoreLabel.text!)!
        score += button.scoreDiff
        scoreLabel.text = String(score)
    }
    
    private func setupInside() {
        
        var addButton,add5Button, subtractButton, subtract5Button: UIButton
        addButton = setupButton(diff: 1, text: "+1")
        add5Button = setupButton(diff: 5, text: "+5")
        subtractButton = setupButton(diff: -1, text: "-1")
        subtract5Button = setupButton(diff: -5, text: "-5")
        scoreLabel.text = "0"
        
        // Add the button to the stack
        addArrangedSubview(subtract5Button)
        addArrangedSubview(subtractButton)
        addArrangedSubview(scoreLabel)
        addArrangedSubview(addButton)
        addArrangedSubview(add5Button)
        
    }
    
    private func setupButton(diff: Int, text: String) -> scoreButton {
        let button = scoreButton()
        button.changeDiff(i: diff)
        button.setTitle(text, for: .normal)
        button.backgroundColor = UIColor.black
        // Add constraints
        button.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(UIOnePlayer.scoreButtonTapped(button:)), for: .touchUpInside)
        
        return button
    }
    
}

private class scoreButton: UIButton {
    var scoreDiff = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeDiff(i: Int) {
        scoreDiff = i
    }
    
}
