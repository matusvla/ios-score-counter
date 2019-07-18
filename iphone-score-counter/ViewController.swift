//
//  ViewController.swift
//  Score counter
//
//  Created by Vladislav Matus on 18/07/2019.
//  Copyright © 2019 Vladislav Matus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addPlayersLabel: UILabel!
    @IBOutlet weak var playerCollection: UIPlayerCollection!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeNoOfPlayers(_ sender: UIStepper) {
        playerCollection.changeNoOfPlayers(newNo: Int(sender.value))
        if (sender.value > 0) {
            addPlayersLabel.isHidden = true
        } else {
            addPlayersLabel.isHidden = false
        }
    }
}

