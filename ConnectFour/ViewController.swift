//
//  ViewController.swift
//  ConnectFour
//
//  Created by Mark Wilkinson on 10/21/15.
//  Copyright © 2015 Mark Wilkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameBoardView: GameBoardView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameBoardView = GameBoardView(rows: 6, columns: 7)
        self.view .addSubview(self.gameBoardView!)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[gameboardview]-|", options:NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["gameboardview":self.gameBoardView!]))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.gameBoardView!, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0))
    }
}

