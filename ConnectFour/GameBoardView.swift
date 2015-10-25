//
//  GameBoardView.swift
//  ConnectFour
//
//  Created by Mark Wilkinson on 10/22/15.
//  Copyright © 2015 Mark Wilkinson. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    
    var rows = 1
    var columns = 1
    
    convenience init(rows: Int, columns: Int) {
        self.init()
        self.rows = rows
        self.columns = columns
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        super.updateConstraints()

        let aspectRatio = CGFloat(self.columns / self.rows)
        let aMultiplier = CGFloat(1/aspectRatio)
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: aMultiplier, constant: 0))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[self(>=200)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["self":self]))
    }
}
